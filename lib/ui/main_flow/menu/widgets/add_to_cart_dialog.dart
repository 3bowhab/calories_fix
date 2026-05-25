import 'package:calories_fix/core/extensions/responsive_padding_extension.dart';
import 'package:calories_fix/core/extensions/responsive_size_extension.dart';
import 'package:calories_fix/core/extensions/responsive_sized_box_extension.dart';
import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';
import 'package:calories_fix/core/utils/custom_button.dart';
import 'package:calories_fix/core/utils/toast_utils.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:calories_fix/models/food_model.dart';
import 'package:calories_fix/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartDialog extends StatefulWidget {
  final FoodModel food;

  const AddToCartDialog({super.key, required this.food});

  @override
  State<AddToCartDialog> createState() => _AddToCartDialogState();
}

class _AddToCartDialogState extends State<AddToCartDialog> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: 16.allPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.food.imagePath,
                height: 120.height,
                fit: BoxFit.contain,
              ),
            ),
            12.verticalSizedBox,
            Text(widget.food.name, style: context.bold16),
            16.verticalSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.quantity,
                  style: context.semiBold16,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.firstColor,
                        ),
                        onPressed: () {
                          if (quantity > 1) setState(() => quantity--);
                        },
                      ),
                      Text('$quantity', style: context.bold16),
                      IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_up,
                          color: AppColors.firstColor,
                        ),
                        onPressed: () => setState(() => quantity++),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            24.verticalSizedBox,
            CustomButton(
              isGoogleButton: true,
              onPressed: () async {
                // 2. أضفنا await قبل مناداة الميثود لأنها بتتعامل مع Firebase
                bool isAdded = await Provider.of<CartProvider>(
                  context,
                  listen: false,
                ).addToCart(widget.food.id, quantity);
                if (context.mounted) {
                  if (isAdded) {
                    ToastUtils.showSuccessToast(
                      AppLocalizations.of(context)!.addedToCart,
                      context,
                    );
                    Navigator.pop(context);
                    Navigator.pop(context);
                  } else {
                    ToastUtils.showWarningToast(
                      AppLocalizations.of(context)!.thisMealIsAlreadyInYourCart,
                      context,
                    );
                  }
                }
              },
              labelWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.addToCart,
                    style: context.semiBold16.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  10.horizontalSizedBox,
                  Icon(
                    Icons.add_shopping_cart_outlined,
                    color: AppColors.whiteColor,
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
