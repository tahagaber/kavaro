import 'package:flutter/material.dart';

class ScanButton extends StatefulWidget {
  final VoidCallback onPressed;

  const ScanButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<ScanButton> createState() => _ScanButtonState();
}

class _ScanButtonState extends State<ScanButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            transform: Matrix4.identity()..scale(_isPressed ? 0.9 : 1.0),
            alignment: Alignment.center,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFB000FF).withOpacity(0.8),
                  const Color(0xFF00E5FF).withOpacity(0.6),
                ],
                radius: 0.8,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(
                    0xFF00E5FF,
                  ).withOpacity(0.4 + (_controller.value * 0.2)),
                  blurRadius: 20 + (_controller.value * 15),
                  spreadRadius: 5 + (_controller.value * 5),
                ),
                BoxShadow(
                  color: const Color(0xFFB000FF).withOpacity(0.3),
                  blurRadius: 10,
                ),
              ],
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 2,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer rotating border indicator
                Transform.rotate(
                  angle: _controller.value * 2 * 3.14159,
                  child: CustomPaint(
                    size: const Size(80, 80),
                    painter: ScanRingPainter(),
                  ),
                ),

                // Icon
                const Icon(
                  Icons.document_scanner_outlined,
                  color: Colors.white,
                  size: 36,
                  shadows: [Shadow(color: Color(0xFF00E5FF), blurRadius: 10)],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ScanRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..color = const Color(0xFF00E5FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    // Draw arcs
    const double sweepAngle = 3.14159 / 4; // 45 degrees

    canvas.drawArc(rect, 0, sweepAngle, false, paint);
    canvas.drawArc(rect, 3.14159, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
