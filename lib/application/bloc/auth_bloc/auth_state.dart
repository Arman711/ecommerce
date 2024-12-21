import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthStateInitial extends AuthState {}

final class AuthStateloading extends AuthState {}

final class AuthStateSuccess extends AuthState {}

final class AuthStateFailure extends AuthState {
  final String errorMsg;
  AuthStateFailure({required this.errorMsg});
}
