import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/application/bloc/auth_bloc/auth_bloc.dart';
import 'package:ecommerce/application/bloc/basket_bloc/basket_bloc.dart';
import 'package:ecommerce/application/bloc/search_bloc/search_bloc.dart';
import 'package:ecommerce/application/bloc/user_bloc/user_bloc.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/lc.dart';
import 'package:ecommerce/presentation/core/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final AppRouter appRouter = AppRouter();
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
    } else {}
  });

  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => lc<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => lc<UserBloc>(),
        ),
        BlocProvider<BasketBloc>(
          create: (context) => lc<BasketBloc>(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => lc<SearchBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
      ),
    );
  }
}
