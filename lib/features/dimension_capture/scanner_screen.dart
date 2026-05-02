import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/depth_slider.dart';
import 'widgets/glass_panel.dart';
import 'widgets/scan_button.dart';
import 'widgets/scanner_bounding_box.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen>
    with SingleTickerProviderStateMixin {
  Rect _boundingBox = const Rect.fromLTWH(60, 150, 240, 360);
  double _depthValue = 50.0;

  late AnimationController _gridAnimationController;
  CameraController? _cameraController;
  String? _cameraError;

  @override
  void initState() {
    super.initState();
    // Configure system UI for immersive camera experience
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    _gridAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        if (mounted)
          setState(() => _cameraError = 'No cameras found on device.');
        return;
      }
      final backCamera = cameras.firstWhere(
        (cam) => cam.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        backCamera,
        ResolutionPreset.max,
        enableAudio: false,
      );

      await _cameraController!.initialize();
      if (mounted) {
        setState(() {
          _cameraError = null;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _cameraError = e.toString();
        });
      }
      debugPrint('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _gridAnimationController.dispose();
    super.dispose();
  }

  void _onConfirmScan() {
    // Holographic scan confirmation logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF00E5FF).withOpacity(0.8),
        content: Text(
          'STL Model Generation Started...\nW: ${_boundingBox.width.toStringAsFixed(1)} | H: ${_boundingBox.height.toStringAsFixed(1)} | D: ${_depthValue.toStringAsFixed(1)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050510), // Deep space black base
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
            shadows: [Shadow(color: Color(0xFF00E5FF), blurRadius: 10)],
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'DIMENSION CAPTURE',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 4,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            shadows: [Shadow(color: Color(0xFFB000FF), blurRadius: 15)],
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Simulated Camera Background Layer
          _buildCameraPreviewBackground(),

          // 2. Interactive Bounding Box for W and H
          ScannerBoundingBox(
            initialRect: _boundingBox,
            onRectChanged: (Rect newRect) {
              setState(() {
                _boundingBox = newRect;
              });
            },
          ),

          // 3. Floating Dimension Reference Panel
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: GlassPanel(
              width: _boundingBox.width,
              height: _boundingBox.height,
              depth: _depthValue,
            ),
          ),

          // 4. Vertical Depth Slider (3D adjustment)
          Positioned(
            right: 20,
            top: MediaQuery.of(context).size.height * 0.35,
            bottom: MediaQuery.of(context).size.height * 0.25,
            child: DepthSlider(
              value: _depthValue,
              onChanged: (val) {
                setState(() {
                  _depthValue = val;
                });
              },
            ),
          ),

          // 5. Bottom Action Area
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(child: ScanButton(onPressed: _onConfirmScan)),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreviewBackground() {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFF0B0E14)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Live camera feed
          if (_cameraError != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Camera Error:\n$_cameraError',
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          else if (_cameraController != null &&
              _cameraController!.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _cameraController!.value.previewSize?.height ?? 1,
                  height: _cameraController!.value.previewSize?.width ?? 1,
                  child: CameraPreview(_cameraController!),
                ),
              ),
            )
          else
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF00E5FF)),
            ),
          // Holographic Grid Overlay
          AnimatedBuilder(
            animation: _gridAnimationController,
            builder: (context, child) {
              return CustomPaint(
                painter: PerspectiveGridPainter(
                  animationValue: _gridAnimationController.value,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PerspectiveGridPainter extends CustomPainter {
  final double animationValue;

  PerspectiveGridPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00E5FF).withOpacity(0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Moving grid effect
    double step = 30;

    // Vertical lines
    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Horizontal moving lines to create a scrolling forward illusion
    double yOffset = animationValue * step;
    for (double y = yOffset; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant PerspectiveGridPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
