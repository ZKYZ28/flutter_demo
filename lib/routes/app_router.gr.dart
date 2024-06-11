// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:welcome_sprint/presentation/screens/home/home_screen.dart' as _i1;
import 'package:welcome_sprint/presentation/screens/map/map_page.dart' as _i2;
import 'package:welcome_sprint/presentation/screens/auth/register_page.dart' as _i4;
import 'package:welcome_sprint/presentation/screens/team/team_page.dart' as _i5;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    MapRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MapPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RegisterPage(),
      );
    },
    TeamRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TeamsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MapPage]
class MapRoute extends _i3.PageRouteInfo<void> {
  const MapRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RegisterPage]
class RegisterRoute extends _i3.PageRouteInfo<void> {
  const RegisterRoute({List<_i3.PageRouteInfo>? children})
      : super(
    RegisterRoute.name,
    initialChildren: children,
  );

  static const String name = 'RegisterRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TeamRoute]
class TeamRoute extends _i3.PageRouteInfo<void> {
  const TeamRoute({List<_i3.PageRouteInfo>? children})
      : super(
    TeamRoute.name,
    initialChildren: children,
  );

  static const String name = 'TeamRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

