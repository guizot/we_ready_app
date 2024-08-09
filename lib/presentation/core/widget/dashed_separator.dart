import 'package:flutter/material.dart';

class DashedSeparator extends StatelessWidget {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double height;
  final double thickness;

  const DashedSeparator({
    super.key,
    this.color = Colors.black,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
    this.height = 1.0,
    this.thickness = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final dashCount = (constraints.constrainWidth() / (dashWidth + dashSpace)).floor();
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(dashCount, (index) {
                return SizedBox(
                  width: dashWidth,
                  height: height,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(thickness / 2),
                    ),
                  ),
                );
              }),
            );
          },
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
