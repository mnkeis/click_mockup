import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1,
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.black54
            : Colors.white,
      ),
    );
  }
}
