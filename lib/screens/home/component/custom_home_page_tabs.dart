import 'package:flutter/material.dart';
import 'package:walkinstyleapp/screens/home/component/best_sale_container.dart';
import 'package:walkinstyleapp/screens/home/component/new_arrivals_container.dart';
import 'package:walkinstyleapp/screens/home/model/sale_shoes_item_list_model.dart';
import 'package:walkinstyleapp/utilities/app_assets.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/app_text_style.dart';
import 'package:walkinstyleapp/utilities/constants.dart';
import 'package:walkinstyleapp/widgets/custom_sized_box.dart';

class CustomHomePageTabs extends StatefulWidget {
  const CustomHomePageTabs({super.key});

  @override
  State<CustomHomePageTabs> createState() => _CustomHomePageTabsState();
}

class _CustomHomePageTabsState extends State<CustomHomePageTabs> {
  
   List<BestSaleListItemContainer> listBestSaleContainer = [
      BestSaleListItemContainer(ProductShoesHomePage(image: AppAssets.nikeImage1, title: 'BEST SELLER', brand: 'Nike-Jorden', price: 'Rs:40k')),
      BestSaleListItemContainer(ProductShoesHomePage(image: AppAssets.nikeImage1, title: 'BEST SELLER', brand: 'Nike-Jorden', price: 'Rs:40k')),
      BestSaleListItemContainer(ProductShoesHomePage(image: AppAssets.nikeImage1, title: 'BEST SELLER', brand: 'Nike-Jorden', price: 'Rs:40k')),
    ];
    List<NewSaleListItemContainer> listNewSaleContainer = [
      NewSaleListItemContainer(
          saleShoesContainerItems: ProductShoesHomePage(image: AppAssets.nikeImage1, title: 'BEST CHOICE', brand: 'Nike-Jorden', price: 'Rs:40k')),
      NewSaleListItemContainer(
          saleShoesContainerItems: ProductShoesHomePage(image: AppAssets.nikeImage1, title: 'BEST CHOICE', brand: 'Nike-Jorden', price: 'Rs:40k')),
      NewSaleListItemContainer(
          saleShoesContainerItems: ProductShoesHomePage(image: AppAssets.nikeImage1, title: 'BEST SELLER', brand: 'Nike-Jorden', price: 'Rs:40k'))
    ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
           const CustomSizedBox(heightRatio: smallHeightRatio),
                          //!...now start shoes display
                          
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Popular Shoes",
                            style: AppTextStyle.smallTextStyle(color: AppColors.largeTextColor),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const CustomSizedBox(heightRatio: smallHeightRatio),
                          //! List of Shoes Containers
                        SizedBox(
                          height: screenSize.height * 0.3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listBestSaleContainer.length,
                            itemBuilder: (context, index) {
                              return listBestSaleContainer[index];
                            },
                          ),
                        ),
                        const CustomSizedBox(
                          heightRatio: mediumHeightRatio,
                        ),
                          //!...New shoes display
                          
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "New Arrivals",
                            style: AppTextStyle.smallTextStyle(color: AppColors.largeTextColor),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const CustomSizedBox(
                          heightRatio: smallHeightRatio,
                        ),
                          //! New Shoes List
                        SizedBox(
                          height: screenSize.height * 0.18,
                          width: screenSize.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listBestSaleContainer.length,
                            itemBuilder: (context, index) {
                              return listNewSaleContainer[index];
                            },
                          ),
                        ),
                        const CustomSizedBox()
        ],
      ),
    );
  }
}