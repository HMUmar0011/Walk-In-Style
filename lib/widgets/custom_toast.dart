 import 'package:fluttertoast/fluttertoast.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';

Future<bool?> toastMessage({required String message}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor:AppColors.btnColor,
      textColor: AppColors.white,
      fontSize: 10.0
      );
}