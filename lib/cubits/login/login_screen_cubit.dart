import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_screen_state.dart';

class LoginCubit extends Cubit<LoginState> {

  final Future<bool> Function(String email, String password) loginRequest;

  LoginCubit({Future<bool> Function(String email, String password)? loginRequest}) :
    loginRequest = loginRequest ?? defaultLoginBehavior,
    super(LoginInitial());

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    bool success;
    try {
      success = await loginRequest.call(email, password);
      if (success) {
        emit(LoginSuccessState());
      } else {
        emit(LoginFailureState("Error iniciando sesion"));
      }
    } on Exception catch (e) {
      emit(LoginFailureState("Error"));
    }
  }

  static Future<bool> defaultLoginBehavior(String email, String password) {
    return Future.delayed(const Duration(seconds: 3)).then((value) => false);
  }

  void register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {}
}
