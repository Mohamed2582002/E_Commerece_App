import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerece/doman/entities/ProductResponseEntitiy.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/products_tab/Cubit/Product_tab_view_model.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import 'custom_txt.dart';

class ProductTabItem extends StatelessWidget {
  ProductEntity product ;
  ProductTabItem({required this.product}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary300Pacity, width: 2)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  width: 191,
                  height: 120,
                  fit: BoxFit.cover,
                  imageUrl: product.imageCover??"",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: AppColors.redColor,
                  ),
                ),
              ),
              Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    radius: 20,
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            // todo add to favorite
                          },
                          color: AppColors.primaryColor,
                          padding: EdgeInsets.zero,
                          iconSize: 30,
                          // Adjust icon size as needed
                          icon: const Icon(
                            Icons.favorite_border_rounded,
                            color: AppColors.primaryColor,
                          )),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTxt(
                  text: product.title ?? '',
                  fontSize: 12,
                ),
                SizedBox(
                  height: 1,
                ),
                Row(children: [
                  CustomTxt(
                    text: "EGP ${product.price}",
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CustomTxt(
                    text: "EGP ${product.price! * 2}",
                    textStyle: AppStyles.regular11SalePrice
                        .copyWith(decoration: TextDecoration.lineThrough),
                  ),
                ]),
                SizedBox(
                  height: 1,
                ),
                Row(
                  children: [
                    CustomTxt(
                      text: "Review (${product.ratingsAverage})",
                      fontSize: 12,
                    ),
                    Icon(
                      Icons.star,
                      color: AppColors.yellowColor,
                      size: 25,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    InkWell(
                      onTap: () {
                        //   todo add to cart
                        // ProductTabViewModel.get(context)
                        //     .addToCart(product.id ?? '');
                      },
                      splashColor: Colors.transparent,
                      child: Icon(
                        Icons.add_circle,
                        size: 32,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
