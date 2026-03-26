// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:second_attempt/feature/Auth/presentation/page/login.dart'
    as _i1;
import 'package:second_attempt/feature/Auth/presentation/page/signUp.dart'
    as _i3;
import 'package:second_attempt/feature/StartUp/presentation/pages/startUp.dart'
    as _i4;
import 'package:second_attempt/Home.dart' as _i2;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginPageRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    MyHomePageRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomePageRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.MyHomePage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    SignupPageRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignupPage(),
      );
    },
    StartupPageRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.StartupPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginPage]
class LoginPageRoute extends _i5.PageRouteInfo<void> {
  const LoginPageRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MyHomePage]
class MyHomePageRoute extends _i5.PageRouteInfo<MyHomePageRouteArgs> {
  MyHomePageRoute({
    _i6.Key? key,
    required String title,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          MyHomePageRoute.name,
          args: MyHomePageRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MyHomePageRoute';

  static const _i5.PageInfo<MyHomePageRouteArgs> page =
      _i5.PageInfo<MyHomePageRouteArgs>(name);
}

class MyHomePageRouteArgs {
  const MyHomePageRouteArgs({
    this.key,
    required this.title,
  });

  final _i6.Key? key;

  final String title;

  @override
  String toString() {
    return 'MyHomePageRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.SignupPage]
class SignupPageRoute extends _i5.PageRouteInfo<void> {
  const SignupPageRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SignupPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupPageRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.StartupPage]
class StartupPageRoute extends _i5.PageRouteInfo<void> {
  const StartupPageRoute({List<_i5.PageRouteInfo>? children})
      : super(
          StartupPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartupPageRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
