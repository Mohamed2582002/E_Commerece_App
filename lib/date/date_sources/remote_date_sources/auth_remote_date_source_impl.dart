import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/api/api_manager.dart';
import 'package:e_commerece/core/api/endPoint.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerece/core/errors/faliurs.dart';
import 'package:e_commerece/date/model/login_response_Dm.dart';
import 'package:e_commerece/date/model/register_response_Dm.dart';
import 'package:e_commerece/doman/repostieries/date_sources/remote_date_sources/auth_remote_date_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDateSource )
class AuthRemoteDateSourceImpl implements AuthRemoteDateSource {
  ApiManager apiManager;

  AuthRemoteDateSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDm>> register(String name,
      String email, String password, String rePassword, String phone) async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        // internet
        var response = await apiManager.postDate(endPoint: EndPoints.signUp,
            body:
            {
              "name": name,
              "email": email,
              "password": password,
              "rePassword": rePassword,
              "phone": phone
            }
        );
        var registerResponse = RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: registerResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'NO Internet collection'));
      }
    }
    catch(e) {
      return Left(ServerError(errorMessage: e.toString())) ;
    }
  }


  @override
  Future<Either<Failures, LoginResponseDm>> login(String email, String password) async{
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        // internet
        var response = await apiManager.postDate(endPoint: EndPoints.signIn,
            body:
            {

              "email": email,
              "password": password,
            }
        );
        var loginResponse = LoginResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorMessage: loginResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'NO Internet collection'));
      }
    }
    catch(e) {
      return Left(Failures(errorMessage: e.toString())) ;
    }
  }
}