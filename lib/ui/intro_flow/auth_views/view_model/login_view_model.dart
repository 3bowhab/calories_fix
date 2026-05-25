import 'package:calories_fix/core/utils/firebase_exceptions.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:calories_fix/models/user.dart';
import 'package:calories_fix/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController(
    text: "ali2@gmail.com",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "Password&123",
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<bool> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return false;

    setLoading(true);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final userCredential = credential.user;
      if (userCredential != null) {
        final newUser = UserModel(
          uid: userCredential.uid,
          email: userCredential.email ?? '',
          name: userCredential.displayName ?? '',
        );

        if (!context.mounted) return false;

        // جلب بيانات المستخدم وتخزينها في الـ Provider العام
        await context.read<UserProvider>().getUserData(newUser.uid);
      }

      setLoading(false);
      return true;
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      String errorMessage;
      final localizations = AppLocalizations.of(context)!;
      
      // هندلة الأخطاء باللوكاليزيشن
      switch (e.code) {
        case 'wrong-password':
          errorMessage = localizations.wrongPassword;
          break;
        case 'user-not-found':
          errorMessage =
              localizations.userNotFound; // استخدمنا اللي ضفناها سابقاً
          break;
        case 'invalid-credential':
          errorMessage = localizations.invalidCredential;
          break;
        case 'user-disabled':
          errorMessage = localizations.userDisabled;
          break;
        case 'network-request-failed':
          errorMessage = localizations.networkError;
          break;
        default:
          errorMessage = FirebaseAuthExceptions.getMessage(e, context);
      }

      if (context.mounted) {
        throw errorMessage;
      }
      throw localizations.loginError;
    } catch (e) {
      setLoading(false);
      throw e.toString();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
