import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/presentation/auth_screen/auth_screen.dart';
import 'package:ecommerce/presentation/creating_user_screen.dart/creating_user_screen.dart';
import 'package:ecommerce/presentation/home_screen/home_screen.dart';
import 'package:ecommerce/presentation/order_screen/order_screen.dart';
import 'package:ecommerce/presentation/product_screen/product_screen.dart';
import 'package:ecommerce/presentation/success_screen/success_screen.dart';
import 'package:ecommerce/presentation/trcking_screen/tracking_screen.dart';
import 'package:ecommerce/presentation/welcome_screen/welcome_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          initial: true,
          page: WelcomeRoute.page,
        ),
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: '/order',
          page: OrderRoute.page,
        ),
        AutoRoute(
          path: '/success',
          page: SuccessRoute.page,
        ),
        AutoRoute(
          path: '/tracking',
          page: TrackingRoute.page,
        ),
        AutoRoute(
          path: '/product',
          page: ProductRoute.page,
        ),
        AutoRoute(
          path: '/auth',
          page: AuthRoute.page,
        ),
        AutoRoute(
          path: '/user',
          page: CreatingUserRoute.page,
        ),
      ];
}
