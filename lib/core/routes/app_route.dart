// import 'package:go_router/go_router.dart';
// import 'package:flutter/material.dart';

// import '/experiments/experiments_screen.dart';
// import '/library/screens.dart';

// class AppRoute {
//   static final _rootNavigatorKey = GlobalKey<NavigatorState>();
//   // static final _shellNavigatorKey = GlobalKey<NavigatorState>();
//   static GoRouter goRouter = GoRouter(
//     navigatorKey: _rootNavigatorKey,
//     debugLogDiagnostics: true,
//     initialLocation: '/',
//     routes: [
//       GoRoute(
//         name: SplashScreen.routeName,
//         path: '/',
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: SplashScreen());
//         },
//         routes: <RouteBase>[],
//       ),
//       GoRoute(
//         name: HomeScreen.routeName,
//         path: HomeScreen.path,
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: HomeScreen());
//         },
//       ),
//       GoRoute(
//         name: ExperimentsScreen.routeName,
//         path: ExperimentsScreen.path,
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: ExperimentsScreen());
//         },
//       ),
//       GoRoute(
//         name: OnboardingScreen.routeName,
//         path: OnboardingScreen.path,
//         pageBuilder: (context, state) {
//           final queryParameters = state.uri.queryParameters;
//           final isFromHomeScreen =
//               queryParameters['isFromHomeScreen'] == 'true';
//           return MaterialPage(
//             child: OnboardingScreen(isFromHomeScreen: isFromHomeScreen),
//           );
//         },
//       ),
//       GoRoute(
//         name: PhoneAuthScreen.routeName,
//         path: PhoneAuthScreen.path,
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: PhoneAuthScreen());
//         },
//       ),
//       // ShellRoute(
//       //   navigatorKey: _shellNavigatorKey,
//       //   builder: (context, state, child) {
//       //     return ParentScreen(child: child);
//       //   },
//       //   routes: [
//       //     GoRoute(
//       //       name: Dashboard.routeName,
//       //       path: Dashboard.path,
//       //       pageBuilder: (context, state) {
//       //         return const MaterialPage(child: Dashboard());
//       //       },
//       //     ),
//       //     //! Employees
//       //     GoRoute(
//       //       name: EmployeesScreen.routeName,
//       //       path: EmployeesScreen.path,
//       //       redirect: Redirection.userRedirection,
//       //       pageBuilder: (context, state) {
//       //         return const MaterialPage(child: EmployeesScreen());
//       //       },
//       //     ),
//       //     GoRoute(
//       //       name: SitesScreen.routeName,
//       //       path: SitesScreen.path,
//       //       // redirect: Redirection.userRedirection,
//       //       pageBuilder: (context, state) {
//       //         return const MaterialPage(child: SitesScreen());
//       //       },
//       //       routes: [
//       //         GoRoute(
//       //           name: AddUpdateSite.routeName,
//       //           path: AddUpdateSite.path,
//       //           // redirect: Redirection.userRedirection,
//       //           pageBuilder: (context, state) {
//       //             return const MaterialPage(child: AddUpdateSite());
//       //           },
//       //         ),
//       //         GoRoute(
//       //           name: AddUpdateSite.updateRouteName,
//       //           path: AddUpdateSite.updatePath,
//       //           // redirect: Redirection.userRedirection,
//       //           redirect: (context, state) {
//       //             try {
//       //               state.extra as PositionData;
//       //             } catch (e) {
//       //               return '/sites';
//       //             }
//       //             return null;
//       //           },
//       //           pageBuilder: (context, state) {
//       //             return MaterialPage(
//       //               child: AddUpdateSite(site: state.extra as PositionData),
//       //             );
//       //           },
//       //         ),
//       //       ],
//       //     ),

//       //     //! Attendance
//       //     GoRoute(
//       //       name: AttendanceScreen.routeName,
//       //       path: AttendanceScreen.path,
//       //       redirect: Redirection.userRedirection,
//       //       pageBuilder: (context, state) {
//       //         return const MaterialPage(child: AttendanceScreen());
//       //       },
//       //     ),
//       //     GoRoute(
//       //       name: ProjectScreen.routeName,
//       //       path: ProjectScreen.path,
//       //       pageBuilder: (context, state) {
//       //         return const MaterialPage(child: ProjectScreen());
//       //       },
//       //     ),

//       //! HomeScreen
//       // GoRoute(
//       //   name: HomeScreen.routeName,
//       //   path: HomeScreen.path,
//       //   pageBuilder: (context, state) {
//       //     return const MaterialPage(
//       //       child: HomeScreen(),
//       //     );
//       //   },
//       //   routes: [

//       //     GoRoute(
//       //       name: DeraaScreen.routeName,
//       //       path: DeraaScreen.path,
//       //       redirect: Redirection.userRedirection,
//       //       pageBuilder: (context, state) {
//       //         return const MaterialPage(child: DeraaScreen());
//       //       },
//       //     ),
//       //   ],
//       // ),
//       //! Settings Screen
//       //     GoRoute(
//       //       name: SettingsScreen.routeName,
//       //       path: SettingsScreen.path,
//       //       pageBuilder: (context, state) {
//       //         return const MaterialPage(child: SettingsScreen());
//       //       },
//       //       routes: [
//       //         GoRoute(
//       //           name: SuperUser.routeName,
//       //           path: SuperUser.path,
//       //           redirect: Redirection.userRedirection,
//       //           pageBuilder: (context, state) {
//       //             return const MaterialPage(child: SuperUser());
//       //           },
//       //         ),
//       //       ],
//       //     ),
//       //     //! Dev Help Screens
//       //     GoRoute(
//       //       name: TextThemeWidget.routeName,
//       //       path: TextThemeWidget.path,
//       //       pageBuilder: (context, state) {
//       //         return const MaterialPage(child: TextThemeWidget());
//       //       },
//       //     ),
//       //     GoRoute(
//       //       name: ColorSchemeWidget.routeName,
//       //       path: ColorSchemeWidget.path,
//       //       pageBuilder: (context, state) {
//       //         return const MaterialPage(child: ColorSchemeWidget());
//       //       },
//       //     ),
//       //   ],
//       // ),
//       // GoRoute(
//       //   name: Signup.routeName,
//       //   path: Signup.path,
//       //   pageBuilder: (context, state) {
//       //     return const MaterialPage(
//       //       child: Signup(),
//       //     );
//       //   },
//       // ),
//       // GoRoute(
//       //   name: AssessDenied.routeName,
//       //   path: AssessDenied.path,
//       //   pageBuilder: (context, state) {
//       //     return MaterialPage(
//       //       child: AssessDenied(
//       //         pageTitle: state.uri.queryParameters['path'],
//       //       ),
//       //     );
//       //   },
//       // ),
//     ],
//     // redirect: Redirection.authRedirect,
//   );
// }

// class PageBuilder extends StatelessWidget {
//   const PageBuilder({super.key, required this.screen});
//   final Widget screen;
//   @override
//   Widget build(BuildContext context) {
//     return screen;
//   }
// }
