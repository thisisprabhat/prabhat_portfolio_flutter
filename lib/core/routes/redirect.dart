import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

// import '/presentation/screens/screens.dart';

class Redirection {
  // static FutureOr<String?> authRedirect(
  //     BuildContext context, GoRouterState state) async {
  //   // final role = context.read<AuthBloc>().superUser.role;
  //   if (FirebaseAuth.instance.currentUser != null &&
  //       state.matchedLocation.contains(Login.path)) {
  //     return '/home';
  //   } else {
  //     return null;
  //   }
  // }

  static FutureOr<String?> superUserRedirection(
    BuildContext context,
    GoRouterState state,
  ) async {
    return null;
  }

  static FutureOr<String?> userRedirection(
    BuildContext context,
    GoRouterState state,
  ) async {
    return null;
  }
}
