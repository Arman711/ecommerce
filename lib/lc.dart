import 'package:ecommerce/application/auth_bloc/auth_bloc.dart';
import 'package:ecommerce/application/basket_bloc/basket_bloc.dart';
import 'package:ecommerce/application/bloc/user_bloc.dart';
import 'package:ecommerce/infrastructure/auth/auth_repo_impl.dart';
import 'package:ecommerce/infrastructure/basket/basket_repo_impl.dart';
import 'package:ecommerce/infrastructure/domain/i_auth_repo.dart';
import 'package:ecommerce/infrastructure/domain/i_basket_repo.dart';
import 'package:ecommerce/infrastructure/domain/i_user_repo.dart';
import 'package:ecommerce/infrastructure/user/user_repo_impl.dart';
import 'package:get_it/get_it.dart';

final lc = GetIt.instance;
Future<void> initializeDependencies() async {
  lc.registerSingleton<IAuthRepository>(
    AuthRepositoryImpl(),
  );
  lc.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      lc(),
    ),
  );
  lc.registerSingleton<IUserRepo>(
    UserRepoImpl(),
  );
  lc.registerLazySingleton<UserBloc>(
    () => UserBloc(
      lc(),
    ),
  );
  lc.registerSingleton<IBasketRepository>(
    BasketRepoImpl(),
  );
  lc.registerLazySingleton<BasketBloc>(
    () => BasketBloc(
      lc(),
    ),
  );
}
