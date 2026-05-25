import 'package:calories_fix/core/constants/app_images.dart';
import 'package:calories_fix/core/constants/app_padding.dart';
import 'package:calories_fix/core/constants/app_routes.dart';
import 'package:calories_fix/core/extensions/responsive_size_extension.dart';
import 'package:calories_fix/core/extensions/responsive_sized_box_extension.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';
import 'package:calories_fix/core/utils/custom_button.dart';
import 'package:calories_fix/core/utils/custom_text_form_field.dart';
import 'package:calories_fix/core/utils/dialog_utils.dart';
import 'package:calories_fix/core/utils/focus_util.dart';
import 'package:calories_fix/core/utils/toast_utils.dart';
import 'package:calories_fix/core/utils/validations.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:calories_fix/ui/intro_flow/auth_views/view_model/register_view_model.dart'; // تأكد من المسار
import 'package:calories_fix/ui/intro_flow/auth_views/widgets/auth_withgoogle_button.dart';
import 'package:calories_fix/ui/intro_flow/auth_views/widgets/create_or_dont_have_account.dart';
import 'package:calories_fix/ui/intro_flow/auth_views/widgets/or_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder: (context, viewModel, child) {
          return GestureDetector(
            onTap: () => FocusUtil.hideKeyboard(context),
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: AppPadding.view,
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLogo(),
                        20.verticalSizedBox,
                        _buildHeaderText(context),
                        20.verticalSizedBox,
                        _buildFormFields(context, viewModel),
                        30.verticalSizedBox,
                        _buildRegisterButton(context, viewModel),
                        30.verticalSizedBox,
                        _buildLoginOption(context),
                        20.verticalSizedBox,
                        const OrRow(),
                        20.verticalSizedBox,
                        _buildGoogleSignUp(context),
                        20.verticalSizedBox,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // --- UI Components ---

  Widget _buildLogo() {
    return Center(
      child: SizedBox(
        height: 200.height,
        child: Image.asset(Assets.assetsImagesLogo),
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.letsGetStarted,
          style: context.semiBold20,
        ),
        Text(
          AppLocalizations.of(context)!.createAnAccountToUnlockAllFeatures,
          style: context.regular14,
        ),
      ],
    );
  }

  Widget _buildFormFields(BuildContext context, RegisterViewModel viewModel) {
    return Column(
      children: [
        CustomTextFormField(
          controller: viewModel.emailController,
          validator: (value) => Validations().validateEmail(value, context),
          labelText: AppLocalizations.of(context)!.email,
          hintText: AppLocalizations.of(context)!.enterYourEmail,
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        16.verticalSizedBox,
        CustomTextFormField(
          controller: viewModel.passwordController,
          validator: (value) => Validations().validatePassword(value, context),
          labelText: AppLocalizations.of(context)!.password,
          hintText: AppLocalizations.of(context)!.enterYourPassword,
          prefixIcon: Icons.lock_outline,
          suffixIcon: Icons.visibility_off_outlined,
          isPassword: true,
          keyboardType: TextInputType.text,
        ),
        16.verticalSizedBox,
        CustomTextFormField(
          controller: viewModel.confirmPasswordController,
          validator: (value) => Validations().validateConfirmPassword(
            value,
            viewModel.passwordController.text,
            context,
          ),
          labelText: AppLocalizations.of(context)!.confirmPassword,
          hintText: AppLocalizations.of(context)!.confirmYourPassword,
          prefixIcon: Icons.lock_outline,
          suffixIcon: Icons.visibility_off_outlined,
          isPassword: true,
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }

  Widget _buildRegisterButton(
    BuildContext context,
    RegisterViewModel viewModel,
  ) {
    return CustomButton(
      onPressed: () async {
        DialogUtils.showLoadingDialog(context);
        try {
          bool success = await viewModel.register(context);
          if (!context.mounted) return;
          Navigator.pop(context); // Close Dialog
          if (success) {
            ToastUtils.showSuccessToast(
              AppLocalizations.of(context)!.accountCreatedSuccessfully,
              context,
            );
            Navigator.pushReplacementNamed(context, AppRoutes.userInfoView);
          }
        } catch (e) {
          Navigator.pop(context); // Close Dialog
          ToastUtils.showErrorToast(e.toString(), context);
        }
      },
      label: AppLocalizations.of(context)!.signUp,
    );
  }

  Widget _buildLoginOption(BuildContext context) {
    return CreateOrDontHaveAccount(
      text: AppLocalizations.of(context)!.alreadyHaveAnAccount,
      textButton: AppLocalizations.of(context)!.login,
      onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.loginView),
    );
  }

  Widget _buildGoogleSignUp(BuildContext context) {
    return AuthWithgoogleButton(
      label: AppLocalizations.of(context)!.signupwithgoogle,
      toastMessage: AppLocalizations.of(context)!.accountCreatedSuccessfully,
    );
  }
}
