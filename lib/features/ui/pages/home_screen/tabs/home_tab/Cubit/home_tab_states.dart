import 'package:e_commerece/core/errors/faliurs.dart';
import 'package:e_commerece/doman/entities/CategoryOrBrandResponseEntity.dart';

abstract class HomeTabStates {}

class HomeInitialState extends HomeTabStates {}
class CategoryLoadingState extends HomeTabStates {}
class CategoryErrorState extends HomeTabStates {
  Failures failures ;
  CategoryErrorState({required this.failures}) ;
}
class CategorySuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity responseEntity ;
  CategorySuccessState({required this.responseEntity});
}



class BrandLoadingState extends HomeTabStates {}
class BrandErrorState extends HomeTabStates {
  Failures failures ;
  BrandErrorState({required this.failures}) ;
}
class BrandSuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity responseEntity ;
  BrandSuccessState({required this.responseEntity});
}
