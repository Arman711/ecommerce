import 'package:ecommerce/application/bloc/auth_bloc/auth_bloc.dart';
import 'package:ecommerce/application/bloc/basket_bloc/basket_bloc.dart';
import 'package:ecommerce/application/bloc/search_bloc/search_bloc.dart';
import 'package:ecommerce/application/bloc/user_bloc/user_bloc.dart';
import 'package:ecommerce/domain/search/i_search_repo.dart';
import 'package:ecommerce/infrastructure/auth/auth_repo_impl.dart';
import 'package:ecommerce/infrastructure/basket/basket_repo_impl.dart';
import 'package:ecommerce/domain/auth/i_auth_repo.dart';
import 'package:ecommerce/domain/basket/i_basket_repo.dart';
import 'package:ecommerce/domain/user/i_user_repo.dart';
import 'package:ecommerce/infrastructure/search/search_repo_impl.dart';
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
  lc.registerSingleton<ISearchRepo>(
    SearchRepoImpl(),
  );
  lc.registerLazySingleton<SearchBloc>(
    () => SearchBloc(
      lc(),
    ),
  );
}
