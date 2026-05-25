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
import 'package:calories_fix/ui/intro_flow/auth_views/view_model/user_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserInfoViewModel(),
      child: Consumer<UserInfoViewModel>(
        builder: (context, viewModel, child) {
          return GestureDetector(
            onTap: () => FocusUtil.hideKeyboard(context),
            child: Scaffold(
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: AppPadding.view,
                    child: Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLogo(),
                          20.verticalSizedBox,
                          _buildWelcomeText(context),
                          20.verticalSizedBox,
                          _buildFormFields(context, viewModel),
                          20.verticalSizedBox,
                          _buildConfirmButton(context, viewModel),
                          20.verticalSizedBox,
                        ],
                      ),
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

  // --- UI Components Widgets ---

  Widget _buildLogo() {
    return Center(
      child: SizedBox(
        height: 200.height,
        child: Image.asset(Assets.assetsImagesLogo),
      ),
    );
  }

  Widget _buildWelcomeText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.enterYourInformation,
          style: context.semiBold20,
        ),
        Text(
          AppLocalizations.of(context)!.pleaseProvideYourDetailsForAccurateAndFastDelivery,
          style: context.regular14.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildFormFields(BuildContext context, UserInfoViewModel viewModel) {
    return Column(
      children: [
        CustomTextFormField(
          controller: viewModel.nameController,
          validator: (value) => Validations().validateName(value, context),
          hintText: AppLocalizations.of(context)!.enterYourName,
          labelText: AppLocalizations.of(context)!.name,
          prefixIcon: Icons.person_outline,
          keyboardType: TextInputType.name,
        ),
        16.verticalSizedBox,
        CustomTextFormField(
          controller: viewModel.phoneController,
          validator: (value) => Validations().validatePhone(value, context),
          labelText: AppLocalizations.of(context)!.phone,
          hintText: AppLocalizations.of(context)!.enterYourPhone,
          prefixIcon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),
        16.verticalSizedBox,
        CustomTextFormField(
          controller: viewModel.addressController,
          validator: (value) => Validations().validateAddress(value, context),
          labelText: AppLocalizations.of(context)!.address,
          hintText: AppLocalizations.of(context)!.enterYourAddress,
          prefixIcon: Icons.location_on_outlined,
          keyboardType: TextInputType.streetAddress,
        ),
        16.verticalSizedBox,
        CustomTextFormField(
          controller: viewModel.deliveryInstructionsController,
          validator: (value) => null,
          labelText: AppLocalizations.of(context)!.deliveryInstructions,
          hintText: AppLocalizations.of(context)!.enterDeliveryInstructions,
          prefixIcon: Icons.description_outlined,
          keyboardType: TextInputType.text,
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildConfirmButton(BuildContext context, UserInfoViewModel viewModel) {
    return CustomButton(
      onPressed: () async {
        DialogUtils.showLoadingDialog(context);
        try {
          bool success = await viewModel.userInfo(context);
          if (!context.mounted) return;
          Navigator.pop(context); // Close Loading
          if (success) {
            ToastUtils.showSuccessToast(
              AppLocalizations.of(context)!.informationsSavedSuccessfully,
              context,
            );
            Navigator.pushReplacementNamed(context, AppRoutes.mainView);
          }
        } catch (e) {
          Navigator.pop(context); // Close Loading
          ToastUtils.showErrorToast(e.toString(), context);
        }
      },
      label: AppLocalizations.of(context)!.confirm,
    );
  }
}
