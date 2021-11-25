import 'package:get/get.dart';
import 'package:tafsir/features/auth/presentation/pages/login_page.dart';
import 'package:tafsir/features/auth/presentation/pages/onboarding_page.dart';
import 'package:tafsir/features/auth/presentation/pages/register_page.dart';
import 'package:tafsir/features/tafsir/presentation/pages/tafsir_page.dart';

class AppRoutesGet {
  static List<GetPage> getListPages(){
    return [
        GetPage(
          name: '/register',
          page: () => RegisterPage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: '/onboarding',
          page: () => OnboardingPage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: '/tafsir',
          page: () => TafsirPage(),
          transition: Transition.cupertino,
        ),
      ];
  }
}