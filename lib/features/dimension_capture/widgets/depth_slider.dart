import 'package:flutter/material.dart';

class DepthSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const DepthSlider({Key? key, required this.value, required this.onChanged})
    : super(key: key);

  @override
  State<DepthSlider> createState() => _DepthSliderState();
}

class _DepthSliderState extends State<DepthSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  void _handleDrag(DragUpdateDetails details, double height) {
    // Reverse the drag for vertical slide (up is more depth)
    final double change = -details.delta.dy / height * 100;
    final newValue = (widget.value + change).clamp(0.0, 100.0);
    widget.onChanged(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowController,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double height = constraints.maxHeight;
            if (height.isInfinite) {
              height = 300;
            }

            return GestureDetector(
              onVerticalDragUpdate: (details) => _handleDrag(details, height),
              child: Container(
                width: 60,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFF00E5FF).withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Dial Background
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: CustomPaint(painter: DepthTicksPainter()),
                      ),
                    ),

                    // Fill level
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: (widget.value / 100.0) * height,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              const Color(0xFF00E5FF).withOpacity(0.1),
                              const Color(0xFFB000FF).withOpacity(0.5),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),

                    // Knob handle
                    Positioned(
                      bottom: (widget.value / 100.0) * height - 20,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          border: Border.all(
                            color: const Color(0xFFB000FF),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFB000FF).withOpacity(
                                0.5 + (_glowController.value * 0.3),
                              ),
                              blurRadius: 15,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.unfold_more,
                            color: const Color(0xFF00E5FF),
                            size: 20,
                          ),
                        ),
                      ),
                    ),

                    // Depth Value Text
                    Positioned(
                      top: -30,
                      child: Text(
                        'D: ${widget.value.toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: Color(0xFFB000FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          shadows: [
                            Shadow(blurRadius: 10, color: Color(0xFFB000FF)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class DepthTicksPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..strokeWidth = 1;

    int tickCount = 20;
    double spacing = size.height / tickCount;

    for (int i = 1; i < tickCount; i++) {
      double y = i * spacing;
      double dashWidth = (i % 5 == 0) ? 20 : 10;

      canvas.drawLine(
        Offset(size.width / 2 - dashWidth / 2, y),
        Offset(size.width / 2 + dashWidth / 2, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
