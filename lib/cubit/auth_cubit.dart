import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLoading());

  Future<void> checkAuth() async {
    emit(AuthLoading());

    final prefs = await SharedPreferences.getInstance();

    final authorized = await Future.delayed(
        const Duration(seconds: 2), () => prefs.getBool('authorized'));

    if (authorized == true) {
      emit(Authorized());
    } else {
      emit(UnAuthorized());
    }
  }

  Future<void> authorize() async {
    emit(AuthLoading());

    await Future.delayed(
      const Duration(seconds: 2),
      () async {
        final prefs = await SharedPreferences.getInstance();

        final set = await prefs.setBool('authorized', true);
      },
    );

    emit(Authorized());
  }
}
