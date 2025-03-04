import 'package:bloc/bloc.dart';
import 'package:e_commerece/doman/entities/ProductResponseEntitiy.dart';
import 'package:e_commerece/doman/useCases/get_all_products_use_case.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/products_tab/Cubit/Product_tab_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates>{

  GetAllProductsUseCase getAllProductsUseCase ;
  ProductTabViewModel({required this.getAllProductsUseCase}): super(ProductInitialState()) ;

  List<ProductEntity> productList = [] ;


  void getAllProducts() async{
    emit(ProductLoadingState()) ;
    var either = await getAllProductsUseCase.invoke() ;
    either.fold((error){
      emit(ProductErrorState(failures: error)) ;
    }, (response){
      productList =response.data! ;
      emit(ProductSuccessState(responseEntity: response)) ;
    }) ;
  }
}