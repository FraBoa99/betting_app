import 'package:betting_app/modules/user/cubit/model/local_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  static final UserRepository _instance = UserRepository._internal();
  UserRepository._internal();
  static UserRepository get istance => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUser(LocalUser user) async {
    try {
      User? firebaseUser = _auth.currentUser;
      if (firebaseUser == null) {
        throw Exception("You are not authenticated, please login.");
      }
      await _firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .set(user.toMap());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateUser(LocalUser user) async {
    try {
      User? firebaseUser = _auth.currentUser;
      if (firebaseUser == null) return;
      await _firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .set(user.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<LocalUser?> getUser() async {
    try {
      User? firebaseUser = _auth.currentUser;
      if (firebaseUser == null) {
        throw Exception("You are not authenticated, please login.");
      }

      DocumentSnapshot userDoc =
          await _firestore.collection("users").doc(firebaseUser.uid).get();
      if (userDoc.exists) {
        var userData = userDoc.data() as Map<String, dynamic>;
        return LocalUser.fromMap(userData);
      }
    } catch (e) {
      rethrow;
    }
    throw Exception("Error, User not found, please retry login");
  }

  Future<void> deleteUser(String uid) async {
    try {
      await _firestore.collection('user').doc(uid).delete();
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

  Future<bool> isNicknameAvailable(String nickname) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('users')
          .where('nickname', isEqualTo: nickname)
          .get();
      if (result.docs.isEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> checkNicknameAvailability(String nickname) async {
    try {
      final HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('checkNicknameAvailability');
      final response =
          await callable.call(<String, dynamic>{'nickname': nickname});
      return response.data['available'];
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
