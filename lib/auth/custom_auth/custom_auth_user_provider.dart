import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class SpeedotrackGPSProAuthUser {
  SpeedotrackGPSProAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<SpeedotrackGPSProAuthUser> speedotrackGPSProAuthUserSubject =
    BehaviorSubject.seeded(SpeedotrackGPSProAuthUser(loggedIn: false));
Stream<SpeedotrackGPSProAuthUser> speedotrackGPSProAuthUserStream() =>
    speedotrackGPSProAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
