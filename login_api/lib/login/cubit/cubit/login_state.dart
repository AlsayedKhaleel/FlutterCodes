part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class IsLoading extends LoginState {}
final class SuccessLogin extends LoginState {}
final class FailedLogin  extends LoginState {}
