import 'package:calories_fix/models/user.dart';
import 'package:calories_fix/providers/user_provider.dart';
import 'package:calories_fix/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleAuthViewModel extends ChangeNotifier {
  bool isLoading = false;

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<String?> handleGoogleSignIn(BuildContext context) async {
    _setLoading(true);
    try {
      // 1. طلب الـ Credential من Google
      final credential = await FirebaseService().signInWithGoogle();
      if (credential == null) {
        _setLoading(false);
        return null; // المستخدم كنسل العملية
      }

      final userCredential = credential.user;
      if (userCredential == null) throw 'User data not found';

      // 2. التحقق هل المستخدم موجود فعلاً في Firestore؟
      UserModel? existingUser = await FirebaseService.getUserFromFirestore(
        userCredential.uid,
      );

      if (existingUser == null) {
        // --- مستخدم جديد لأول مرة ---
        final newUser = UserModel(
          uid: userCredential.uid,
          email: userCredential.email ?? '',
          name: userCredential.displayName ?? '',
        );

        // حفظ البيانات الأساسية
        await FirebaseService.addUserToFirestore(newUser);

        // تحديث الـ Provider
        if (context.mounted) {
          context.read<UserProvider>().updateUserData(newUser);
        }

        _setLoading(false);
        return 'new_user'; // علامة للـ View تروح لصفحة UserInfo
      } else {
        // --- مستخدم قديم وموجود ---
        if (context.mounted) {
          context.read<UserProvider>().updateUserData(existingUser);
        }

        _setLoading(false);
        return 'existing_user'; // علامة للـ View تروح للـ Home
      }
    } catch (e) {
      _setLoading(false);
      rethrow;
    }
  }
}
