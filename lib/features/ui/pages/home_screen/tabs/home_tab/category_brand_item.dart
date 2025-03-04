import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/doman/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class CategoryBrandItem extends StatelessWidget {
  CategoryOrBrandEntity item ;
  CategoryBrandItem({required this.item}) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: CachedNetworkImage(
              width: double.infinity ,
              height: 10 ,
              fit: BoxFit.cover ,
              imageUrl: item.image?? "",
              imageBuilder: (context,imageProvider){
                return CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 50,
                );
              },
              placeholder: (context ,url) => const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF06004f) ,
                ),
              ),
              errorWidget: (context ,url ,error) => const Icon(
                Icons.error ,color: Colors.red,
              )
            )
        ),
        SizedBox(height: 8,),
        Expanded(
           flex: 4,
            child: Text(item.name?? "",
            textWidthBasis: TextWidthBasis.longestLine,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14,color: AppColors.primaryDark ,),
            ),),
      ],
    );
  }
}
