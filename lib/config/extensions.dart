import 'dart:math'show Random;

import 'package:flutter/material.dart';

import '../widgets/custom_shadow.dart';

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
