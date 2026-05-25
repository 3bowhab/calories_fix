import 'package:calories_fix/core/constants/app_images.dart';
import 'package:calories_fix/core/constants/app_routes.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';
import 'package:calories_fix/core/utils/custom_button.dart';
import 'package:calories_fix/core/utils/dialog_utils.dart';
import 'package:calories_fix/core/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/google_auth_view_model.dart'; // تأكد من المسار

class AuthWithgoogleButton extends StatelessWidget {
  final String label;
  final String toastMessage;

  const AuthWithgoogleButton({
    super.key,
    required this.label,
    required this.toastMessage,
  });

  @override
  Widget build(BuildContext context) {
    // نستخدم الـ Provider هنا
    return ChangeNotifierProvider(
      create: (_) => GoogleAuthViewModel(),
      child: Consumer<GoogleAuthViewModel>(
        builder: (context, viewModel, child) {
          return CustomButton(
            onPressed: () async {
              try {
                DialogUtils.showLoadingDialog(context);

                // استدعاء الـ Logic من الـ ViewModel
                String? result = await viewModel.handleGoogleSignIn(context);

                if (!context.mounted) return;
                Navigator.pop(context); // إغلاق الـ Loading

                if (result == 'new_user') {
                  // مستخدم جديد -> وديه يكمل بياناته
                  ToastUtils.showSuccessToast(toastMessage, context);
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.userInfoView,
                  );
                } else if (result == 'existing_user') {
                  // مستخدم قديم -> وديه الـ Home علطول
                  ToastUtils.showSuccessToast(toastMessage, context);
                  Navigator.pushReplacementNamed(context, AppRoutes.mainView);
                }
              } catch (e) {
                if (!context.mounted) return;
                Navigator.pop(context); // إغلاق الـ Loading

                if (!e.toString().contains('canceled')) {
                  ToastUtils.showErrorToast(e.toString(), context);
                }
              }
            },
            isGoogleButton: true,
            labelWidget: Text(
              label,
              style: context.semiBold16.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            icon: Image.asset(Assets.assetsImagesGoogle),
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            borderSideColor: Theme.of(context).colorScheme.primary,
          );
        },
      ),
    );
  }
}
