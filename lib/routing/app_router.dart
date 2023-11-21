import 'package:auto_route/auto_route.dart';
import 'package:suai_coursework_frontend/routing/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RootRoute.page,
          path: '/',
          initial: true,
          children: [
            AutoRoute(
              page: AuthRoute.page,
              path: 'auth',
              initial: true,
            ),
            AutoRoute(
              page: HomeRoute.page,
              path: 'home',
            ),
          ]
        ),
      ];
}
