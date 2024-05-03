import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:testapi/data/model/login_data.dart';
import 'package:testapi/data/model/login_response.dart';
import 'package:testapi/data/model/signup_response.dart';

part 'web_service.g.dart';

@RestApi(baseUrl: 'https://food-api-omega.vercel.app/api/v1/user')
abstract class WebService {
  factory WebService(Dio dio, {String baseUrl}) = _WebService;

  @POST('/signin')
  Future<LoginResponse> loginUser(@Body() LoginData loginData);

  @POST('/signup')
  @MultiPart()
  Future<SignUpResponse> signUp({
    @Part() required String name,
    @Part() required String phone,
    @Part() required String email,
    @Part() required String password,
    @Part() required String confirmPassword,
    @Part() required String location,
    @Part() required File profilePic,
  });
  @PATCH('/update')
  @MultiPart()
  Future<SignUpResponse> updateUser(
    @Header('token') String token, 
    @Part() String name,
    @Part() String phone,
    @Part() String location,
    @Part() File profilePic,
  );
 
}
