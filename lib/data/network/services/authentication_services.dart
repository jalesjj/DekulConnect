// lib/data/network/services/authentication_services.dart
import 'package:dekul_connect_app/base/base.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:dekul_connect_app/data/data.dart';
import 'package:dekul_connect_app/resources/resources.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_services.g.dart';

@RestApi()
abstract class AuthenticationServices {
  factory AuthenticationServices(Dio dio) = _AuthenticationServices;

  @POST(AuthenticationConstant.login) // POST ke endpoint "/login" ;;
  Future<BaseResponse<Authentication>> login(@Body() Login login);

  @POST(AuthenticationConstant.logout) // POST ke endpoint "/logout" ;
  Future<BaseResponse> logout();

  @GET(AuthenticationConstant.me) // GET ke endpoint "/me" ;
  Future<BaseResponse<User>> me();
}
