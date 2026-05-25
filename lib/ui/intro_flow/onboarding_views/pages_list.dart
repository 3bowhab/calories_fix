import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

// List of onboarding pages.
List<PageViewModel> pages(BuildContext context) => [
  pageViewModel(
    title: AppLocalizations.of(context)!.breakfast,
    body: AppLocalizations.of(context)!.breakfastDiscription,
    imageNumber: 1,
    context: context,
  ),
  pageViewModel(
    title: AppLocalizations.of(context)!.healthySalads,
    body: AppLocalizations.of(context)!.healthySaladsDiscription,
    imageNumber: 2,
    context: context,
  ),
  pageViewModel(
    title: AppLocalizations.of(context)!.mainHealthyMeals,
    body: AppLocalizations.of(context)!.mainHealthyMealsDiscription,
    imageNumber: 3,
    context: context,
  ),
];

// Method to create a PageViewModel.
PageViewModel pageViewModel({
  required String title,
  required String body,
  required int imageNumber,
  required BuildContext context,
}) {
  return PageViewModel(
    titleWidget: Text(
      title,
      style: context.black40.copyWith(color: AppColors.firstColor),
      textAlign: TextAlign.center,
    ),
    bodyWidget: Text(
      body,
      textAlign: TextAlign.center,
      style: context.regular16.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    ),
    image: SafeArea(
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.ourhealthMenus,
            style: context.semiBold24.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          Expanded(child: Image.asset('assets/images/onboarding$imageNumber.png')),
        ],
      ),
    ),
    decoration: const PageDecoration(imageFlex: 4, bodyFlex: 0),
  );
}
