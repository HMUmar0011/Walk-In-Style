import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shimmer/shimmer.dart';
import 'package:walkinstyleapp/routes/routes.dart';
import 'package:walkinstyleapp/services/firebase_services.dart';
import 'package:walkinstyleapp/utilities/app_assets.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/app_text_style.dart';
import 'package:walkinstyleapp/widgets/custom_sized_box.dart';
import 'package:walkinstyleapp/widgets/custom_toast.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.drawerBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ! Drawer Image  Section
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.white,
                ),
                child: const Image(image: AssetImage(AppAssets.nikeImage3)),
              ),
              const Text(
                  
                "Hey 👐",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.white)),
              // !  Current User Name
              const Text(
                   "Nike Shoes",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              const CustomSizedBox(
                heightRatio: 0.03,
              ),
              //!  Profile
              listTile(
                icon: Icons.home_outlined,
                title: "Profile",
                onTap: () => toastMessage(message: "Profile"),
              ),
              // ! Home Screen
              listTile(
                icon: CupertinoIcons.home,
                title: "Home Page",
                onTap: () => toastMessage(message: "Home Page"),
              ),
              // ! My Cart
              listTile(
                icon: Icons.shopping_cart_checkout_outlined,
                title: "My Cart",
                onTap: () =>toastMessage(message: "My Cart")
              ),
              // ! Favorite
              listTile(
                icon: Icons.favorite_border,
                title: "Favorite",
                onTap: () => toastMessage(message: "Favorite"),
              ),
              // ! Order
              listTile(
                icon: Icons.electric_bike,
                title: "Order",
                onTap: () =>toastMessage(message: "Order"),
              ),
              const CustomSizedBox(
                heightRatio: 0.03,
              ),
              Divider(
                color:AppColors.grey,
                indent: 1,
                endIndent: 0.2,
                thickness: 1,
              ),
              const CustomSizedBox(
                heightRatio: 0.04,
              ),
              // ! LogOut
              listTile(
                icon: Icons.login_outlined,
                title: "LogOut",
                onTap: () {
                  FirebaseServices.auth.signOut().then((value) {
                    GoogleSignIn().signOut();
                    toastMessage(message: "LogOut");
                    
                      Navigator.pushReplacementNamed(
                          context, Routes.login);
                    
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget listTile(
    {String? text,
    required IconData? icon,
    GestureTapCallback? onTap,
    required String title}) {
  return InkWell(
    onTap: onTap,
    child: ListTile(
     leading:Shimmer.fromColors(baseColor: AppColors.white, 
        highlightColor: AppColors.btnColor, child: Icon(
          icon,
          color: Colors.white,
        )),
     
       
      title: Text(title,
          style: AppTextStyle.drawerTextStyle()),
    ),
  );
}


  
