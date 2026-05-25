import 'package:calories_fix/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignIn signIn = GoogleSignIn.instance;

    signIn.initialize(
      serverClientId:
          '863769843994-npjorjh9meq9o7jnsc1pcm0hut28u3kr.apps.googleusercontent.com',
    );

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate();

    if (googleUser == null) return null;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Get user collection reference
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toFirestore(),
        );
  }

  // Add user to Firestore
  static Future<void> addUserToFirestore(UserModel user) async {
    await getUserCollection().doc(user.uid).set(user);
  }

  // Get user from Firestore
  static Future<UserModel?> getUserFromFirestore(String uid) async {
    final docSnapShot = await getUserCollection().doc(uid).get();
    return docSnapShot.data();
  }

  // Update user data in Firestore
  static Future<void> updateUserInFirestore(
    Map<String, dynamic> data,
    String uid,
  ) async {
    await getUserCollection().doc(uid).update(data);
  }
}
