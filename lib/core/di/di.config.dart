// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../date/date_sources/remote_date_sources/auth_remote_date_source_impl.dart'
    as _i55;
import '../../date/date_sources/remote_date_sources/home_remote_date_source_impl.dart'
    as _i698;
import '../../date/repositiers/auth_repositiers_impl.dart' as _i74;
import '../../date/repositiers/home_repositiers_impl.dart' as _i85;
import '../../doman/repostieries/auth/auth_repository.dart' as _i538;
import '../../doman/repostieries/date_sources/remote_date_sources/auth_remote_date_source.dart'
    as _i338;
import '../../doman/repostieries/date_sources/remote_date_sources/home_remote_date_source.dart'
    as _i896;
import '../../doman/repostieries/home/home_repostieries.dart' as _i251;
import '../../doman/useCases/get_all_brands_use_case.dart' as _i767;
import '../../doman/useCases/get_all_categories_use_case.dart' as _i17;
import '../../doman/useCases/get_all_products_use_case.dart' as _i841;
import '../../doman/useCases/login_use_case.dart' as _i569;
import '../../doman/useCases/register_use_case.dart' as _i940;
import '../../features/ui/auth/login/cubit/login-view_model.dart' as _i173;
import '../../features/ui/auth/register/cubit/register-view_model.dart' as _i4;
import '../../features/ui/pages/home_screen/tabs/home_tab/Cubit/home_tab_view_model.dart'
    as _i460;
import '../../features/ui/pages/home_screen/tabs/products_tab/Cubit/Product_tab_view_model.dart'
    as _i108;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i338.AuthRemoteDateSource>(() =>
        _i55.AuthRemoteDateSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i896.HomeRemoteDateSource>(() =>
        _i698.HomeRemoteDateSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i538.AuthRepository>(() => _i74.AuthRepositoryImpl(
        authRemoteDateSource: gh<_i338.AuthRemoteDateSource>()));
    gh.factory<_i251.HomeRepostiery>(() => _i85.HomeRepositoryImpl(
        homeRemoteDateSource: gh<_i896.HomeRemoteDateSource>()));
    gh.factory<_i569.LoginUseCase>(
        () => _i569.LoginUseCase(authRepository: gh<_i538.AuthRepository>()));
    gh.factory<_i940.RegisterUseCase>(() =>
        _i940.RegisterUseCase(authRepository: gh<_i538.AuthRepository>()));
    gh.factory<_i173.LoginViewModel>(
        () => _i173.LoginViewModel(loginUseCase: gh<_i569.LoginUseCase>()));
    gh.factory<_i767.GetAllBrandsUseCase>(() =>
        _i767.GetAllBrandsUseCase(homeRepostiery: gh<_i251.HomeRepostiery>()));
    gh.factory<_i17.GetAllCategoriesUseCase>(() => _i17.GetAllCategoriesUseCase(
        homeRepostiery: gh<_i251.HomeRepostiery>()));
    gh.factory<_i841.GetAllProductsUseCase>(() => _i841.GetAllProductsUseCase(
        homeRepostiery: gh<_i251.HomeRepostiery>()));
    gh.factory<_i460.HomeTabViewModel>(() => _i460.HomeTabViewModel(
          getAllCategoriesUseCase: gh<_i17.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i767.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i108.ProductTabViewModel>(() => _i108.ProductTabViewModel(
        getAllProductsUseCase: gh<_i841.GetAllProductsUseCase>()));
    gh.factory<_i4.RegisterViewModel>(() =>
        _i4.RegisterViewModel(registerUseCase: gh<_i940.RegisterUseCase>()));
    return this;
  }
}
