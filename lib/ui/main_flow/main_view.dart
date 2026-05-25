import 'package:calories_fix/core/extensions/responsive_padding_extension.dart';
import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:calories_fix/ui/main_flow/menu/views/menu_view.dart';
import 'package:calories_fix/ui/main_flow/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> _pages = [const MenuView(), const ProfileView()];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double indicatorWidth = screenWidth / _pages.length;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: _pages,
      ),
      bottomNavigationBar: Stack(
        children: [
          Padding(
            padding: 5.topPadding,
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.restaurant_menu_outlined),
                  activeIcon: const Icon(Icons.restaurant_menu),
                  label: AppLocalizations.of(context)!.menu,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person_outline),
                  activeIcon: const Icon(Icons.person),
                  label: AppLocalizations.of(context)!.profile,
                ),
              ],
            ),
          ),

          AnimatedPositionedDirectional(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: 0,
            start:
                _currentIndex * indicatorWidth, 
            child: Container(
              width: indicatorWidth,
              height: 3,
              decoration: BoxDecoration(
                color: AppColors.firstColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
