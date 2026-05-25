import 'package:calories_fix/core/utils/firebase_exceptions.dart';
import 'package:calories_fix/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController deliveryInstructionsController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<bool> userInfo(BuildContext context) async {
    if (!formKey.currentState!.validate()) return false;

    setLoading(true);
    try {
      final String? uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        throw 'User not logged in';
      }

      await FirebaseService.updateUserInFirestore({
        'name': nameController.text,
        'phone': phoneController.text,
        'address': addressController.text,
        'deliveryInstructions': deliveryInstructionsController.text,
      }, uid);

      setLoading(false);
      return true;
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      if (context.mounted) {
        throw FirebaseAuthExceptions.getMessage(e, context);
      }
      throw 'An error occurred';
    } catch (e) {
      setLoading(false);
      throw e.toString();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    deliveryInstructionsController.dispose();
    super.dispose();
  }
}
