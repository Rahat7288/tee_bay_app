import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../services/utils/utils.dart';
import '../../../../home_screen/presentation/views/home_screen.dart';
import '../../../data/repository_impl/auth_repository_impl.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState());

  final _authRepository = AuthRepositoryImpl();

  void registerUser(firstName, lastName, address, email, phone, password,
      confirmPassword, context) {
    Utils.hideKeyboard();
    emit(SignupLoadingState());
    Map data = {
      "firstName": firstName,
      "lastName": lastName,
      "address": address,
      "email": email,
      "phone": phone,
      "password": password,
      "confirmPassword": confirmPassword,
    };

    final Map header = {
      "Content-Type": "application/json",
    };

    _authRepository
        .signup(context: context, payload: data, header: header)
        .then((value) {
      if (kDebugMode) {
        print("registration value $value");
      }
      if (value != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        emit(SignupSuccessState(signupModel: value));
      }
    }).onError((error, stackTrace) {
      email(SignupFailureState(message: error.toString()));
    });
  }
}
