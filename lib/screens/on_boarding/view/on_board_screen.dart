import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walkinstyleapp/routes/routes.dart';
import 'package:walkinstyleapp/screens/on_boarding/component/custom_page.dart';
import 'package:walkinstyleapp/screens/on_boarding/cubit/page_view_cubit.dart';
import 'package:walkinstyleapp/screens/on_boarding/cubit/page_view_cubit_state.dart';
import 'package:walkinstyleapp/utilities/app_assets.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/app_strings.dart';
import 'package:walkinstyleapp/utilities/app_text_style.dart';
import 'package:walkinstyleapp/utilities/constants.dart';
import 'package:walkinstyleapp/widgets/custom_btn.dart';
import 'package:walkinstyleapp/widgets/custom_sized_box.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});
  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage:
      BlocProvider.of<PageViewCubit>(context,listen: false).selectedIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('developer');
    return Scaffold(
      backgroundColor: AppColors.backgroundAppColor,
      
      body: BlocBuilder<PageViewCubit, PageViewState>(
        
        builder: (context, state) {
          log(state.selectedIndex.toString());
          return SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    children:pages,
                     
                    onPageChanged: (index) {
                       state.selectedIndex = index;
                       log(state.selectedIndex.toString());
                       BlocProvider.of<PageViewCubit>(context, listen: false).changeIndex();
                    },
                  ),
                ),
                // ! Handle this
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColoredBox(
                          color: Colors.transparent,
                          child: SmoothPageIndicator(
                            controller: pageController,
                            count: 3,
                            onDotClicked: (index) {
                              state.selectedIndex = index;
                            },
                            axisDirection: Axis.horizontal,
                            effect: ExpandingDotsEffect(
                              dotColor: AppColors.grey,
                              activeDotColor: AppColors.btnColor,
                            ),
                          ),
                        ),
                        //  ! Custom Button Section .
                        CustomButton(
                          width: screenSize.width * 0.4,
                          buttonText: state.selectedIndex==0 ? 'Get started' : 'Next',
                          onPressed: () {
                            state.selectedIndex += 1;
                            try{
                               if (state.selectedIndex==pages.length-0) {
                               Navigator.pushReplacementNamed(context, Routes.login);
                             }else{
                           // BlocProvider.of<PageViewCubit>(context, listen: false).changeIndex();
                            pageController.animateToPage(state.selectedIndex, 
                            duration: const Duration(milliseconds: 500),
                             curve: Curves.easeIn
                             );
                             }
                             }
                             catch(e){
                              log(e.toString());
                             }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Some Space .
                const CustomSizedBox()
              ],
            ),
          );
        },
      ),
    );
  }
}

List<Widget> get pages {
  
  
  return [
    
    // 1 Page .
    CustomPage(
      imagePath:AppAssets.nikeImage1,
    largeText: AppStrings.screenOneLargeText1,
      largeText2: AppStrings.screenOneLargeText2,
      smallText1: AppStrings.screenOneSmallText1,
      smallText2: AppStrings.screenOneSmallText2,
    ),
    // 2 Page .
    CustomPage(
      imagePath:AppAssets.nikeImage2,
      
         largeText: AppStrings.screenTwoLargeText1,
      largeText2: AppStrings.screenTwoLargeText2,
      smallText1:AppStrings.screenTwoSmallText1,
      smallText2: AppStrings.screenTwoSmallText2,
    ),
    // page 3
    CustomPage(
      imagePath: AppAssets.nikeImage3,
      largeText: AppStrings.screenThirdLargeText1,
      largeText2: AppStrings.screenThirdLargeText2,
      smallText1:AppStrings.screenThirdSmallText1,
      smallText2: AppStrings.screenThirdSmallText2,
    )
  ];
  }
 


Widget textAndNikeBoots(String imageNike) {
  return SizedBox(
    height: screenSize.height * 0.5,
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          left: screenSize.width * 0.4,
          bottom: screenSize.width * 0.4,
          child: Container(
            width: screenSize.width * 1,
            height: screenSize.height * 0.5,
            decoration: const ShapeDecoration(
              shape: OvalBorder(
                side: BorderSide(width: 90, color: Color.fromARGB(255, 226, 242, 251)),
              ),
            ),
          ),
        ),
        // ! Sneaker Nike Text .
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.1),
          child: SizedBox(
            height: screenSize.height * 0.25,
            width: double.infinity,
            child: Opacity(
              opacity: 0.1,
              child: Center(child: Text("NIKE", style: AppTextStyle.nikeTextStyle())),
            ),
          ),
        ),
        // ! Sneaker Image
        Padding(
          padding: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.09, 
        horizontal: screenSize.width * 0.09),
          child: 
        Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(-0.15),
                child:
        Image(
              image: AssetImage(imageNike),
              height: screenSize.height * 0.42,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
           ),
         )
      ],
    ),
  );
}
