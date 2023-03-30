part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthLoading extends AuthState {}

class UnAuthorized extends AuthState {}

class Authorized extends AuthState {}
