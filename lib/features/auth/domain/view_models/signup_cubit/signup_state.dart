import 'package:equatable/equatable.dart';

import '../../../data/models/signup_model/signup_model.dart';

class SignupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupLoadingState extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupSuccessState extends SignupState {
  final SignupModel? signupModel;

  SignupSuccessState({this.signupModel});
  @override
  List<Object?> get props => [signupModel];
}

class SignupFailureState extends SignupState {
  final String? message;
  SignupFailureState({this.message});
  @override
  List<Object?> get props => [message];
}
