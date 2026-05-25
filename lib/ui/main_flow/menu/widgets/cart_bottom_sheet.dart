import 'package:calories_fix/core/extensions/responsive_padding_extension.dart';
import 'package:calories_fix/core/extensions/responsive_size_extension.dart';
import 'package:calories_fix/core/extensions/responsive_sized_box_extension.dart';
import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';
import 'package:calories_fix/core/utils/custom_button.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:calories_fix/providers/cart_provider.dart';
import 'package:calories_fix/models/food_model.dart'; // تأكد من استيراد الموديل
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final cartItems = cartProvider.items;

        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(local.yourCart, style: context.bold20),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.firstColor),
                  ),
                ],
              ),
              const Divider(),

              // عرض قائمة الأصناف
              Expanded(
                child: cartItems.isEmpty
                    ? Center(
                        child: Text(
                          local.yourCartEmpty,
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          final FoodModel meal = cartProvider.getMealById(
                            context,
                            item.productId,
                          );

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                // صورة الأكلة
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    meal.imagePath,
                                    width: 80.width,
                                    height: 70.height,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                10.horizontalSizedBox,
                                // تفاصيل الأكلة
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        meal.name, // الاسم هيتغير تلقائياً مع لغة الـ context
                                        style: context.semiBold16,
                                      ),
                                      5.verticalSizedBox,
                                      Row(
                                        children: [
                                          quantityCounter(cartProvider, index, context),
                                          const Spacer(),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete_outline,
                                              color: Colors.redAccent,
                                            ),
                                            onPressed: () => cartProvider.removeItem(item.productId),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),

              const Divider(),
              // Total & Checkout
              Padding(
                padding: 10.verticalPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(local.total, style: context.semiBold20),
                    Text(
                      '${cartProvider.getTotalAmount(context).toStringAsFixed(2)} ${AppLocalizations.of(context)!.aed}', // الحساب برضه لازم ياخد context
                      style: context.bold20.copyWith(color: AppColors.firstColor),
                    ),
                  ],
                ),
              ),
              CustomButton(
                onPressed: cartItems.isEmpty
                    ? () {}
                    : () {
                        // الانتقال لصفحة الدفع
                      },
                label: local.checkout,
                backgroundColor: cartItems.isEmpty ? AppColors.inputBorder : null,
              ),
              5.verticalSizedBox,
            ],
          ),
        );
      },
    );
  }

  Widget quantityCounter(CartProvider provider, int index, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.width, vertical: 2.height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.secondaryContainer, 
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => provider.updateQuantity(index, false),
            icon: const Icon(Icons.remove, size: 18),
            constraints: const BoxConstraints(),
            padding: 4.allPadding,
          ),
          Padding(
            padding: 8.horizontalPadding,
            child: Text(
              '${provider.items[index].quantity}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: () => provider.updateQuantity(index, true),
            icon: const Icon(Icons.add, size: 18),
            constraints: const BoxConstraints(),
            padding: 4.allPadding,
          ),
        ],
      ),
    );
  }
}
