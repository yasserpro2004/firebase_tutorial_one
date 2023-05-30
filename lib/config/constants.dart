import 'package:flutter/material.dart';
import 'dart:math' show Random;

import '../widgets/widgets.dart';

const Color primaryColor = Colors.pinkAccent;

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(Random().nextInt(length));
}

extension CreateShadow on Iterable<Widget> {
  Iterable<Widget> createShadow() => map(
        (e) => ShadowWidget(
          child: e,
        ),
      );
}
