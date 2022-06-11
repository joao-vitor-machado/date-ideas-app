import 'package:firebase_auth/firebase_auth.dart';

import '../model/login.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<SignupData?> get user {
    return _firebaseAuth.authStateChanges().map(
          (event) => _userFromFirebaseUser(event),
        );
  }

  SignupData? _userFromFirebaseUser(User? user) {
    return user != null ? SignupData(uuid: user.uid) : null;
  }

  Future<SignupData?> signInAnonimo() async {
    UserCredential userCredential = await _firebaseAuth.signInAnonymously();
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

  Future<SignupData?> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

  Future<SignupData?> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
