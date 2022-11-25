import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class KabapayFirebaseUser {
  KabapayFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

KabapayFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<KabapayFirebaseUser> kabapayFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<KabapayFirebaseUser>(
      (user) {
        currentUser = KabapayFirebaseUser(user);
        return currentUser!;
      },
    );
