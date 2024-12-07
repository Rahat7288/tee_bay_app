import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tee_bay_app/features/auth/models/login_model/login_response_model.dart';
import 'package:tee_bay_app/features/auth/repositories/auth_repository/auth_repository_impl.dart';
import 'package:tee_bay_app/features/auth/view_models/login_cubit/login_cubit.dart';
import 'package:tee_bay_app/features/auth/view_models/login_cubit/login_state.dart';
import 'package:test/test.dart';

class MockAuthService extends Mock implements AuthRepositoryImpl {}

void main() {
  late MockAuthService mockAuthService;
  late LoginCubit authCubit;

  setUp(() {
    mockAuthService = MockAuthService();
    authCubit = LoginCubit();
  });

  tearDown(() {
    authCubit.close();
  });

  group('Login Tests', () {
    const email = 'test@example.com';
    const password = 'password123';

    final payload = {
      'email': email,
      'password': password,
    };

    final successResponse = LoginResponseModel(
      message: "Login successful",
      user: User(
        id: 1,
        email: email,
        firstName: "John",
        lastName: "Doe",
        address: "123 Street",
        firebaseConsoleManagerToken: "mockToken",
        password: password,
        dateJoined: "2023-01-01",
      ),
    );

    final failureResponse = LoginResponseModel(
      message: "Login failed",
      user: null,
    );

    blocTest<LoginCubit, LoginState>(
      'emits [AuthLoading, AuthSuccess] when login is successful',
      build: () {
        when(() => mockAuthService.login(payload: payload))
            .thenAnswer((_) async => successResponse);
        return authCubit;
      },
      act: (cubit) => cubit.login(email, password, BuildContext),
      expect: () => [
        LoginStateLoading(),
        LoginSuccess(loginResponseModel: successResponse),
      ],
    );
    blocTest<LoginCubit, LoginState>(
      'emits [AuthLoading, AuthError] when login fails with invalid credentials',
      build: () {
        when(() => mockAuthService.login(payload: payload))
            .thenAnswer((_) async => failureResponse);
        return authCubit;
      },
      act: (cubit) => cubit.login(email, password, BuildContext),
      expect: () => [
        LoginStateLoading(),
        LoginFailure(message: "Invalid User"),
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'emits [AuthLoading, AuthError] when login throws an exception',
      build: () {
        when(() => mockAuthService.login(payload: payload))
            .thenThrow(Exception("Server error"));
        return authCubit;
      },
      act: (cubit) => cubit.login(email, password, BuildContext),
      expect: () => [
        LoginStateLoading(),
        LoginFailure(message: "An error occurred: Exception: Server error"),
      ],
    );
  });
}
