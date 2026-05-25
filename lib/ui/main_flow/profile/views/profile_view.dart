import 'package:calories_fix/core/constants/app_routes.dart';
import 'package:calories_fix/core/utils/toast_utils.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:calories_fix/providers/cart_provider.dart';
import 'package:calories_fix/ui/intro_flow/first_view/widgets/lang_and_theme.dart';
import 'package:calories_fix/ui/main_flow/profile/widgets/custom_show_dialog.dart';
import 'package:calories_fix/ui/main_flow/profile/widgets/setting_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: LangAndTheme(),
      appBar: AppBar(title: const Text('Profile View')),
      body: Column(
        children: [
          const Center(child: Text('Welcome to the Profile View!')),
          SettingWidget(
            title: AppLocalizations.of(context)!.logout,
            trailing: CustomShowDialog(
              title: AppLocalizations.of(context)!.confirmLogout,
              contentText: AppLocalizations.of(
                context,
              )!.areYouSureYouWantToLogout,
              onConfirm: () async {
                Provider.of<CartProvider>(context, listen: false).clearData();
                // 2. انتظر ثانية بسيطة جداً لضمان انقطاع الاتصال (اختياري لكنه يضمن الهدوء)
                await Future.delayed(const Duration(milliseconds: 100));
                await FirebaseAuth.instance.signOut();

                if (context.mounted) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.loginView,
                    (route) => false,
                  );
                }

                if (context.mounted) {
                  ToastUtils.showSuccessToast(
                    AppLocalizations.of(context)!.loggedOutSuccessfully,
                    context,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
