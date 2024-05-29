// ignore_for_file: cascade_invocations, use_colored_box

import 'package:flutter/material.dart';

class AccountItemCard extends StatelessWidget {
  const AccountItemCard({
    super.key,
    required this.color,
    required this.icon,
    required this.name,
    required this.onTap,
  });

  final Color color;
  final String icon;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: color,
                    child: CustomPaint(
                      size: Size.infinite,
                      painter: _Painter(
                        color: Colors.white30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                    icon,
                    height: size.width * 0.25,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

class _Painter extends CustomPainter {
  _Painter({
    required this.color,
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = color;
    final path1 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
