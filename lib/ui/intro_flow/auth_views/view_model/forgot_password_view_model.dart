import 'dart:async'; // نحتاج هذا للـ Timer
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:calories_fix/core/utils/firebase_exceptions.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  int remainingTime = 0; // الثواني المتبقية
  Timer? _timer;

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // دالة لبدء العد التنازلي
  void _startCooldown() {
    remainingTime = 30; // مدة الانتظار
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> sendResetPasswordEmail(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    _setLoading(true);
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      _setLoading(false);
      _startCooldown();
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      String errorMessage;

      switch (e.code) {
        case 'user-not-found':
          errorMessage = AppLocalizations.of(context)!.userNotFound;
          break;
        case 'invalid-email':
          errorMessage = AppLocalizations.of(context)!.invalidEmail;
          break;
        case 'network-request-failed':
          errorMessage = AppLocalizations.of(context)!.networkError;
          break;
        case 'too-many-requests':
          errorMessage = AppLocalizations.of(context)!.tooManyRequests;
          break;
        default:
          // لو عندك كلاس جاهز بتهندل فيه باقي الأخطاء
          errorMessage = FirebaseAuthExceptions.getMessage(e, context);
      }
      throw errorMessage;
    } catch (e) {
      _setLoading(false);
      throw AppLocalizations.of(context)!.unknownError;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    _timer?.cancel(); // مهم جداً تقفل التايمر هنا
    super.dispose();
  }
}
