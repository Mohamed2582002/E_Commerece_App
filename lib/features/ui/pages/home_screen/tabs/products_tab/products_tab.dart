import 'package:e_commerece/core/di/di.dart';
import 'package:e_commerece/core/utils/app_colors.dart' show AppColors;
import 'package:e_commerece/core/utils/app_routes.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/products_tab/Cubit/Product_tab_states.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/products_tab/Cubit/Product_tab_view_model.dart';
import 'package:e_commerece/features/ui/widgets/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTab extends StatelessWidget {
  ProductTabViewModel viewModel = getIt<ProductTabViewModel>() ;

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
      body: BlocBuilder<ProductTabViewModel,ProductTabStates>(
        bloc: viewModel..getAllProducts(),
        builder: (context ,state){
          if(state is ProductErrorState){
            return Center(child: Text(state.failures.errorMessage),);
          }else if(state is ProductSuccessState){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child:GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2/3.2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,),
                        itemCount: state.responseEntity.data!.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, AppRoutes.productDetailsRoute,
                              arguments: state.responseEntity.data![index]);
                            },
                            child: ProductTabItem(product: state.responseEntity.data![index],),
                          );
                        }
                    ) ),
              ],
            );
          } else {
            return  Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) ;
          }

        },
      ),
    );
  }
}
