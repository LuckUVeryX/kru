import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kru/database/database.dart';
import 'package:kru/utils/utils.dart';
import 'package:kru/widgets/atoms/atoms.dart';

class KruTableMarker extends StatelessWidget {
  const KruTableMarker({
    required this.events,
    super.key,
  });

  final List<KruRecord> events;

  @override
  Widget build(BuildContext context) {
    var totalMins = events.fold(0, (prev, e) => prev + e.duration);
    final children = <Widget>[];
    while (totalMins >= 60) {
      totalMins -= 60;
      children.add(
        const SizedBox.square(
          dimension: 4,
          child: CircularProgressIndicator(
            strokeWidth: 1,
            value: 1,
          ),
        ),
      );
    }
    if (totalMins > 0) {
      children.add(
        SizedBox.square(
          dimension: 4,
          child: Transform.rotate(
            angle: pi * -0.5,
            child: CircularProgressIndicator(
              strokeWidth: 1,
              value: totalMins / 60,
            ),
          ),
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children.insertBetween(sp2),
    );
  }
}
