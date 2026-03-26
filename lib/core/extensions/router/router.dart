import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';



@AutoRouterConfig(replaceInRouteName: 'Page')

class AppRouter extends $AppRouter  {
  @override
  List<AutoRoute> get routes => [

    AutoRoute(page: StartupPageRoute.page, path: '/',initial: true),
    AutoRoute(page: SignupPageRoute.page ,path:'/signup'),
    AutoRoute(page: LoginPageRoute.page, path: '/login'),
    AutoRoute(page: MyHomePageRoute.page, path: '/Home')];
}