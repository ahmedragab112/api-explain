part of 'authcubit_cubit.dart';

abstract class AuthcubitState {
  const AuthcubitState();
}

class AuthcubitInitial extends AuthcubitState {}

class AuthLoading extends AuthcubitState {}

class AuthSuccess extends AuthcubitState {}

class AuthFail extends AuthcubitState {
  final String error; 
  AuthFail({required this.error});
}

class UploadImage extends AuthcubitState {}