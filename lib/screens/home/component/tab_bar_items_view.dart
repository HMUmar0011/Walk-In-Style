  // ** TabBar itemView Image function !
  import 'package:flutter/material.dart';
import 'package:walkinstyleapp/widgets/custom_image_view.dart';

Widget customTabBarItem({required String tabBarImage}) {
    return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.transparent, width: 1)),
      child: Align(
          alignment: Alignment.center,
          child: CustomImageView(
            fit: BoxFit.cover,
            imagePath: tabBarImage,
          )),
    );
  }