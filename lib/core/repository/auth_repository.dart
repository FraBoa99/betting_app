// 🎯 Dart imports:
import 'dart:async';
import 'dart:io';

// 🌎 Project imports:
import 'package:betting_app/data/models/local_user.dart';
// 📦 Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthRepository(
      {FirebaseAuth? firebaseAuth,
      GoogleSignIn? googleSignIn,
      FacebookAuth? facebookAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn(),
        _facebookAuth = facebookAuth ?? FacebookAuth.instance;

  Future<User?> getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();

    if (doc.exists) {
      return doc.data() as Map<String, dynamic>;
    }
    return null;
  }

  Future<void> saveUserToFirestore(LocalUser user) async {
    try {
      final userMap =
          user.toMap(); // Converti LocalUser in Map<String, dynamic>

      await _firestore.collection('users').doc(user.uid).set(userMap);
    } catch (e) {
      rethrow;
    }
  }

  // // === PHONE SIGN IN ===
  // Future<String> verifyPhoneNumber(String phoneNumber) async {
  //   Completer<String> completer = Completer();
  //   try {
  //     await _firebaseAuth.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       timeout: const Duration(seconds: 60),
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         //Auto-resolve:
  //         await _firebaseAuth.signInWithCredential(credential);
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         if (!completer.isCompleted) {
  //           completer.completeError(e.message ?? "Verification failed");
  //         }
  //       },
  //       codeSent: (String verificationId, int? resendToken) {
  //         if (!completer.isCompleted) {
  //           completer.complete(verificationId);
  //         }
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         if (!completer.isCompleted) {
  //           completer.complete(verificationId);
  //         }
  //       },
  //     );
  //     return completer.future;
  //   } catch (e) {
  //     print('Errore: $e');
  //     rethrow;
  //   }
  // }

  Future<User?> signInWithOTP(String verificationId, String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  // === EMAIL SIGN IN ====
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // === EMAIL CREATE USER ====
  Future<UserCredential> createUserWithEmail(
      String email, String password) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  Exception _handleAuthError(Exception e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          return Exception('L\'email inserita non è valida.');
        case 'weak-password':
          return Exception('La password è troppo debole.');
        case 'email-already-in-use':
          return Exception('L\'email è già registrata. Prova a fare il login.');
        case 'user-not-found':
          return Exception('Utente non trovato. Controlla le credenziali.');
        case 'wrong-password':
          return Exception('Password errata. Riprova.');
        case 'network-request-failed':
          return Exception('Errore di connessione. Controlla la tua rete.');
        default:
          return Exception('Errore di autenticazione: ${e.message}');
      }
    } else if (e is TimeoutException) {
      return Exception(
          'La richiesta è scaduta. Controlla la tua connessione e riprova.');
    } else if (e is FormatException) {
      return Exception('Errore di formato nei dati ricevuti.');
    } else if (e is SocketException) {
      return Exception('Nessuna connessione Internet. Verifica la rete.');
    } else {
      return Exception('Si è verificato un errore imprevisto: ${e.toString()}');
    }
  }
}

  // // === GOOGLE SIGNIN ===
  // Future<User?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser!.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //     final userCredential =
  //         await _firebaseAuth.signInWithCredential(credential);
  //     return userCredential.user;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // // === FACEBOOK SIGNIN ===
  // Future<UserCredential?> signinWithFacebook() async {
  //   try {
  //     final LoginResult result = await _facebookAuth.login();
  //     if (result.status == LoginStatus.success) {
  //       final AccessToken? fbtoken = result.accessToken;
  //       if (fbtoken != null) {
  //         final OAuthCredential credential =
  //             FacebookAuthProvider.credential(fbtoken.tokenString);

  //         return await FirebaseAuth.instance.signInWithCredential(credential);
  //       }
  //     } else {
  //       throw Exception("Login failed with status: ${result.status}");
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  //   return null;
  // }

  // Future<void> resetPassword(String email) async {
  //   try {
  //     await _firebaseAuth.sendPasswordResetEmail(email: email);
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }


