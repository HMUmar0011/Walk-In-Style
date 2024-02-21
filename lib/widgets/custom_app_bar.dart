import 'package:flutter/material.dart';
import 'package:walkinstyleapp/utilities/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,this.leadingIcon=const Icon(Icons.arrow_back_ios),this.leadingCallbackAction,this.centerWidget,this.trailingIcon,this.trailingCallbackAction});
final Icon? leadingIcon;  
final Function()? leadingCallbackAction;
final Icon? trailingIcon;  
final Function()? trailingCallbackAction;
final Widget? centerWidget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipOval(
          child: InkWell(
            onTap: leadingCallbackAction,
            child: Container(
              width: screenSize.width * 0.11,
              height: screenSize.height * 0.05,
              color: Colors.white,
              child:  Center(
                child: leadingIcon,
              ),
            ),
          ),
        ),
        centerWidget!=null?
        Expanded(child: SizedBox(
           width: screenSize.width * 0.6,
              height: screenSize.height * 0.05,
          child: FittedBox(child:centerWidget ))):const Text(''),
        trailingIcon!=null?
        ClipOval(
          child: InkWell(
            onTap: trailingCallbackAction,
            child: Container(
              width: screenSize.width * 0.11,
              height: screenSize.height * 0.05,
              color: Colors.white,
              child:Center(
                child:trailingIcon,
              ),
            ),
          ),
        ):const Text(''),
      ],
    );
  }
}
