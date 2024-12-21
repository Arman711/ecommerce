import 'package:ecommerce/application/bloc/auth_bloc/auth_event.dart';
import 'package:ecommerce/application/bloc/auth_bloc/auth_state.dart';
import 'package:ecommerce/domain/auth/i_auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepo;

  AuthBloc(this._authRepo) : super(AuthState()) {
    on<SignUpWithEmailAndPassword>(_onSignUpWithEmailAndPassword);
    on<Login>(login);
  }

  Future<void> _onSignUpWithEmailAndPassword(
      SignUpWithEmailAndPassword event, Emitter<AuthState> emit) async {
    emit(AuthStateInitial());
    final response = await _authRepo.signUpWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );

    response.fold(
      (String errorMsg) {
        emit(
          AuthStateFailure(
            errorMsg: errorMsg,
          ),
        );
      },
      (_) {
        emit(
          AuthStateSuccess(),
        );
      },
    );
  }

  Future<void> login(Login event, Emitter<AuthState> emit) async {
    emit(AuthStateInitial());
    final response =
        await _authRepo.login(email: event.email, password: event.password);

    response.fold(
      (errorMsg) {
        emit(AuthStateFailure(errorMsg: errorMsg));
      },
      (_) {
        emit(AuthStateSuccess());
      },
    );
  }
}
