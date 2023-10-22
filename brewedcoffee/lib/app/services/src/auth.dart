import 'dart:convert';
import 'dart:math';
import 'package:brewedcoffee/coffee/widgets/src/alert_dialog.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  factory AuthService() => _service;

  // Singleton setup: prevents multiple instances of this class.
  AuthService._();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final AuthService _service = AuthService._();

  static AuthService get instance => _service;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  User? get currentUser => _firebaseAuth.currentUser;

  Future<User?> signInAnonymously() async {
    try {
      final userCredential = await _firebaseAuth.signInAnonymously();
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      await showAlertDialog(e.message ?? 'SignIn failed');
    } catch (e) {
      await showAlertDialog(e.toString());
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithCredential(
        EmailAuthProvider.credential(email: email, password: password),
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await showAlertDialog('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        await showAlertDialog('Wrong password provided for that user.');
      } else {
        await showAlertDialog(e.message ?? 'SignIn failed');
      }
    } catch (e) {
      await showAlertDialog(e.toString());
    }
    return null;
  }

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void>? deleteUser() async {
    await currentUser?.delete();
  }

  Future<void>? updatePassword({
    required String newPassword,
  }) {
    currentUser?.updatePassword(newPassword);
    return null;
  }

  void updateProfile({
    required String photoURL,
    required String displayName,
  }) {
    Future.value([
      currentUser?.updateDisplayName(displayName),
      currentUser?.updatePhotoURL(photoURL),
    ]);
  }

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        await showAlertDialog('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        await showAlertDialog('The account already exists for that email.');
      } else {
        await showAlertDialog(e.message ?? 'SignUp failed');
      }
    } catch (e) {
      await showAlertDialog(e.toString());
    }
    return null;
  }

  Future<String?> signInWithPhoneNumber(String phone) async {
    try {
      final confirmationResult =
          await _firebaseAuth.signInWithPhoneNumber(phone);

      return confirmationResult.verificationId;
    } catch (e) {
      await showAlertDialog(e.toString());
    }
    return null;
  }

  Future<User?> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn(
        scopes: [
          'https://www.googleapis.com/auth/userinfo.email',
          'https://www.googleapis.com/auth/userinfo.profile',
        ],
      );
      final googleUser = await googleSignIn.signIn();
      // sign in process was aborted
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      await showAlertDialog(e.message ?? 'SignIn with Google failed');
    } catch (e) {
      await showAlertDialog(e.toString());
    }
    return null;
  }

  Future<bool> isAppleSignInAvailable() {
    return SignInWithApple.isAvailable();
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User?> signInWithApple() async {
    try {
      // To prevent replay attacks with the credential returned from Apple, we
      // include a nonce in the credential request. When signing in in with
      // Firebase, the nonce in the id token returned by Apple, is expected to
      // match the sha256 hash of `rawNonce`.
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
        // webAuthenticationOptions: WebAuthenticationOptions(
        //   clientId: "firebase.io.wiredbrain.app",
        //   redirectUri: Uri.parse(
        //     'https://pluralsight-firebase-flutter.glitch.me/callbacks/sign_in_with_apple',
        //   ),
        // ),
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`, sign in
      // will fail.
      final userCredential =
          await _firebaseAuth.signInWithCredential(oauthCredential);

      return userCredential.user;
      //
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code != AuthorizationErrorCode.unknown) {
        await showAlertDialog(e.message);
      }
    } on FirebaseAuthException catch (e) {
      await showAlertDialog(e.message ?? 'SignIn failed');
    } catch (e) {
      await showAlertDialog(e.toString());
    }
    return null;
  }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
