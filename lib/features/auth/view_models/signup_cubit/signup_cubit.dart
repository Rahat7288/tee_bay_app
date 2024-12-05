import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/core/utils/utils.dart';

import '../../../home_screen/views/home_screen.dart';
import '../../repositories/auth_repository/auth_repository_impl.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState());

  final _authRepository = AuthRepositoryImpl();

  void signup(email, firstName, lastName, address, phone, password,
      confirmPassword, context) {
    Utils.hideKeyboard();

    dynamic payload = {
      "email": email,
      'first_name': firstName,
      "last_name": lastName,
      "address": address,
      "phone": phone,
      "password": password,
      "confirm_password": confirmPassword,
    };

    _authRepository.signup(context: context, payload: payload).then((value) {
      if (value != null) {
        emit(SignupSuccessState(signupModel: value));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }).onError((error, stackTrace) {
      emit(SignupFailureState(message: error.toString()));
    });
  }
}
