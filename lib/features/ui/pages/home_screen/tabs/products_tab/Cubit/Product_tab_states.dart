
import 'package:e_commerece/core/errors/faliurs.dart' show Failures;
import 'package:e_commerece/doman/entities/ProductResponseEntitiy.dart';

abstract class ProductTabStates {}

class ProductInitialState extends ProductTabStates {}
class ProductLoadingState extends ProductTabStates {}
class ProductErrorState extends ProductTabStates {
  Failures failures ;
  ProductErrorState({required this.failures}) ;
}
class ProductSuccessState extends ProductTabStates {
  ProductResponseEntity responseEntity ;
  ProductSuccessState({required this.responseEntity});
}