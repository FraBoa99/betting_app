// 📦 Package imports:
// 🌎 Project imports:
import 'package:betting_app/data/models/local_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<LocalUser?> getUser() async {
    try {
      User? firebaseUser = _auth.currentUser;
      if (firebaseUser == null) return null;

      DocumentSnapshot userDoc =
          await _firestore.collection("users").doc(firebaseUser.uid).get();

      if (!userDoc.exists) return null;

      var userData = userDoc.data() as Map<String, dynamic>;
      print("Dati utente da Firestore: $userData");
      return LocalUser.fromDatabase(userData);
    } catch (e) {
      print("Errore nel recupero utente: $e");
      return null;
    }
  }

  Future<void> deleteUser(String uid) async {
    try {
      await _firestore.collection('users').doc(uid).delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isUserRegistered(String uid) async {
    try {
      final userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return userDoc.exists;
    } catch (e) {
      return false;
    }
  }
}
