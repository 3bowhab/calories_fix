import 'package:calories_fix/core/constants/app_routes.dart';
import 'package:calories_fix/core/responsive/responsive_config.dart';
import 'package:calories_fix/core/theme/app_theme.dart';
import 'package:calories_fix/firebase_options.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:calories_fix/providers/cart_provider.dart';
import 'package:calories_fix/providers/language_provider.dart';
import 'package:calories_fix/providers/theme_provider.dart';
import 'package:calories_fix/providers/user_provider.dart';
import 'package:calories_fix/services/prefs_service.dart';
import 'package:calories_fix/ui/intro_flow/auth_views/views/forgot_password_view.dart';
import 'package:calories_fix/ui/intro_flow/auth_views/views/user_info_view.dart';
import 'package:calories_fix/ui/intro_flow/auth_views/views/login_view.dart';
import 'package:calories_fix/ui/intro_flow/auth_views/views/register_view.dart';
import 'package:calories_fix/ui/intro_flow/first_view/views/intro_view.dart';
import 'package:calories_fix/ui/intro_flow/onboarding_views/onboarding_views.dart';
import 'package:calories_fix/ui/main_flow/menu/views/meal_details_view.dart';
import 'package:calories_fix/ui/main_flow/main_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final bool seenIntro = await PrefsService.hasSeenIntro();
  final firebaseUser = FirebaseAuth.instance.currentUser;
  final userProvider = UserProvider();

  if (firebaseUser != null) {
    await userProvider.getUserData(firebaseUser.uid);
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (_) => LanguageProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider<UserProvider>.value(value: userProvider),
      ],
      child: MyApp(seenIntro: seenIntro, isLoggedIn: firebaseUser != null),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.seenIntro, required this.isLoggedIn});

  final bool seenIntro;
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    ResponsiveConfig.init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Localization setup
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.currentLanguage),

      // dynamic font based on locale
      builder: (context, child) {
        final lang = languageProvider.currentLanguage;

        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: lang == 'ar'
                ? GoogleFonts.cairoTextTheme(Theme.of(context).textTheme)
                : GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          ),
          child: child!,
        );
      },

      // Theme setup
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentMode,

      // Initial route setup
      initialRoute: getInitialRoute(),
      routes: {
        AppRoutes.introView: (context) => const IntroView(),
        AppRoutes.onboardingsView: (context) => const OnBoardingViews(),
        AppRoutes.loginView: (context) => const LoginView(),
        AppRoutes.registerView: (context) => const RegisterView(),
        AppRoutes.userInfoView: (context) => const UserInfoView(),
        AppRoutes.forgotPasswordView: (context) => const ForgotPasswordView(),
        AppRoutes.mainView: (context) => const MainView(),
        AppRoutes.mealView: (context) => const MealDetailsView(),
      },
    );
  }

  String getInitialRoute() {
    if (isLoggedIn) {
      return AppRoutes.mainView;
    } else if (!seenIntro) {
      return AppRoutes.introView;
    } else {
      return AppRoutes.registerView;
    }
  }
}
