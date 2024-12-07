import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuhtCubit extends Cubit<bool> {
  LocalAuhtCubit() : super(false);

  final LocalAuthentication _auth = LocalAuthentication();

  Future<void> authenticate() async {
    try {
      bool isAuthenticated = await _auth.authenticate(
        localizedReason: "Authenticate to access the Home Screen",
        options: const AuthenticationOptions(biometricOnly: true),
      );
      emit(isAuthenticated);
    } catch (e) {
      emit(false);
    }
  }
}
