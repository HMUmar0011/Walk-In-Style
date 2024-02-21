import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkinstyleapp/screens/home/bloc/home_page_bloc.dart';
import 'package:walkinstyleapp/screens/home/bloc/home_page_bloc_event.dart';
import 'package:walkinstyleapp/screens/home/bloc/home_page_bloc_state.dart';
import 'package:walkinstyleapp/screens/home/component/best_sale_container.dart';
import 'package:walkinstyleapp/screens/home/component/custom_drawer.dart';
import 'package:walkinstyleapp/screens/home/component/custom_home_page_tabs.dart';
import 'package:walkinstyleapp/screens/home/component/new_arrivals_container.dart';
import 'package:walkinstyleapp/screens/home/component/tab_bar_items_view.dart';
import 'package:walkinstyleapp/utilities/app_assets.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/app_text_style.dart';
import 'package:walkinstyleapp/utilities/constants.dart';
import 'package:walkinstyleapp/widgets/custom_app_bar.dart';
import 'package:walkinstyleapp/widgets/custom_sized_box.dart';
import 'package:walkinstyleapp/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BestSaleListItemContainer> listBestSaleContainer = [];
  List<NewSaleListItemContainer> listNewSaleContainer = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundAppColor,
        body: BlocBuilder<HomePageBloc, HomePageBlocState>(builder: (context, state) {
          if (state is HomePageRotationState) {
            return SafeArea(
              child: Stack(children: [
                // ! Custom Drawer Section
                const CustomDrawer(),
                // ! Home Screen Section
                AnimatedContainer(
                  color: AppColors.backgroundAppColor,
                  transform: Matrix4.translationValues(state.xOffset, state.yOffset, 0.0)
                    ..scale(state.isDrawerOpen ? 0.84 : 1.0)
                    ..rotateZ(state.isDrawerOpen ? -50 : 0.0),
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastEaseInToSlowEaseOut,
                  // color: Resources.colors.blue,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.04,
                  ),
                  child: Column(
                    children: [
                      const CustomSizedBox(
                        heightRatio: mediumHeightRatio,
                      ),
                      //Custom App Bar
                      CustomAppBar(
                        leadingIcon: state.isDrawerOpen ? const Icon(Icons.arrow_back) : const Icon(Icons.drag_indicator),
                        leadingCallbackAction: () {
                          BlocProvider.of<HomePageBloc>(context, listen: false).add(HomePageRotationEvent());
                        },
                        centerWidget: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
                          Text(
                            'store location',
                            style: AppTextStyle.smallTextStyle(),
                          ),
                          Text(
                            'Sydney city,Australia',
                            style: AppTextStyle.smallTextStyle(color: AppColors.largeTextColor),
                          )
                        ]),
                        trailingIcon: const Icon(Icons.card_giftcard),
                      ),
                      const CustomSizedBox(
                        heightRatio: smallHeightRatio,
                      ),
                      //!.... Body Started....
                      CustomTextFormField(
                        controller: TextEditingController(),
                        hintText: 'Looking for Shoes ',
                        prefix: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                      ),
                      const CustomSizedBox(),
                      //!.... TAB BAR Controller
                      DefaultTabController(
                          length: 4,
                          child: Column(
                            children: [
                              Material(
                                  shadowColor: Colors.transparent,
                                  color: Colors.transparent,
                                  child: Container(
                                    height: 60,
                                    color: Colors.transparent,
                                    child: TabBar(
                                        physics: const ClampingScrollPhysics(),
                                        isScrollable: true,
                                        tabAlignment: TabAlignment.center,
                                        padding: const EdgeInsets.symmetric(vertical: 5),
                                        unselectedLabelColor: Colors.black,
                                        indicatorSize: TabBarIndicatorSize.label,
                                        dividerColor: const Color.fromARGB(0, 249, 144, 144),
                                        indicator: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppColors.btnColor),
                                        tabs: [
                                          Tab(child: customTabBarItem(tabBarImage: AppAssets.nikeTabBar)),
                                          Tab(child: customTabBarItem(tabBarImage: AppAssets.adidasTabBar)),
                                          Tab(child: customTabBarItem(tabBarImage: AppAssets.pumaTabBar)),
                                          Tab(child: customTabBarItem(tabBarImage: AppAssets.rebookTabBar)),
                                        ]),
                                  ))
                            ],
                          )),
                      const CustomSizedBox(heightRatio: smallHeightRatio),
                      //!...now start shoes display

                      const CustomHomePageTabs()
                    ],
                  ),
                )
              ]),
            );
          } else {
            return Text('something went wrong');
          }
        }),
      ),
    );
  }
}
