import 'package:bloc/bloc.dart';
import 'package:e_commerece/doman/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerece/doman/useCases/get_all_brands_use_case.dart';
import 'package:e_commerece/doman/useCases/get_all_categories_use_case.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/home_tab/Cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{

  GetAllCategoriesUseCase getAllCategoriesUseCase ;
  GetAllBrandsUseCase getAllBrandsUseCase ;
  HomeTabViewModel({required this.getAllCategoriesUseCase,
    required this.getAllBrandsUseCase}): super(HomeInitialState()) ;

  List<CategoryOrBrandEntity> categoryList = [] ;
  List<CategoryOrBrandEntity> brandList = [] ;

  void getAllCategory() async{
    emit(CategoryLoadingState()) ;
    var either = await getAllCategoriesUseCase.invoke() ;
    either.fold((error){
      emit(CategoryErrorState(failures: error)) ;
    }, (response){
      categoryList =response.data! ;
      emit(CategorySuccessState(responseEntity: response)) ;
    }) ;
  }

  void getAllBrands() async{
    emit(BrandLoadingState()) ;
    var either = await getAllBrandsUseCase.invoke() ;
    either.fold((error){
      emit(BrandErrorState(failures: error)) ;
    }, (response){
      brandList =response.data! ;
      emit(BrandSuccessState(responseEntity: response)) ;
    }) ;
  }
}