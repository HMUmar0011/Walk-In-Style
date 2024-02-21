import 'package:flutter/material.dart';
import 'package:walkinstyleapp/screens/home/model/sale_shoes_item_list_model.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/app_text_style.dart';
import 'package:walkinstyleapp/utilities/constants.dart';
import 'package:walkinstyleapp/widgets/custom_image_view.dart';
import 'package:walkinstyleapp/widgets/custom_sized_box.dart';

class BestSaleListItemContainer extends StatelessWidget {
  const BestSaleListItemContainer(this.bestSaleShoesContainerItems, {super.key});

  final ProductShoesHomePage bestSaleShoesContainerItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
      child: Container(
        width: screenSize.width * 0.62,
        height: screenSize.height * 0.3,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(width: 5,strokeAlign: BorderSide.strokeAlignInside,style: BorderStyle.solid,color: Colors.white),
          borderRadius: BorderRadius.circular(25),
           ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomSizedBox(
              heightRatio: smallHeightRatio,
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                child: CustomImageView(
                  imagePath: bestSaleShoesContainerItems.image,
                ),
              ),
            ),
            const CustomSizedBox(
              heightRatio: smallHeightRatio,
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  bestSaleShoesContainerItems.title,
                  style: AppTextStyle.smallTextStyle(color: Colors.blue),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  bestSaleShoesContainerItems.brand,
                  style: AppTextStyle.smallTextStyle(color: Colors.black),
                ),
              ),
            ),
            const CustomSizedBox(
              heightRatio: mediumHeightRatio,
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bestSaleShoesContainerItems.price,
                    style: AppTextStyle.smallTextStyle(),
                  ),
                  ClipOval(
                      child: Container(
                    color: AppColors.btnColor,
                    child: const Center(
                        child: Icon(
                      Icons.add,
                      color: AppColors.white,
                    )),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:walkinstyleapp/utilities/app_assets.dart';
// import 'package:walkinstyleapp/utilities/app_colors.dart';
// import 'package:walkinstyleapp/utilities/app_text_style.dart';
// import 'package:walkinstyleapp/utilities/constants.dart';
// import 'package:walkinstyleapp/widgets/custom_sized_box.dart';

// Widget bestSaleContainer(){
//   return Container(
//     padding: EdgeInsets.all(8),
//              width: 200,
//             height: 200,
//             decoration: BoxDecoration(
//               color: Colors.amber,
//               borderRadius: BorderRadius.circular(30)),
//               child: Stack(
//                 children: [
//                   Column(
//                     children: [
//                       Expanded(child: Center(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(image: AssetImage(AppAssets.nikeImage1))
//                           ),
//                         ),
//                       )),
//                       Align(alignment: Alignment.centerLeft
//                         ,child: Text('BEST SELLER',
//                         style:AppTextStyle.smallTextStyle(color: AppColors.btnColor),)),
//                          Align(alignment: Alignment.centerLeft
//                         ,child: Text('Nike Jordan',
//                         style:AppTextStyle.smallTextStyle(color: Colors.black),)),
//                         CustomSizedBox(heightRatio: mediumHeightRatio,),
//                          Align(alignment: Alignment.centerLeft
//                         ,child: Text('Rs 4000',
//                         style:AppTextStyle.smallTextStyle(color: AppColors.btnColor),))
//                         ,Positioned(
//                           bottom: 0,
//                           right: 0,
//                           child: Container(color: Colors.blue,child: const Center(child: Icon(Icons.favorite)),))
//                     ],
//                   )
//                 ],
//               ),
//           );
// }