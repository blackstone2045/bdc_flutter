import 'package:geeya_travel_management/features/nav_bar/presentation/screens/nav_bar_screen.dart';
import 'package:geeya_travel_management/features/profile/edit_profile/presentation/screens/edit_profile_screen.dart';
import 'package:get/get.dart';

import '../features/authentication/splash/presentation/screens/splash_screen.dart';
import '../features/authentication/login/presentation/screens/login_screen.dart';
import '../features/authentication/signup/presentation/screens/signup_screen.dart';
import '../features/authentication/forgot_password/presentation/screens/forgot_password_screen.dart';
import '../features/authentication/verification/presentation/screens/verification_screen.dart';
import '../features/authentication/reset_password/presentation/screens/reset_password_screen.dart';
import '../features/authentication/password_updated/presentation/screens/password_updated_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/profile/language/presentation/screens/language_screen.dart';
import '../features/subscription/presentation/screens/paywall_screen.dart';
import '../features/subscription/presentation/screens/membership_screen.dart';
import '../features/profile/profile_home/presentation/screens/profile_home_screen.dart';
import '../features/welcome/presentation/screens/account_create_welcome_message_screen.dart';
import '../features/guide_details/presentation/screens/guide_details_screen.dart';

class AppRoute {
  static String init = "/";
  static String splash = "/splash";
  static String login = "/login";
  static String signup = "/signup";
  static String forgotPassword = "/forgotPassword";
  static String verification = "/verification";
  static String resetPassword = "/resetPassword";
  static String passwordUpdated = "/passwordUpdated";
  static String paywall = "/paywall";
  static String membership = "/membership";
  static String navBar = "/navBar";
  static String profile = "/profile";
  static String editProfile = "/editProfile";
  static String languageScreen = "/languageScreen";
  static String savedPlaces = "/savedPlaces";
  static String accountCreateWelcomeMessageScreen = "/accountCreateWelcomeMessageScreen";
  static String homeScreen = "/homeScreen";
  static String guideDetails = "/guideDetails";

  static List<GetPage> routes = [
    GetPage(
      name: init,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: navBar,
      page: () => const NavBarScreen(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: signup,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: verification,
      page: () => const VerificationScreen(),
    ),
    GetPage(
      name: resetPassword,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: passwordUpdated,
      page: () => const PasswordUpdatedScreen(),
    ),
    GetPage(
      name: paywall,
      page: () => const PaywallScreen(),
    ),
    GetPage(
      name: membership,
      page: () => const MembershipScreen(),
    ),
    GetPage(
      name: profile,
      page: () => const ProfileHomeScreen(),
    ),
    GetPage(
      name: accountCreateWelcomeMessageScreen,
      page: () => const AccountCreateWelcomeMessageScreen(),
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: guideDetails,
      page: () => const GuideDetailsScreen(),
    ),
    GetPage(
      name: editProfile,
      page: () => const EditProfileScreen(),
    ),
    GetPage(
      name: languageScreen,
      page: () => const LanguageScreen(),
    ),
  ];
}
