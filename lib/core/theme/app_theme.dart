import 'package:calories_fix/core/extensions/responsive_size_extension.dart';
import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.bodyColor,

    colorScheme: const ColorScheme.light(
      primary: AppColors.firstColor,
      primaryFixed: AppColors.bodyColor,
      primaryContainer: AppColors.containerColor,
      secondaryContainer: AppColors.firstColorLight,
      onSurface: AppColors.titleColor,
      onSurfaceVariant: AppColors.textColor,
      onSecondary: AppColors.inputBackground,
      onPrimary: AppColors.buttonColorDark,
    ),
    
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bodyColor,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
    ),

    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: AppColors.inputBackground,
      prefixIconColor: AppColors.inputBorder,
      suffixIconColor: AppColors.inputBorder,
      hintStyle: TextStyle(color: AppColors.textColorDark),
      // labelStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.secText),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: AppColors.inputBorder,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: AppColors.firstColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: AppColors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: AppColors.red,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.firstColor,
        foregroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: Size(double.infinity, 48.height),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.bodyColor,
      elevation: 50,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.firstColor,
      unselectedItemColor: AppColors.textColor,
      selectedIconTheme: const IconThemeData(size: 28),
      unselectedIconTheme: const IconThemeData(size: 22),
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
    ),

    tabBarTheme: TabBarThemeData(
      indicatorColor: AppColors.firstColor,
      labelColor: AppColors.firstColor,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
    ),

    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: AppColors.main,
    //   foregroundColor: AppColors.white,
    //   shape: CircleBorder(),
    // ),

    // iconTheme: const IconThemeData(color: AppColors.main),

    // navigationBarTheme: NavigationBarThemeData(
    //   backgroundColor: AppColors.bodyColor,
    //   elevation: 0,
    //   indicatorColor: Colors.transparent,
    //   labelTextStyle: WidgetStateProperty.resolveWith((states) {
    //     if (states.contains(WidgetState.selected)) {
    //       return const TextStyle(
    //         color: AppColors.firstColor,
    //         fontWeight: FontWeight.bold,
    //         fontSize: 14,
    //       );
    //     }
    //     return const TextStyle(
    //       color: AppColors.textColor,
    //       fontWeight: FontWeight.normal,
    //       fontSize: 14,
    //     );
    //   }),
    //   iconTheme: WidgetStateProperty.resolveWith((states) {
    //     if (states.contains(WidgetState.selected)) {
    //       return const IconThemeData(color: AppColors.firstColor, size: 28);
    //     }
    //     return const IconThemeData(color: AppColors.textColor, size: 28);
    //   }),
    // ),
  );



  // Dark Theme
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bodyColorDark,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.firstColor,
      primaryFixed: AppColors.bodyColorDark,
      primaryContainer: AppColors.containerColorDark,
      secondaryContainer: AppColors.containerColorDark,
      onSurface: AppColors.titleColorDark,
      onSurfaceVariant: AppColors.textColorDark,
      onSecondary: AppColors.inputBackgroundDark,
      onPrimary: AppColors.firstColorAlt,
    ),
    
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bodyColorDark,
      foregroundColor: AppColors.titleColorDark,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
    ),

    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: AppColors.inputBackgroundDark,
      prefixIconColor: AppColors.inputBorder,
      suffixIconColor: AppColors.inputBorder,
      hintStyle: TextStyle(color: AppColors.textColorDark),
      // labelStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.secTextDarkMode),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.inputBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.firstColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.red),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColorDark,
        foregroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: Size(double.infinity, 48.height),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.bodyColorDark,
      elevation: 50,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.firstColor,
      unselectedItemColor: AppColors.textColorDark,
      selectedIconTheme: const IconThemeData(size: 28),
      unselectedIconTheme: const IconThemeData(size: 22),
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
    ),
    
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: AppColors.mainDarkMode,
    //   foregroundColor: AppColors.white,
    //   shape: CircleBorder(),
    // ),

    tabBarTheme: TabBarThemeData(
      indicatorColor: AppColors.firstColor,
      labelColor: AppColors.firstColor,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
    ),

    // iconTheme: const IconThemeData(color: AppColors.white),
    // navigationBarTheme: NavigationBarThemeData(
    //   backgroundColor: AppColors.containerColorDark,
    //   elevation: 0,
    //   indicatorColor: Colors.transparent,
    //   labelTextStyle: WidgetStateProperty.resolveWith((states) {
    //     if (states.contains(WidgetState.selected)) {
    //       return const TextStyle(
    //         color: AppColors.firstColor,
    //         fontWeight: FontWeight.bold,
    //         fontSize: 14,
    //       );
    //     }
    //     return const TextStyle(
    //       color: AppColors.titleColorDark,
    //       fontWeight: FontWeight.bold,
    //       fontSize: 14,
    //     );
    //   }),
    //   iconTheme: WidgetStateProperty.resolveWith((states) {
    //     if (states.contains(WidgetState.selected)) {
    //       return const IconThemeData(color: AppColors.firstColor, size: 28);
    //     }
    //     return const IconThemeData(color: AppColors.titleColorDark, size: 28);
    //   }),
    // ),
  );
}
