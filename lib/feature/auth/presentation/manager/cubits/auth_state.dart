part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess({required this.message});
}
class AuthFailed extends AuthState {
  final String message;

  AuthFailed({required this.message});
}
class AuthLoading extends AuthState {}

