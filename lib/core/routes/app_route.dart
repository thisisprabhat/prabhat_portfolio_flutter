import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '/features/landing/views/landing_page.dart';

class AppRoute {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static GoRouter goRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: LandingPage.path,
    routes: [
      GoRoute(
        name: LandingPage.routeName,
        path: LandingPage.path,
        pageBuilder: (context, state) {
          return const MaterialPage(child: LandingPage());
        },
      ),
      // GoRoute(
      //   name: HomeScreen.routeName,
      //   path: HomeScreen.path,
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(child: HomeScreen());
      //   },
      // ),
      // GoRoute(
      //   name: ExperimentsScreen.routeName,
      //   path: ExperimentsScreen.path,
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(child: ExperimentsScreen());
      //   },
      // ),
      // GoRoute(
      //   name: OnboardingScreen.routeName,
      //   path: OnboardingScreen.path,
      //   pageBuilder: (context, state) {
      //     final queryParameters = state.uri.queryParameters;
      //     final isFromHomeScreen =
      //         queryParameters['isFromHomeScreen'] == 'true';
      //     return MaterialPage(
      //       child: OnboardingScreen(isFromHomeScreen: isFromHomeScreen),
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: PhoneAuthScreen.routeName,
      //   path: PhoneAuthScreen.path,
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(child: PhoneAuthScreen());
      //   },
      // ),
      // ShellRoute(
      //   navigatorKey: _shellNavigatorKey,
      //   builder: (context, state, child) {
      //     return ParentScreen(child: child);
      //   },
      //   routes: [
      //     GoRoute(
      //       name: Dashboard.routeName,
      //       path: Dashboard.path,
      //       pageBuilder: (context, state) {
      //         return const MaterialPage(child: Dashboard());
      //       },
      //     ),
      //     //! Employees
      //     GoRoute(
      //       name: EmployeesScreen.routeName,
      //       path: EmployeesScreen.path,
      //       redirect: Redirection.userRedirection,
      //       pageBuilder: (context, state) {
      //         return const MaterialPage(child: EmployeesScreen());
      //       },
      //     ),
      //     GoRoute(
      //       name: SitesScreen.routeName,
      //       path: SitesScreen.path,
      //       // redirect: Redirection.userRedirection,
      //       pageBuilder: (context, state) {
      //         return const MaterialPage(child: SitesScreen());
      //       },
      //       routes: [
      //         GoRoute(
      //           name: AddUpdateSite.routeName,
      //           path: AddUpdateSite.path,
      //           // redirect: Redirection.userRedirection,
      //           pageBuilder: (context, state) {
      //             return const MaterialPage(child: AddUpdateSite());
      //           },
      //         ),
      //         GoRoute(
      //           name: AddUpdateSite.updateRouteName,
      //           path: AddUpdateSite.updatePath,
      //           // redirect: Redirection.userRedirection,
      //           redirect: (context, state) {
      //             try {
      //               state.extra as PositionData;
      //             } catch (e) {
      //               return '/sites';
      //             }
      //             return null;
      //           },
      //           pageBuilder: (context, state) {
      //             return MaterialPage(
      //               child: AddUpdateSite(site: state.extra as PositionData),
      //             );
      //           },
      //         ),
      //       ],
      //     ),
    ],
  );
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({super.key, required this.screen});
  final Widget screen;
  @override
  Widget build(BuildContext context) {
    return screen;
  }
}
