import 'package:calories_fix/core/constants/app_padding.dart';
import 'package:calories_fix/core/extensions/responsive_padding_extension.dart';
import 'package:calories_fix/core/extensions/responsive_size_extension.dart';
import 'package:calories_fix/core/extensions/responsive_sized_box_extension.dart';
import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';
import 'package:calories_fix/core/utils/custom_button.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:calories_fix/models/food_model.dart';
import 'package:calories_fix/ui/main_flow/menu/widgets/add_to_cart_dialog.dart';
import 'package:calories_fix/ui/main_flow/menu/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as FoodModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.mealDetails,
          style: context.semiBold20,
        ),
        actions: [
          Padding(padding: 10.horizontalPadding, child: FavoriteButton(size: 25)),
        ],
      ),
      body: Padding(
        padding: AppPadding.view,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(food.imagePath),
                    16.verticalSizedBox,
                    Text(food.name, style: context.bold20),
                    16.verticalSizedBox,
                    Row(
                      children: [
                        Text(food.weight, style: context.regular16),
                        Spacer(),
                        Text(
                          '${food.calories} ${AppLocalizations.of(context)!.kcal}',
                          style: context.semiBold16.copyWith(
                            color: AppColors.firstColor,
                          ),
                        ),
                      ],
                    ),
                    16.verticalSizedBox,
                    Row(
                      children: [
                        Expanded(
                          child: mealInfo(
                            context,
                            AppLocalizations.of(context)!.protein,
                            '${food.protein}',
                          ),
                        ),
                        10.horizontalSizedBox,
                        Expanded(
                          child: mealInfo(
                            context,
                            AppLocalizations.of(context)!.carbs,
                            '${food.carbs}',
                          ),
                        ),
                      ],
                    ),
                    16.verticalSizedBox,
                    Row(
                      children: [
                        Expanded(
                          child: mealInfo(
                            context,
                            AppLocalizations.of(context)!.fats,
                            '${food.fat}',
                          ),
                        ),
                      ],
                    ),
                    16.verticalSizedBox,
                    Text(
                      AppLocalizations.of(context)!.ingredients,
                      style: context.semiBold16,
                    ),
                    Text(food.ingredients, style: context.regular14),
                    Spacer(),
                    CustomButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AddToCartDialog(food: food),
                        );
                      },
                      label: AppLocalizations.of(context)!.orderNow,
                    ),
                    8.verticalSizedBox,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container mealInfo(BuildContext context, String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.height, horizontal: 12.width),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: context.regular14.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          Spacer(),
          Text(
            '$value ${AppLocalizations.of(context)!.gram}',
            style: context.semiBold14,
          ),
        ],
      ),
    );
  }
}
