import 'package:e_commerece/core/di/di.dart';
import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:e_commerece/doman/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/home_tab/Cubit/home_tab_states.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/home_tab/Cubit/home_tab_view_model.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/home_tab/category_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeTab extends StatelessWidget {

  HomeTab({super.key});
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  int index = 0 ;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(80.0), // here the desired height
          child: Padding(
            padding: EdgeInsets.only(top: 11),
            child: AppBar(
             title: TextFormField(
               decoration: InputDecoration(
                 prefixIcon: Icon(Icons.search),
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                 hintText: 'what do you search for?',
               ),
             ),
              actions: [
                IconButton(onPressed: (){},
                    icon: Icon(Icons.shopping_cart,color: AppColors.primaryColor,)),
              ],
            ),
          )
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16,),
            _buildAnnouncement(
                images: [
                  'assets/images/image_home_tab_one.png',
                  'assets/images/image_home_tab_two.png',
                  'assets/images/image_home_tab_one.png',
                ]
            ),
            SizedBox(height: 24,),

            _lineBreak(name: "Categories") ,
            BlocBuilder<HomeTabViewModel, HomeTabStates>(
              bloc: viewModel..getAllCategory(),
              builder: (context, state) {
                return viewModel.categoryList.isEmpty
                    ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
                    : _buildCategoryBrandSec(list: viewModel.categoryList);


              },
            ),

            _lineBreak(name: "Brands") ,
            BlocBuilder<HomeTabViewModel, HomeTabStates>(
              bloc: viewModel..getAllBrands(),
              builder: (context, state) {
                return viewModel.brandList.isEmpty
                    ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
                    : _buildCategoryBrandSec(list: viewModel.brandList);

              },
            )

          ],
        ),
      ),
    );
  }
}

ImageSlideshow _buildAnnouncement({
  required List<String> images }) {
  return ImageSlideshow(
    indicatorColor: AppColors.primaryColor,
    initialPage: 0,
    indicatorBottomPadding: 15,
    indicatorPadding: 8,
    indicatorRadius: 5,
    indicatorBackgroundColor: AppColors.whiteColor,
    isLoop: true,
    autoPlayInterval: 3000,
    height: 190,
    children: images.map((url) {
    return  Image.asset(url ,fit: BoxFit.fill,) ;
      }).toList()) ;
}

Widget _lineBreak({required String name}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(name , style: AppStyles.medium18Header,) ,
      TextButton(onPressed: (){},
          child: Text("View All",style: AppStyles.regular12Text,)) ,
    ],
  );
}


SizedBox  _buildCategoryBrandSec ({required List<CategoryOrBrandEntity> list}) {
  return SizedBox(
    height: 250,
    width: double.infinity,
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 16 , crossAxisSpacing: 10),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context ,index) {
          return CategoryBrandItem(item: list[index]) ;
        }),
  ) ;
}