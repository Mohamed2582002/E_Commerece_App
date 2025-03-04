import 'package:bloc/bloc.dart';
import 'package:e_commerece/features/ui/pages/home_screen/Cubit/home_screen_states.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/favourite_tab/favourite_tab.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/home_tab/home_tab.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/products_tab/products_tab.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/user_tab/user_tab.dart';
import 'package:flutter/material.dart';

class HomeScreenViewModel extends Cubit<HomeStates> {
  HomeScreenViewModel(): super(HomeIntiailStates());
  // hold date
  int selectedindex = 0 ;
  List<Widget> bodyList = [
    HomeTab(),
    ProductsTab(),
    FavouriteTab(),
    UserTab(),
  ] ;


  void bottomNavOnTab (int index){
    selectedindex = index ;
   emit(HomeChangeSelectedIndexStates()) ;
  }
}