import 'package:calories_fix/providers/language_provider.dart';
import 'package:calories_fix/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LangAndTheme extends StatelessWidget {
  const LangAndTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Row(
      children: [
        IconButton(
          onPressed: () {
            themeProvider.toggleTheme(
              themeProvider.currentMode == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light,
            );
          },
          icon: Icon(Icons.arrow_forward_outlined),
        ),
        IconButton(
          onPressed: () {
            languageProvider.changeLanguage(
              languageProvider.currentLanguage == 'en' ? 'ar' : 'en',
            );
          },
          icon: Icon(Icons.language),
        ),
      ],
    );
  }
}
