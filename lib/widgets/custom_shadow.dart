import 'package:flutter/material.dart';

class ShadowWidget extends StatelessWidget {
  final Widget child;
  const ShadowWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 8,
      color: Colors.transparent,
      shadowColor: Colors.grey.shade400,
      borderRadius: BorderRadius.circular(15),
      child: child,
    );
  }
}
