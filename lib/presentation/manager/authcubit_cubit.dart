import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:testapi/cache/shared_prefrence.dart';
import 'package:testapi/data/repo/remote_repo.dart';
import 'package:testapi/helper/image_picker_helper.dart';

part 'authcubit_state.dart';

class AuthCubit extends Cubit<AuthcubitState> {
  AuthCubit({required this.repo}) : super(AuthcubitInitial());
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpConfirmPassword = TextEditingController();
  TextEditingController signUpName = TextEditingController();
  TextEditingController changePhoneController = TextEditingController();
  TextEditingController changeNameController = TextEditingController();

  String? token;
  String signUpMassage = '';
  RemoteRepo repo;
  File? profilePic;
  Future<void> picKFromGallery() async {
    emit(AuthcubitInitial());
    profilePic = await PickImage.galleryPick();
    emit(UploadImage());
  }

  Future<void> login() async {
    try {
      emit(AuthLoading());
      var data = await repo.login(
          email: loginEmail.text, password: loginPassword.text);
      token = data.token;
      await CacheHelper().setInstance(data: token, key: 'token');
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFail(error: 'please login again later'));
    }
  }

  Future<void> signUp() async {
    if (profilePic != null) {
      try {
        emit(AuthLoading());
        var data = await repo.signUp(
            email: signUpEmail.text,
            password: signUpPassword.text,
            confirmPassword: signUpConfirmPassword.text,
            name: signUpName.text,
            phone: '01015741428',
            profilePic: profilePic!);

        signUpMassage = data.message!;
        log(signUpMassage);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFail(error: 'please try again later'));
      }
    }
  }

  Future<void> updateUser() async {
    try {
      emit(AuthLoading());
      var data = await repo.updateUser(
          name: changeNameController.text,
          phone: changePhoneController.text,
          location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          profilePic: profilePic!);
      signUpMassage = data.message!;
      log('successsssssssssssssssssssssssssssssss');
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFail(error: 'please try again later'));
    }
  }
}
