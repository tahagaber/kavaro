import 'package:flutter/material.dart';

class ScannerBoundingBox extends StatefulWidget {
  final Rect initialRect;
  final ValueChanged<Rect> onRectChanged;

  const ScannerBoundingBox({
    Key? key,
    required this.initialRect,
    required this.onRectChanged,
  }) : super(key: key);

  @override
  State<ScannerBoundingBox> createState() => _ScannerBoundingBoxState();
}

class _ScannerBoundingBoxState extends State<ScannerBoundingBox> {
  late Rect _rect;

  final double _cornerSize = 30.0;
  final double _strokeWidth = 3.0;

  @override
  void initState() {
    super.initState();
    _rect = widget.initialRect;
  }

  void _updateRect(Rect newRect) {
    // Prevent negative width/height
    if (newRect.width < 50 || newRect.height < 50) return;

    setState(() {
      _rect = newRect;
    });
    widget.onRectChanged(_rect);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fromRect(
          rect: _rect,
          child: GestureDetector(
            onPanUpdate: (details) {
              _updateRect(_rect.shift(details.delta));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF00E5FF).withOpacity(0.3),
                  width: 1.0,
                ),
                color: const Color(0xFF00E5FF).withOpacity(0.05),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Top Left Corner
                  _buildResizeCorner(
                    alignment: Alignment.topLeft,
                    onPanUpdate: (details) {
                      _updateRect(
                        Rect.fromLTRB(
                          _rect.left + details.delta.dx,
                          _rect.top + details.delta.dy,
                          _rect.right,
                          _rect.bottom,
                        ),
                      );
                    },
                  ),
                  // Top Right Corner
                  _buildResizeCorner(
                    alignment: Alignment.topRight,
                    onPanUpdate: (details) {
                      _updateRect(
                        Rect.fromLTRB(
                          _rect.left,
                          _rect.top + details.delta.dy,
                          _rect.right + details.delta.dx,
                          _rect.bottom,
                        ),
                      );
                    },
                  ),
                  // Bottom Left Corner
                  _buildResizeCorner(
                    alignment: Alignment.bottomLeft,
                    onPanUpdate: (details) {
                      _updateRect(
                        Rect.fromLTRB(
                          _rect.left + details.delta.dx,
                          _rect.top,
                          _rect.right,
                          _rect.bottom + details.delta.dy,
                        ),
                      );
                    },
                  ),
                  // Bottom Right Corner
                  _buildResizeCorner(
                    alignment: Alignment.bottomRight,
                    onPanUpdate: (details) {
                      _updateRect(
                        Rect.fromLTRB(
                          _rect.left,
                          _rect.top,
                          _rect.right + details.delta.dx,
                          _rect.bottom + details.delta.dy,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResizeCorner({
    required Alignment alignment,
    required GestureDragUpdateCallback onPanUpdate,
  }) {
    return Align(
      alignment: alignment,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        child: Container(
          width: _cornerSize,
          height: _cornerSize,
          color: Colors.transparent, // Invisible gesture target layer
          child: CustomPaint(
            painter: _CornerPainter(
              alignment: alignment,
              color: const Color(0xFF00E5FF),
              strokeWidth: _strokeWidth,
            ),
          ),
        ),
      ),
    );
  }
}

class _CornerPainter extends CustomPainter {
  final Alignment alignment;
  final Color color;
  final double strokeWidth;

  _CornerPainter({
    required this.alignment,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final path = Path();

    if (alignment == Alignment.topLeft) {
      path.moveTo(0, size.height);
      path.lineTo(0, 0);
      path.lineTo(size.width, 0);
    } else if (alignment == Alignment.topRight) {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
    } else if (alignment == Alignment.bottomLeft) {
      path.moveTo(0, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
    } else if (alignment == Alignment.bottomRight) {
      path.moveTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    }

    // Add holographic neon shadow
    canvas.drawPath(
      path,
      Paint()
        ..color = color.withOpacity(0.6)
        ..strokeWidth = strokeWidth * 2
        ..style = PaintingStyle.stroke
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CornerPainter oldDelegate) {
    return oldDelegate.alignment != alignment ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
