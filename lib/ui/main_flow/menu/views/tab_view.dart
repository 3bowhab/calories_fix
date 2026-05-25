import 'package:calories_fix/core/extensions/responsive_padding_extension.dart';
import 'package:calories_fix/ui/main_flow/menu/widgets/meal_card.dart';
import 'package:calories_fix/ui/main_flow/menu/widgets/meals_lists.dart';
import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  const TabView({
    this.isbreakfast = false,
    this.issalads = false,
    super.key,
  });

  final bool isbreakfast;
  final bool issalads;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      padding: 16.allPadding,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.60,
      ),
      itemCount: isbreakfast
          ?  MealsLists.breakfastMeals(context).length
          : issalads
              ? MealsLists.saladsMeals(context).length
              : MealsLists.mainMeals(context).length,
                  
      itemBuilder: (context, index) {
        return MealCard(food: isbreakfast
              ? MealsLists.breakfastMeals(context)[index]
              : issalads
              ? MealsLists.saladsMeals(context)[index]
              : MealsLists.mainMeals(context)[index],
        );
      },
    );
  }
}