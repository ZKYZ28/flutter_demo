import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';


//dart run build_runner build
@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: MapRoute.page),
    AutoRoute(page: TeamRoute.page),
  ];
}