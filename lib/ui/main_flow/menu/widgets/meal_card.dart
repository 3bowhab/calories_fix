import 'package:calories_fix/core/constants/app_routes.dart';
import 'package:calories_fix/core/extensions/responsive_padding_extension.dart';
import 'package:calories_fix/core/extensions/responsive_size_extension.dart';
import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:calories_fix/models/food_model.dart';
import 'package:calories_fix/ui/main_flow/menu/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class MealCard extends StatefulWidget {
  final FoodModel food;
  const MealCard({super.key, required this.food});

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.mealView,
          arguments: widget.food,
        );
      },
      child: Container(
        padding: 10.allPadding,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.food.imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.food.name,
              style: context.semiBold16,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  '${widget.food.calories} ${AppLocalizations.of(context)!.kcal}',
                  style: context.semiBold14.copyWith(
                    color: AppColors.firstColor,
                  ),
                ),
                Spacer(),
                FavoriteButton(
                  // onFavoriteChanged: (isFav) {
                  //   print("Meal favorite status: $isFav");
                  //   // هنا تقدر تعمل أي حاجة تانية لما يدوس، زي التخزين في الـ Database
                  // },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
