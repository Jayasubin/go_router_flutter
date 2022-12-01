part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

// - to be used as major states

class Indeterminate extends AuthState {} //

class UnAuthorized extends AuthState {} //

abstract class Authorizing extends AuthState {} //

class OtpSending extends Authorizing {}

class OtpVerifying extends Authorizing {}

class OtpVerified extends Authorizing {}

class OtpWrong extends Authorizing {}

class AuthError extends Authorizing {}

class Authorized extends AuthState {} //
