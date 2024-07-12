import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class InboundV3GSGlobalAuthUser {
  InboundV3GSGlobalAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<InboundV3GSGlobalAuthUser> inboundV3GSGlobalAuthUserSubject =
    BehaviorSubject.seeded(InboundV3GSGlobalAuthUser(loggedIn: false));
Stream<InboundV3GSGlobalAuthUser> inboundV3GSGlobalAuthUserStream() =>
    inboundV3GSGlobalAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
