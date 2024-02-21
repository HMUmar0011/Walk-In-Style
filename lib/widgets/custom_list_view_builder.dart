
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView(
      {super.key,
      required this.itemBuilder,
      required this.itemCount,
      this.padding,
      this.scrollDirection = Axis.vertical,
      required this.physics});

  final Widget? Function(BuildContext, int) itemBuilder;
  final int? itemCount;
  final EdgeInsetsGeometry? padding;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        padding: padding,
        scrollDirection: scrollDirection,
        physics: physics,
        itemBuilder: itemBuilder);
  }
}