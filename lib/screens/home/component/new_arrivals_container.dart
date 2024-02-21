import 'package:flutter/material.dart';
import 'package:walkinstyleapp/screens/home/model/sale_shoes_item_list_model.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/app_text_style.dart';
import 'package:walkinstyleapp/utilities/constants.dart';
import 'package:walkinstyleapp/widgets/custom_image_view.dart';
import 'package:walkinstyleapp/widgets/custom_sized_box.dart';

class NewSaleListItemContainer extends StatelessWidget {
  const NewSaleListItemContainer({required this.saleShoesContainerItems, super.key});

  final ProductShoesHomePage saleShoesContainerItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: Container(
        width: screenSize.width * 0.8,
        height: screenSize.height * 0.5,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(width: 5, strokeAlign: BorderSide.strokeAlignInside, style: BorderStyle.solid, color: Colors.white),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSizedBox(
                    heightRatio: smallHeightRatio,
                  ),
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        child: Text(
                          saleShoesContainerItems.title,
                          style: AppTextStyle.smallTextStyle(color: Colors.blue,size: screenSize.height*0.018),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        child: Text(
                          saleShoesContainerItems.brand,
                          style: AppTextStyle.smallTextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const CustomSizedBox(
                    heightRatio: mediumHeightRatio,
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      saleShoesContainerItems.price,
                      style: AppTextStyle.smallTextStyle(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                child: CustomImageView(
                  imagePath: saleShoesContainerItems.image,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


