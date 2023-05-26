import 'package:flutter/material.dart';
import 'dart:math' show Random;

const Color primaryColor = Colors.pinkAccent;

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(Random().nextInt(length));
}
