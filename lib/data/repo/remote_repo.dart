import 'dart:io';

import 'package:testapi/cache/shared_prefrence.dart';
import 'package:testapi/data/model/login_data.dart';
import 'package:testapi/data/model/login_response.dart';
import 'package:testapi/data/model/signup_response.dart';
import 'package:testapi/data/service/web_service.dart';

class RemoteRepo {
  WebService webService;

  RemoteRepo({required this.webService});

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async =>
      await webService.loginUser(LoginData(email, password));

  Future<SignUpResponse> signUp(
          {required String name,
          required String email,
          required String password,
          required String confirmPassword,
          required String phone,
          required File profilePic}) async =>
      await webService.signUp(
        confirmPassword: confirmPassword,
        email: email,
        location:
            '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
        name: name,
        password: password,
        phone: phone,
        profilePic: profilePic,
      );

  Future<SignUpResponse> updateUser(
          {required String name,
          required String phone,
          required String location,
          required File profilePic}) async =>
      await webService.updateUser(
        '''FOODAPI ${CacheHelper().getString('token')}''',
        name,
        phone,
        location,
        profilePic,
      );
}
