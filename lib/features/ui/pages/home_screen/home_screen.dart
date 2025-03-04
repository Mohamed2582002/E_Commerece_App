import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/features/ui/pages/home_screen/Cubit/home_screen_states.dart';
import 'package:e_commerece/features/ui/pages/home_screen/Cubit/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel,HomeStates>(
      bloc: viewModel,
      builder: (context,state){
        return  Scaffold(
          body: Padding(padding: EdgeInsets.symmetric(horizontal: 10) ,
            child: viewModel.bodyList[viewModel.selectedindex],) ,

          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Theme(data: Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
                child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    elevation: 0,
                    currentIndex: viewModel.selectedindex,
                    onTap: viewModel.bottomNavOnTab,
                    iconSize: 24,
                    items: [
                      _bottomNavBarItemBuilder(
                          isSelected: viewModel.selectedindex  == 0,
                          selectedIcon: 'assets/icons/home_icon_selected.png',
                          unSelectedIcon: 'assets/icons/home_icon_unselected.png') ,

                      _bottomNavBarItemBuilder(
                          isSelected: viewModel.selectedindex  == 1,
                          selectedIcon: 'assets/icons/category_icon_selected.png',
                          unSelectedIcon: 'assets/icons/category_icon_unselected.png') ,

                      _bottomNavBarItemBuilder(
                          isSelected: viewModel.selectedindex  == 2,
                          selectedIcon: 'assets/icons/favourite_icon_selected.png',
                          unSelectedIcon: 'assets/icons/favourite_icon_unselected.png') ,

                      _bottomNavBarItemBuilder(
                          isSelected: viewModel.selectedindex  == 3,
                          selectedIcon: 'assets/icons/account_icon_selected.png',
                          unSelectedIcon: 'assets/icons/account_icon_unselected.png') ,
                    ]
                )),
          ),

        );
      },
    );
  }
}

BottomNavigationBarItem _bottomNavBarItemBuilder ({
  required bool isSelected ,
  required String selectedIcon ,
  required String unSelectedIcon }) {
  return BottomNavigationBarItem(
      icon: CircleAvatar(
        foregroundColor: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
        backgroundColor: isSelected ? AppColors.whiteColor : Colors.transparent,
        radius: 25,
        child: Image.asset(isSelected ? selectedIcon: unSelectedIcon),
      ),
    label: "",
  ) ;
}