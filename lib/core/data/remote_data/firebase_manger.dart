import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:food/feature/auth/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseManager {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// collection users
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) {
            return UserModel.fromJson(snapshot.data()!);
          },
          toFirestore: (value, _) {
            return value.toJson();
          },
        );
  }

  /// add user to firestore
  static Future<void> addUser(UserModel model) {
    var collection = getUserCollection();
    var docRef = collection.doc(model.id);
    return docRef.set(model);
  }

  /// read user from firestore
  static Future<UserModel?> readUserData(String id) async {
    var collection = getUserCollection();
    DocumentSnapshot<UserModel> snapShot = await collection.doc(id).get();
    return snapShot.data();
  }

  // Sign in with Google
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        final existingUser = await readUserData(user.uid);
        if (existingUser == null) {
          await addUser(
            UserModel(
              id: user.uid,
              name: user.displayName ?? 'New User',
              email: user.email ?? '',
              createdAt: DateTime.now().millisecondsSinceEpoch,
            ),
          );
        }
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception("Firebase Auth Error: ${e.message}");
    } catch (e) {
      throw Exception("Google Sign-In Error: $e");
    }
  }

  // Sign in with Facebook

  // static Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Ensure login succeeded and accessToken is not null
  //   if (loginResult.status != LoginStatus.success ||
  //       loginResult.accessToken == null) {
  //     throw Exception('Facebook login failed: ${loginResult.message}');
  //   }

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  static Future<void> logOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      print("Successfully logged out");
    } catch (e) {
      throw Exception("Error logging out: $e");
    }
  }

  static User? getCurrentUser() {
    return _auth.currentUser;
  }

  static Stream<User?> get authStateChanges => _auth.authStateChanges();

  static Future<bool> isGoogleSignedIn() async {
    return await _googleSignIn.isSignedIn();
  }

  static Future<void> disconnectGoogle() async {
    try {
      await _googleSignIn.disconnect();
      print("error Google disconnected successfully");
    } catch (e) {
      print("Google disconnect failed: $e");
    }
  }
}
