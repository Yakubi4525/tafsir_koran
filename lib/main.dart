import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tafsir/core/datasources/location.dart';
import 'package:tafsir/core/routes/page_routes.dart';
import 'package:tafsir/core/theme/app_theme.dart';
import 'package:tafsir/features/auth/presentation/pages/onboarding_page.dart';

import 'core/datasources/cache_helper.dart';
import 'core/routes/binding.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await CacheHelper.init();
  Location().getCurrentLocation();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      title: 'Simple Quran Apps',
      debugShowCheckedModeBanner: false,
      getPages: AppRoutesGet.getListPages(),
      theme: AppTheme.getLightTheme(),
      home: OnboardingPage(),
    );
  }
}