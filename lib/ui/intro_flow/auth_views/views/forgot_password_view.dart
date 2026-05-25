import 'package:calories_fix/core/constants/app_images.dart';
import 'package:calories_fix/core/extensions/responsive_size_extension.dart';
import 'package:calories_fix/core/extensions/responsive_sized_box_extension.dart';
import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';
import 'package:calories_fix/ui/intro_flow/auth_views/view_model/forgot_password_view_model.dart';
import 'package:calories_fix/ui/intro_flow/first_view/widgets/lang_and_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calories_fix/core/utils/custom_button.dart';
import 'package:calories_fix/core/utils/custom_text_form_field.dart';
import 'package:calories_fix/core/utils/dialog_utils.dart';
import 'package:calories_fix/core/utils/toast_utils.dart';
import 'package:calories_fix/core/utils/validations.dart';
import 'package:calories_fix/l10n/app_localizations.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForgotPasswordViewModel(),
      child: Consumer<ForgotPasswordViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            floatingActionButton: LangAndTheme(),
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.forgotPassword,
                style: context.semiBold20,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: viewModel.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 200.height,
                          child: Image.asset(Assets.assetsImagesForgotPassword),
                        ),
                      ),
                      20.verticalSizedBox,
                      Text(
                        AppLocalizations.of(
                          context,
                        )!.enterYourEmailAddressToReceiveAPasswordResetLink,
                        style: context.regular16,
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: viewModel.emailController,
                        validator: (value) =>
                            Validations().validateEmail(value, context),
                        labelText: AppLocalizations.of(context)!.email,
                        hintText: AppLocalizations.of(context)!.enterYourEmail,
                        prefixIcon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 30),
                      // ... (داخل الـ Column تحت الـ CustomButton)
                      CustomButton(
                        backgroundColor: viewModel.remainingTime > 0
                            ? Colors.grey
                            : AppColors.firstColor,
                        onPressed: viewModel.remainingTime > 0
                            ? () {}
                            : () => _handlePasswordReset(context, viewModel),
                        label: viewModel.remainingTime > 0
                            ? "${AppLocalizations.of(context)!.sendResetLink} (${viewModel.remainingTime})"
                            : AppLocalizations.of(context)!.sendResetLink,
                      ),
                  
                      const SizedBox(height: 20),
                  
                      if (viewModel.remainingTime > 0)
                        Row(
                          children: [
                            const Icon(Icons.info_outline),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.checkSpamMessage,
                                style: context.regular14,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _handlePasswordReset(
    BuildContext context,
    ForgotPasswordViewModel viewModel,
  ) async {
    DialogUtils.showLoadingDialog(context);
    try {
      await viewModel.sendResetPasswordEmail(context);
      if (!context.mounted) return;
      Navigator.pop(context);

      ToastUtils.showSuccessToast(
        AppLocalizations.of(context)!.passwordResetLinkSent,
        context,
      );
    } catch (e) {
      if (!context.mounted) return;
      Navigator.pop(context);
      ToastUtils.showErrorToast(e.toString(), context);
    }
  }
}
