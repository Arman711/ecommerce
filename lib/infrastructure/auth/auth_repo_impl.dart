import 'package:ecommerce/domain/auth/i_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<Either<String, Unit>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      String errorMsg;
      if (e.code == "weak-password") {
        errorMsg = 'Passord is too weak';
      } else if (e.code == "email-already-in-use") {
        errorMsg = 'Email already in use';
      } else {
        errorMsg = e.code;
      }
      return Left(errorMsg);
    } catch (e) {
      return const Left('Feiled to sign up');
    }
  }

  @override
  Future<Either<String, Unit>> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(
        unit,
      );
    } catch (e) {
      return const Left(
        'Failure login',
      );
    }
  }
}
