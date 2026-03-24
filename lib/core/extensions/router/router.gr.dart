// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:second_attempt/feature/Auth/presentation/page/login.dart'
    as _i1;
import 'package:second_attempt/feature/Auth/presentation/page/signUp.dart'
    as _i2;
import 'package:second_attempt/feature/StartUp/presentation/pages/startUp.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginPageRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    SignupPageRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignupPage(),
      );
    },
    StartupPageRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.StartupPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginPage]
class LoginPageRoute extends _i4.PageRouteInfo<void> {
  const LoginPageRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignupPage]
class SignupPageRoute extends _i4.PageRouteInfo<void> {
  const SignupPageRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SignupPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupPageRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.StartupPage]
class StartupPageRoute extends _i4.PageRouteInfo<void> {
  const StartupPageRoute({List<_i4.PageRouteInfo>? children})
      : super(
          StartupPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartupPageRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
