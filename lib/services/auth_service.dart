import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  Stream<String> get onAuthStateChanged =>
      _firebaseAuth.onAuthStateChanged.map((FirebaseUser user) => user?.uid);

  Future<String> createUser(String email, String password, String name) async {
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return currentUser.user.uid;
  }

  Future<String> signIn(String email, String password) async {
    final currentUser = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return currentUser.user.uid;
  }

  signOut() {
    return _firebaseAuth.signOut();
  }
}
