import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number:'**
  String get phoneNumber;

  /// No description provided for @textQuote.
  ///
  /// In en, this message translates to:
  /// **'Trusted by gym coaches and athletes across the UAE for clean, precise nutrition.'**
  String get textQuote;

  /// No description provided for @fixYourCalories.
  ///
  /// In en, this message translates to:
  /// **'Fix Your Calories, '**
  String get fixYourCalories;

  /// No description provided for @fuelYourBody.
  ///
  /// In en, this message translates to:
  /// **'Fuel Your Body'**
  String get fuelYourBody;

  /// No description provided for @homeDiscription.
  ///
  /// In en, this message translates to:
  /// **'Healthy, balanced meals designed by fitness experts to help you build muscle, lose fat, and stay energized every day.'**
  String get homeDiscription;

  /// No description provided for @orderYourMealsNow.
  ///
  /// In en, this message translates to:
  /// **'Order Your Meals Now'**
  String get orderYourMealsNow;

  /// No description provided for @breakfast.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get breakfast;

  /// No description provided for @healthySalads.
  ///
  /// In en, this message translates to:
  /// **'Healthy Salads'**
  String get healthySalads;

  /// No description provided for @mainHealthyMeals.
  ///
  /// In en, this message translates to:
  /// **'Main Healthy Meals'**
  String get mainHealthyMeals;

  /// No description provided for @breakfastDiscription.
  ///
  /// In en, this message translates to:
  /// **'Start your day with smart fuel. Our healthy breakfast options are perfectly balanced with protein, fiber, and essential nutrients to boost your energy, improve focus, and keep you full for hours — without unnecessary calories.'**
  String get breakfastDiscription;

  /// No description provided for @healthySaladsDiscription.
  ///
  /// In en, this message translates to:
  /// **'Fresh, flavorful, and macro-balanced. Our salads are crafted with premium ingredients and high-quality protein sources to support fat loss, muscle recovery, and clean eating — all without sacrificing taste.'**
  String get healthySaladsDiscription;

  /// No description provided for @mainHealthyMealsDiscription.
  ///
  /// In en, this message translates to:
  /// **'Power your performance with nutrient-dense main meals designed for active lifestyles. High in protein, perfectly portioned, and calorie-controlled to help you stay on track with your fitness goals.'**
  String get mainHealthyMealsDiscription;

  /// No description provided for @ourhealthMenus.
  ///
  /// In en, this message translates to:
  /// **'Our Health Menus'**
  String get ourhealthMenus;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @pleaseEnterYourName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get pleaseEnterYourName;

  /// No description provided for @nameMustBeAtLeast3Characters.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 3 characters'**
  String get nameMustBeAtLeast3Characters;

  /// No description provided for @pleaseEnterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get pleaseEnterYourEmail;

  /// No description provided for @invalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get invalidEmailFormat;

  /// No description provided for @pleaseEnterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get pleaseEnterYourPassword;

  /// No description provided for @passwordMustBeAtLeast8Characters.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordMustBeAtLeast8Characters;

  /// No description provided for @mustContainAtLeastOneUppercaseLetter.
  ///
  /// In en, this message translates to:
  /// **'Must contain at least one uppercase letter'**
  String get mustContainAtLeastOneUppercaseLetter;

  /// No description provided for @mustContainAtLeastOneNumber.
  ///
  /// In en, this message translates to:
  /// **'Must contain at least one number'**
  String get mustContainAtLeastOneNumber;

  /// No description provided for @pleaseConfirmYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get pleaseConfirmYourPassword;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @accountCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get accountCreatedSuccessfully;

  /// No description provided for @loggedInSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Logged in successfully'**
  String get loggedInSuccessfully;

  /// No description provided for @loggedOutSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Logged out successfully'**
  String get loggedOutSuccessfully;

  /// No description provided for @loginToYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Login to your account'**
  String get loginToYourAccount;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// No description provided for @confirmYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm your Password'**
  String get confirmYourPassword;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAnAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @loginWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get loginWithGoogle;

  /// No description provided for @createAnAccountToUnlockAllFeatures.
  ///
  /// In en, this message translates to:
  /// **'Create an account to unlock all features'**
  String get createAnAccountToUnlockAllFeatures;

  /// No description provided for @letsGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Get Started'**
  String get letsGetStarted;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAnAccount;

  /// No description provided for @signupwithgoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get signupwithgoogle;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @invalidEmailOrPassword.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get invalidEmailOrPassword;

  /// No description provided for @userDisabled.
  ///
  /// In en, this message translates to:
  /// **'User disabled'**
  String get userDisabled;

  /// No description provided for @tooManyRequests.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Try again later.'**
  String get tooManyRequests;

  /// No description provided for @checkYourInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection'**
  String get checkYourInternetConnection;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// No description provided for @operationNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'Operation not allowed'**
  String get operationNotAllowed;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'Email already in use'**
  String get emailAlreadyInUse;

  /// No description provided for @weakPassword.
  ///
  /// In en, this message translates to:
  /// **'The password provided is too weak'**
  String get weakPassword;

  /// No description provided for @requiresRecentLogin.
  ///
  /// In en, this message translates to:
  /// **'This operation is sensitive and requires recent authentication. Log in again before retrying.'**
  String get requiresRecentLogin;

  /// No description provided for @credentialAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'This credential is already associated with a different user account.'**
  String get credentialAlreadyInUse;

  /// No description provided for @accountExistsWithDifferentCredential.
  ///
  /// In en, this message translates to:
  /// **'An account already exists with a different credential.'**
  String get accountExistsWithDifferentCredential;

  /// No description provided for @requestTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request timeout. Please try again.'**
  String get requestTimeout;

  /// No description provided for @sessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Session expired. Please log in again.'**
  String get sessionExpired;

  /// No description provided for @anErrorOccurredPleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please try again.'**
  String get anErrorOccurredPleaseTryAgain;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @confirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Confirm Logout'**
  String get confirmLogout;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @areYouSureYouWantToLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get areYouSureYouWantToLogout;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @loginToContinueExploring.
  ///
  /// In en, this message translates to:
  /// **'Login to continue exploring'**
  String get loginToContinueExploring;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @enterYourInformation.
  ///
  /// In en, this message translates to:
  /// **'Enter your information'**
  String get enterYourInformation;

  /// No description provided for @pleaseProvideYourDetailsForAccurateAndFastDelivery.
  ///
  /// In en, this message translates to:
  /// **'Please provide your details for accurate and fast delivery'**
  String get pleaseProvideYourDetailsForAccurateAndFastDelivery;

  /// No description provided for @pleaseEnterYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get pleaseEnterYourPhoneNumber;

  /// No description provided for @invalidPhoneNumberFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number format'**
  String get invalidPhoneNumberFormat;

  /// No description provided for @pleaseEnterYourAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter your address'**
  String get pleaseEnterYourAddress;

  /// No description provided for @addressTooShort.
  ///
  /// In en, this message translates to:
  /// **'Address must be at least 10 characters'**
  String get addressTooShort;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @enterYourPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone'**
  String get enterYourPhone;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @enterYourAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter your address'**
  String get enterYourAddress;

  /// No description provided for @deliveryInstructions.
  ///
  /// In en, this message translates to:
  /// **'Delivery Instructions (optional)'**
  String get deliveryInstructions;

  /// No description provided for @enterDeliveryInstructions.
  ///
  /// In en, this message translates to:
  /// **'Enter delivery instructions (optional)'**
  String get enterDeliveryInstructions;

  /// No description provided for @informationsSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Informations saved successfully'**
  String get informationsSavedSuccessfully;

  /// No description provided for @enterYourEmailAddressToReceiveAPasswordResetLink.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address to receive a password reset link'**
  String get enterYourEmailAddressToReceiveAPasswordResetLink;

  /// No description provided for @passwordResetLinkSent.
  ///
  /// In en, this message translates to:
  /// **'Password reset link sent to your email'**
  String get passwordResetLinkSent;

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get sendResetLink;

  /// No description provided for @checkSpamMessage.
  ///
  /// In en, this message translates to:
  /// **'If you don\'t find the email, please check your Spam folder.'**
  String get checkSpamMessage;

  /// No description provided for @userNotFound.
  ///
  /// In en, this message translates to:
  /// **'This email is not registered.'**
  String get userNotFound;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection.'**
  String get networkError;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred, please try again.'**
  String get unknownError;

  /// No description provided for @wrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password, please try again.'**
  String get wrongPassword;

  /// No description provided for @invalidCredential.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password.'**
  String get invalidCredential;

  /// No description provided for @loginError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred during login, please try again later.'**
  String get loginError;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @browseMenus.
  ///
  /// In en, this message translates to:
  /// **'Browse Menus'**
  String get browseMenus;

  /// No description provided for @salads.
  ///
  /// In en, this message translates to:
  /// **'Salads'**
  String get salads;

  /// No description provided for @mainMeals.
  ///
  /// In en, this message translates to:
  /// **'Main Meals'**
  String get mainMeals;

  /// No description provided for @chiaPuddingName.
  ///
  /// In en, this message translates to:
  /// **'Chia Pudding with Fruits & Honey'**
  String get chiaPuddingName;

  /// No description provided for @chiaPuddingIngredients.
  ///
  /// In en, this message translates to:
  /// **'Chia seeds, yogurt, milk, mixed fruits, honey'**
  String get chiaPuddingIngredients;

  /// No description provided for @pancakesName.
  ///
  /// In en, this message translates to:
  /// **'Pancakes with Mixed Fruits and Honey'**
  String get pancakesName;

  /// No description provided for @pancakesIngredients.
  ///
  /// In en, this message translates to:
  /// **'2 pancakes, mixed fruits, honey (separate)'**
  String get pancakesIngredients;

  /// No description provided for @eggRollName.
  ///
  /// In en, this message translates to:
  /// **'Egg Roll'**
  String get eggRollName;

  /// No description provided for @eggRollIngredients.
  ///
  /// In en, this message translates to:
  /// **'3 eggs, bell peppers, onions, mix cheese, salad, olive oil dressing'**
  String get eggRollIngredients;

  /// No description provided for @saladWeight.
  ///
  /// In en, this message translates to:
  /// **'120 g salad'**
  String get saladWeight;

  /// No description provided for @croissantName.
  ///
  /// In en, this message translates to:
  /// **'Egg, Pasterma and Cream Cheese Croissant'**
  String get croissantName;

  /// No description provided for @croissantIngredients.
  ///
  /// In en, this message translates to:
  /// **'eggs, brown croissant, kiri cheese, pasterma'**
  String get croissantIngredients;

  /// No description provided for @halloumiSandwichName.
  ///
  /// In en, this message translates to:
  /// **'Egg Halloumi Sandwich'**
  String get halloumiSandwichName;

  /// No description provided for @halloumiSandwichIngredients.
  ///
  /// In en, this message translates to:
  /// **'eggs, brown toast, halloumi cheese, mayonnaise, salad'**
  String get halloumiSandwichIngredients;

  /// No description provided for @tunaSandwichName.
  ///
  /// In en, this message translates to:
  /// **'Tuna Sandwich'**
  String get tunaSandwichName;

  /// No description provided for @tunaSandwichIngredients.
  ///
  /// In en, this message translates to:
  /// **'Brown toast, tuna, bell peppers, mustard, light mayo, side salad'**
  String get tunaSandwichIngredients;

  /// No description provided for @tunaWeight.
  ///
  /// In en, this message translates to:
  /// **'150 g tuna'**
  String get tunaWeight;

  /// No description provided for @fajitasSandwichName.
  ///
  /// In en, this message translates to:
  /// **'Fajitas Cheese Sandwich'**
  String get fajitasSandwichName;

  /// No description provided for @fajitasSandwichIngredients.
  ///
  /// In en, this message translates to:
  /// **'chicken fajitas, lettuce, cucumber, mix cheese, French sauce'**
  String get fajitasSandwichIngredients;

  /// No description provided for @fajitasWeight.
  ///
  /// In en, this message translates to:
  /// **'150 g chicken fajitas'**
  String get fajitasWeight;

  /// No description provided for @g150.
  ///
  /// In en, this message translates to:
  /// **'150 g'**
  String get g150;

  /// No description provided for @kcal.
  ///
  /// In en, this message translates to:
  /// **'kcal'**
  String get kcal;

  /// No description provided for @fetaCheeseSaladName.
  ///
  /// In en, this message translates to:
  /// **'Feta Cheese Salad'**
  String get fetaCheeseSaladName;

  /// No description provided for @fetaWeight100g.
  ///
  /// In en, this message translates to:
  /// **'100 g feta'**
  String get fetaWeight100g;

  /// No description provided for @fetaCheeseSaladIngredients.
  ///
  /// In en, this message translates to:
  /// **'Feta cheese, lettuce, cherry tomatoes, cucumber, thyme, avocado cubes'**
  String get fetaCheeseSaladIngredients;

  /// No description provided for @tunaSaladName.
  ///
  /// In en, this message translates to:
  /// **'Tuna Salad'**
  String get tunaSaladName;

  /// No description provided for @tunaWeight160g.
  ///
  /// In en, this message translates to:
  /// **'160 g tuna'**
  String get tunaWeight160g;

  /// No description provided for @tunaSaladIngredients.
  ///
  /// In en, this message translates to:
  /// **'Tuna, lettuce, tomatoes, bell peppers, cucumber, olives, dill, celery'**
  String get tunaSaladIngredients;

  /// No description provided for @bowlOfEggSaladName.
  ///
  /// In en, this message translates to:
  /// **'Bowl of Egg Salad'**
  String get bowlOfEggSaladName;

  /// No description provided for @eggSaladWeight.
  ///
  /// In en, this message translates to:
  /// **'150-170 g'**
  String get eggSaladWeight;

  /// No description provided for @bowlOfEggSaladIngredients.
  ///
  /// In en, this message translates to:
  /// **'2 boiled eggs, beetroot, cherry tomatoes, bell peppers, arugula, lettuce, cucumber, walnuts, sweet potatoes cubes, olive oil dressing'**
  String get bowlOfEggSaladIngredients;

  /// No description provided for @shrimpsCaesarSaladName.
  ///
  /// In en, this message translates to:
  /// **'Shrimps Caesar Salad'**
  String get shrimpsCaesarSaladName;

  /// No description provided for @shrimpsWeight120g.
  ///
  /// In en, this message translates to:
  /// **'120 g shrimps'**
  String get shrimpsWeight120g;

  /// No description provided for @shrimpsCaesarSaladIngredients.
  ///
  /// In en, this message translates to:
  /// **'Shrimps, lettuce, cucumber, cherry tomatoes, olives, toast, parmesan cheese, light caesar sauce'**
  String get shrimpsCaesarSaladIngredients;

  /// No description provided for @chickenCaesarSaladName.
  ///
  /// In en, this message translates to:
  /// **'Chicken Caesar Salad'**
  String get chickenCaesarSaladName;

  /// No description provided for @chickenWeight140g.
  ///
  /// In en, this message translates to:
  /// **'140 g chicken'**
  String get chickenWeight140g;

  /// No description provided for @chickenCaesarSaladIngredients.
  ///
  /// In en, this message translates to:
  /// **'Grilled chicken, lettuce, cucumber, cherry tomatoes, olives, radish, toast, parmesan cheese, light caesar sauce'**
  String get chickenCaesarSaladIngredients;

  /// No description provided for @crispyChickenSaladName.
  ///
  /// In en, this message translates to:
  /// **'Crispy Chicken Salad'**
  String get crispyChickenSaladName;

  /// No description provided for @crispyChickenSaladIngredients.
  ///
  /// In en, this message translates to:
  /// **'Crispy chicken, lettuce, cucumber, cherry tomatoes, arugula, sweet corn, bell peppers, radish, french sauce'**
  String get crispyChickenSaladIngredients;

  /// No description provided for @grilledKoftaWithVegName.
  ///
  /// In en, this message translates to:
  /// **'Grilled Kofta with Vegetables'**
  String get grilledKoftaWithVegName;

  /// No description provided for @kofta150g.
  ///
  /// In en, this message translates to:
  /// **'150 g kofta'**
  String get kofta150g;

  /// No description provided for @grilledKoftaWithVegIngredients.
  ///
  /// In en, this message translates to:
  /// **'Grilled kofta, carrots, mushrooms, zucchini, bell pepper, tahini dressing'**
  String get grilledKoftaWithVegIngredients;

  /// No description provided for @grilledKoftaMealName.
  ///
  /// In en, this message translates to:
  /// **'Grilled Kofta Meal'**
  String get grilledKoftaMealName;

  /// No description provided for @koftaRiceMealWeight.
  ///
  /// In en, this message translates to:
  /// **'150 g kofta + 130 g rice'**
  String get koftaRiceMealWeight;

  /// No description provided for @grilledKoftaMealIngredients.
  ///
  /// In en, this message translates to:
  /// **'Grilled kofta, yellow rice, special dressing'**
  String get grilledKoftaMealIngredients;

  /// No description provided for @grilledChickenMealName.
  ///
  /// In en, this message translates to:
  /// **'Grilled Chicken Meal'**
  String get grilledChickenMealName;

  /// No description provided for @chickenRiceMealWeight.
  ///
  /// In en, this message translates to:
  /// **'140 g chicken + 130 g rice'**
  String get chickenRiceMealWeight;

  /// No description provided for @grilledChickenMealIngredients.
  ///
  /// In en, this message translates to:
  /// **'Grilled chicken, Mexican rice, red sauce'**
  String get grilledChickenMealIngredients;

  /// No description provided for @chickenKabsaMealName.
  ///
  /// In en, this message translates to:
  /// **'Chicken Kabsa Meal'**
  String get chickenKabsaMealName;

  /// No description provided for @chickenKabsaWeight.
  ///
  /// In en, this message translates to:
  /// **'140 g chicken + 130 g kabsa rice'**
  String get chickenKabsaWeight;

  /// No description provided for @chickenKabsaIngredients.
  ///
  /// In en, this message translates to:
  /// **'Grilled chicken, kabsa rice, carrots, demi-glace sauce'**
  String get chickenKabsaIngredients;

  /// No description provided for @chickenCordonBleuName.
  ///
  /// In en, this message translates to:
  /// **'Chicken Cordon Bleu'**
  String get chickenCordonBleuName;

  /// No description provided for @cordonBleuWeight.
  ///
  /// In en, this message translates to:
  /// **'120 g chicken + 100 g rice'**
  String get cordonBleuWeight;

  /// No description provided for @chickenCordonBleuIngredients.
  ///
  /// In en, this message translates to:
  /// **'120 g Chicken breast, mix cheese, smoked turkey, salami, white sauce, 100 g rice'**
  String get chickenCordonBleuIngredients;

  /// No description provided for @chickenBurgerName.
  ///
  /// In en, this message translates to:
  /// **'Chicken Burger'**
  String get chickenBurgerName;

  /// No description provided for @chickenBurgerWeight.
  ///
  /// In en, this message translates to:
  /// **'130 g chicken + 60 g bun'**
  String get chickenBurgerWeight;

  /// No description provided for @chickenBurgerIngredients.
  ///
  /// In en, this message translates to:
  /// **'130 g chicken, 60 g bun, lettuce, cucumber, 10 g mix cheese, 10 g French sauce'**
  String get chickenBurgerIngredients;

  /// No description provided for @chickenCheesePizzaName.
  ///
  /// In en, this message translates to:
  /// **'Chicken Cheese Pizza (2 Pieces)'**
  String get chickenCheesePizzaName;

  /// No description provided for @pizzaWeight.
  ///
  /// In en, this message translates to:
  /// **'2 slices whole wheat pizza'**
  String get pizzaWeight;

  /// No description provided for @chickenCheesePizzaIngredients.
  ///
  /// In en, this message translates to:
  /// **'Chicken, whole wheat dough, olives, bell peppers, light mozzarella'**
  String get chickenCheesePizzaIngredients;

  /// No description provided for @mushroomAlfredoPastaName.
  ///
  /// In en, this message translates to:
  /// **'Mushroom Alfredo Pasta'**
  String get mushroomAlfredoPastaName;

  /// No description provided for @pastaWeight.
  ///
  /// In en, this message translates to:
  /// **'140 g chicken + 100 g pasta'**
  String get pastaWeight;

  /// No description provided for @mushroomAlfredoPastaIngredients.
  ///
  /// In en, this message translates to:
  /// **'140 g chicken, 100 g pasta, mushrooms, light white sauce'**
  String get mushroomAlfredoPastaIngredients;

  /// No description provided for @spaghettiBologneseName.
  ///
  /// In en, this message translates to:
  /// **'Spaghetti Bolognese'**
  String get spaghettiBologneseName;

  /// No description provided for @spaghettiWeight.
  ///
  /// In en, this message translates to:
  /// **'130 g minced beef + 130 g spaghetti'**
  String get spaghettiWeight;

  /// No description provided for @spaghettiBologneseIngredients.
  ///
  /// In en, this message translates to:
  /// **'130 g minced beef, onions, garlic, red sauce, bell peppers, parsley, 130 g spaghetti'**
  String get spaghettiBologneseIngredients;

  /// No description provided for @chickenLasagnaName.
  ///
  /// In en, this message translates to:
  /// **'Chicken Lasagna'**
  String get chickenLasagnaName;

  /// No description provided for @lasagnaWeight120.
  ///
  /// In en, this message translates to:
  /// **'120 g'**
  String get lasagnaWeight120;

  /// No description provided for @chickenLasagnaIngredients.
  ///
  /// In en, this message translates to:
  /// **'Chicken, lasagna sheets, light mozzarella, cooking cream'**
  String get chickenLasagnaIngredients;

  /// No description provided for @seafoodLasagnaName.
  ///
  /// In en, this message translates to:
  /// **'Seafood Lasagna'**
  String get seafoodLasagnaName;

  /// No description provided for @seafoodLasagnaWeight.
  ///
  /// In en, this message translates to:
  /// **'120 g seafood + 100 g lasagna'**
  String get seafoodLasagnaWeight;

  /// No description provided for @seafoodLasagnaIngredients.
  ///
  /// In en, this message translates to:
  /// **'120 g seafood mix, 100 g lasagna sheets, light mozzarella, cooking cream'**
  String get seafoodLasagnaIngredients;

  /// No description provided for @beefLasagnaName.
  ///
  /// In en, this message translates to:
  /// **'Beef Lasagna'**
  String get beefLasagnaName;

  /// No description provided for @beefLasagnaWeight.
  ///
  /// In en, this message translates to:
  /// **'120 g beef + 100 g lasagna'**
  String get beefLasagnaWeight;

  /// No description provided for @beefLasagnaIngredients.
  ///
  /// In en, this message translates to:
  /// **'120 g beef, 100 g lasagna sheets, light mozzarella, cooking cream'**
  String get beefLasagnaIngredients;

  /// No description provided for @beefStroganoffMealName.
  ///
  /// In en, this message translates to:
  /// **'Beef Stroganoff Meal'**
  String get beefStroganoffMealName;

  /// No description provided for @beefStroganoffWeight.
  ///
  /// In en, this message translates to:
  /// **'140 g beef + 100 g mashed potatoes'**
  String get beefStroganoffWeight;

  /// No description provided for @beefStroganoffIngredients.
  ///
  /// In en, this message translates to:
  /// **'140 g beef, onions, broccoli, bell peppers, demi-glace sauce, cooking cream, mashed potatoes'**
  String get beefStroganoffIngredients;

  /// No description provided for @beefSteakPotatoWedgesName.
  ///
  /// In en, this message translates to:
  /// **'Beef Steak Meal (Potato Wedges)'**
  String get beefSteakPotatoWedgesName;

  /// No description provided for @beefSteakWedgesWeight.
  ///
  /// In en, this message translates to:
  /// **'140 g beef steak + 100 g potato wedges'**
  String get beefSteakWedgesWeight;

  /// No description provided for @beefSteakWedgesIngredients.
  ///
  /// In en, this message translates to:
  /// **'140 g beef steak, broccoli, mushrooms, demi-glace sauce, cooking cream, potato wedges'**
  String get beefSteakWedgesIngredients;

  /// No description provided for @beefSteakMashedPotatoName.
  ///
  /// In en, this message translates to:
  /// **'Beef Steak Meal (Mashed Potatoes)'**
  String get beefSteakMashedPotatoName;

  /// No description provided for @beefSteakMashedWeight.
  ///
  /// In en, this message translates to:
  /// **'140 g beef steak + 100 g mashed potatoes'**
  String get beefSteakMashedWeight;

  /// No description provided for @beefSteakMashedIngredients.
  ///
  /// In en, this message translates to:
  /// **'140 g beef steak, broccoli, mushrooms, demi-glace sauce, cooking cream, mashed potatoes'**
  String get beefSteakMashedIngredients;

  /// No description provided for @beefBallsWithRiceName.
  ///
  /// In en, this message translates to:
  /// **'Beef Balls with Rice'**
  String get beefBallsWithRiceName;

  /// No description provided for @beefBallsWeight.
  ///
  /// In en, this message translates to:
  /// **'150 g beef balls + 130 g rice'**
  String get beefBallsWeight;

  /// No description provided for @beefBallsIngredients.
  ///
  /// In en, this message translates to:
  /// **'150 g grilled beef balls, 130 g rice, 40 g red sauce'**
  String get beefBallsIngredients;

  /// No description provided for @grilledFishWithRiceName.
  ///
  /// In en, this message translates to:
  /// **'Grilled Fish with Rice'**
  String get grilledFishWithRiceName;

  /// No description provided for @grilledFishWeight.
  ///
  /// In en, this message translates to:
  /// **'150 g grilled fish + 130 g rice'**
  String get grilledFishWeight;

  /// No description provided for @grilledFishIngredients.
  ///
  /// In en, this message translates to:
  /// **'150 g grilled fish, 130 g rice, lemon butter sauce (separate)'**
  String get grilledFishIngredients;

  /// No description provided for @grilledSalmonWithRiceName.
  ///
  /// In en, this message translates to:
  /// **'Grilled Salmon with Rice'**
  String get grilledSalmonWithRiceName;

  /// No description provided for @salmonRiceWeight.
  ///
  /// In en, this message translates to:
  /// **'110 g grilled salmon + 120 g rice'**
  String get salmonRiceWeight;

  /// No description provided for @salmonRiceIngredients.
  ///
  /// In en, this message translates to:
  /// **'110 g grilled salmon, 120 g rice, lemon butter sauce (separate)'**
  String get salmonRiceIngredients;

  /// No description provided for @grilledSalmonWithVegName.
  ///
  /// In en, this message translates to:
  /// **'Grilled Salmon with Vegetables'**
  String get grilledSalmonWithVegName;

  /// No description provided for @salmonVegWeight.
  ///
  /// In en, this message translates to:
  /// **'120 g salmon + 120 g grilled vegetables'**
  String get salmonVegWeight;

  /// No description provided for @salmonVegIngredients.
  ///
  /// In en, this message translates to:
  /// **'120 g grilled salmon, 120 g grilled vegetables (carrots, mushrooms, zucchini, bell pepper), dill, cooking cream, lemon juice, salt, pepper'**
  String get salmonVegIngredients;

  /// No description provided for @carbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get carbs;

  /// No description provided for @protein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get protein;

  /// No description provided for @fats.
  ///
  /// In en, this message translates to:
  /// **'Fats'**
  String get fats;

  /// No description provided for @gram.
  ///
  /// In en, this message translates to:
  /// **'g'**
  String get gram;

  /// No description provided for @mealDetails.
  ///
  /// In en, this message translates to:
  /// **'Meal Details'**
  String get mealDetails;

  /// No description provided for @ingredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get ingredients;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @orderNow.
  ///
  /// In en, this message translates to:
  /// **'Order Now'**
  String get orderNow;

  /// No description provided for @yourCart.
  ///
  /// In en, this message translates to:
  /// **'Your Cart'**
  String get yourCart;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @addedToCart.
  ///
  /// In en, this message translates to:
  /// **'Meal added to cart'**
  String get addedToCart;

  /// No description provided for @thisMealIsAlreadyInYourCart.
  ///
  /// In en, this message translates to:
  /// **'This meal is already in your cart'**
  String get thisMealIsAlreadyInYourCart;

  /// No description provided for @yourCartEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get yourCartEmpty;

  /// No description provided for @aed.
  ///
  /// In en, this message translates to:
  /// **'AED'**
  String get aed;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
