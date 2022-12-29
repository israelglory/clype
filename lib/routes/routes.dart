import 'package:clype/exports.dart';
import 'package:clype/screens/auth_screen/login/login_view.dart';
import 'package:clype/screens/auth_screen/sign_up/register_view.dart';
import 'package:clype/screens/profile/view_profile_view.dart';
import 'package:get/get.dart';

class RoutesClass {
  // Onboarding Routes
  static const String splashScreen = '/splash/onboarding';
  // Intro Routes
  static const String intro = '/intro';
  // URLS
  // Authentication Routes
  static const String registerAccount = '/auth/register';
  static const String loginAccount = '/auth/login';

  //features
  static const String viewProfile = '/feature/viewProfile';

  // GETTERS
  // Authentication Routes
  static String getRegisterRoute() => registerAccount;
  static String getLoginRoute() => loginAccount;

  //Splash Screen
  static String getSplashScreenRoute() => splashScreen;
  //Intro Screen
  static String getIntroScreenRoute() => intro;

  ///Feature
  static String getViewProfileRoute() => viewProfile;

  // ROUTING FUNCTION
  static List<GetPage> routes = [
    // AUTHENTICATION ROUTES
    GetPage(
      name: getRegisterRoute(),
      page: () => const RegisterScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getLoginRoute(),
      page: () => const LoginScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getViewProfileRoute(),
      page: () => const ViewProvileView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
  ];
}
