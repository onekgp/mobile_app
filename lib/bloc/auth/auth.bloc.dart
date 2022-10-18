import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onekgp_app/services/amplify.services.dart';
import 'package:onekgp_app/services/user.services.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class InitEvent extends AuthEvent {}

class Login extends AuthEvent {
  final String email;
  final String password;

  Login({required this.email, required this.password});
}

class SighUp extends AuthEvent {
  final String email;
  final String password;
  final String name;

  SighUp({required this.email, required this.password, required this.name});
}

class Confirm extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String otp;

  Confirm({required this.email, required this.password, required this.name, required this.otp});
}

class Logout extends AuthEvent {}

abstract class AuthState {
  const AuthState();
}

class InitState extends AuthState {}

class LoggedIn extends AuthState {}

class NotLoggedIn extends AuthState {}

class NotConfirmed extends AuthState {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserServices _userServices = UserServices();
  AuthBloc() : super(InitState()) {
    Future checkLoginStatus(InitEvent initEvent, Emitter<AuthState> emit) async {
      AuthSession authSessions = await Amplify.Auth.fetchAuthSession();
      if (authSessions.isSignedIn) {
        (await _userServices.fetchCurrentUser()) != null ? emit(LoggedIn()) : emit(NotLoggedIn());
      } else {
        emit(NotLoggedIn());
      }
    }

    Future login(Login login, Emitter<AuthState> emit) async {
      (await _userServices.login(email: login.email, password: login.password))
          ? emit(LoggedIn())
          : emit(NotLoggedIn());
    }

    Future signUp(SighUp signUp, Emitter<AuthState> emit) async {
      bool? process =
          (await _userServices.signUpUser(email: signUp.email, password: signUp.password, name: signUp.name));
      if (process == null) {
        emit(NotLoggedIn());
      } else {
        process ? emit(LoggedIn()) : emit(NotConfirmed());
      }
    }

    Future confirm(Confirm confirm, Emitter<AuthState> emit) async {
      bool process = await _userServices.optVerfication(
          email: confirm.email, password: confirm.password, name: confirm.name, otp: confirm.otp);

      process ? emit(LoggedIn()) : emit(NotConfirmed());
    }

    on<InitEvent>(checkLoginStatus);
    on<Login>(login);
    on<SighUp>(signUp);
    on<Confirm>(confirm);
  }
}
