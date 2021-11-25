import 'package:get/get.dart';
import 'package:tafsir/features/auth/presentation/pages/login_page.dart';
import 'package:tafsir/features/auth/presentation/pages/onboarding_page.dart';
import 'package:tafsir/features/auth/presentation/pages/register_page.dart';
import 'package:tafsir/features/pray_time/presentation/pages/pray_time_page.dart';
import 'package:tafsir/features/tafsir/presentation/pages/detail_surah.dart';
import 'package:tafsir/features/tafsir/presentation/pages/tafsir_page.dart';
import 'package:tafsir/features/zikr/presentation/pages/zikr_page.dart';
import 'package:tafsir/main_screen.dart';

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
        GetPage(
          name: '/zikr',
          page: () => ZikrPage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: '/pray',
          page: () => PrayTimePage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: '/main',
          page: () => MainPage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: '/detail-surah',
          page: () => DetailSurah(),
          transition: Transition.cupertino,
        ),
      ];
  }
}