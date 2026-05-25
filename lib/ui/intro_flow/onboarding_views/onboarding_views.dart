import 'package:calories_fix/core/constants/app_routes.dart';
import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:calories_fix/services/prefs_service.dart';
import 'package:calories_fix/ui/intro_flow/onboarding_views/pages_list.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';

class OnBoardingViews extends StatelessWidget {
  const OnBoardingViews({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages(context),
      showBackButton: true,
      globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      next: Text(AppLocalizations.of(context)!.next, style: context.semiBold16),
      done: Text(
        AppLocalizations.of(context)!.finish,
        style: context.semiBold16,
      ),
      back: Text(AppLocalizations.of(context)!.back, style: context.semiBold16),
      // autoScrollDuration: 10000,
      controlsPadding: const EdgeInsets.only(bottom: 50),
      dotsDecorator: DotsDecorator(
        activeColor: AppColors.firstColor,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(borderRadius: .circular(25)),
      ),
      onDone: () async {
        await PrefsService.setIntroSeen();
        if (!context.mounted) return;
        Navigator.pushReplacementNamed(context, AppRoutes.registerView);
      },
    );
  }
}
