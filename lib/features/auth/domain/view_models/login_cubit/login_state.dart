import 'package:equatable/equatable.dart';

import '../../../data/models/login_model/login_response_model.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginStateLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  final LoginResponseModel? loginResponseModel;
  LoginSuccess({this.loginResponseModel});
  @override
  List<Object?> get props => [loginResponseModel];
}

class LoginFailure extends LoginState {
  final String? message;
  LoginFailure({this.message});
  @override
  List<Object?> get props => [message];
}
