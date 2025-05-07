// 📦 Package imports:
// 🌎 Project imports:
import 'package:betting_app/data/models/local_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<LocalUser?> getUserById(String uid) async {
    try {
      final userDoc = await _firestore.collection("users").doc(uid).get();

      if (!userDoc.exists) return null;

      return LocalUser.fromDatabase(userDoc.data()!);
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
