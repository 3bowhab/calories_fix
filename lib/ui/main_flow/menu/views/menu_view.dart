import 'package:calories_fix/core/extensions/responsive_padding_extension.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:calories_fix/providers/cart_provider.dart';
import 'package:calories_fix/ui/main_flow/menu/views/tab_view.dart';
import 'package:calories_fix/ui/main_flow/menu/widgets/cart_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  void initState() {
    super.initState();
    // بننادي عليها هنا عشان يبدأ يراقب السلة في Firebase أول ما التطبيق يفتح
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartProvider>().startCartListener();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(local.browseMenus, style: context.semiBold20),
          actions: [
            Padding(
              padding: 5.rightPadding,
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // عشان تقدر تتحكم في الطول
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    builder: (context) => const CartBottomSheet(),
                  );
                },
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            ),
          ],
          bottom: TabBar(
            indicatorWeight: 3,
            tabs: [
              Tab(text: local.breakfast),
              Tab(text: local.salads),
              Tab(text: local.mainMeals),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabView(isbreakfast: true),
            TabView(issalads: true),
            TabView(),
          ],
        ),
      ),
    );
  }
}
