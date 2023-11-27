import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get onAuthStateChanged => auth.authStateChanges();
}
