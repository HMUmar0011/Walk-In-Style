import 'package:flutter/material.dart';
import 'package:walkinstyleapp/utilities/constants.dart';

class CustomSizedBox extends StatelessWidget {
  final num? heightRatio;
  final num? widthRatio;
  final Widget? child;

  const CustomSizedBox({
    super.key,
    this.widthRatio,
    this.heightRatio,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width * (widthRatio ?? 0.01),
      height:screenSize.height * (heightRatio ?? 0.01),
      child: child,
    );
  }
}