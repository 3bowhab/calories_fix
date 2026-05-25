import 'package:calories_fix/core/utils/firebase_exceptions.dart';
import 'package:calories_fix/models/user.dart';
import 'package:calories_fix/providers/user_provider.dart';
import 'package:calories_fix/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController(
    text: "ali2@gmail.com",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "Password&123",
  );
  final TextEditingController confirmPasswordController = TextEditingController(
    text: "Password&123",
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<bool> register(BuildContext context) async {
    if (!formKey.currentState!.validate()) return false;

    _setLoading(true);
    try {
      // 1. Create user in Firebase Auth
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

      final String uid = credential.user?.uid ?? '';

      // 2. Add user data to Firestore
      await FirebaseService.addUserToFirestore(
        UserModel(
          email: emailController.text,
          uid: uid,
        ),
      );

      if (!context.mounted) return false;

      // 3. Update UserProvider with the new data
      await context.read<UserProvider>().getUserData(uid);

      _setLoading(false);
      return true;
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      if (context.mounted) {
        throw FirebaseAuthExceptions.getMessage(e, context);
      }
      throw 'An error occurred';
    } catch (e) {
      _setLoading(false);
      throw e.toString();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
