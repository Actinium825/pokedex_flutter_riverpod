import 'package:flutter/material.dart';
import 'package:pokedex_flutter_riverpod/utils/const.dart';

class EeveeArrows extends StatelessWidget {
  const EeveeArrows({
    required this.pi,
    super.key,
  });

  final double pi;

  @override
  Widget build(BuildContext context) {
    final isTopArrows = pi.isNegative;
    return Padding(
      padding: EdgeInsets.only(
        bottom: isTopArrows ? 8 : 0,
        top: isTopArrows ? 0 : 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: eeveeArrowsDivisors.map(
          (divisor) {
            return Transform.rotate(
              angle: pi / divisor,
              child: const Icon(Icons.arrow_circle_right),
            );
          },
        ).toList(),
      ),
    );
  }
}
