import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatelessWidget {
  final pages = [
    PageModel(
        color: Colors.grey[700],
        imageAssetPath: 'assets/images/grad_logo.png',
        title: "Тафсири Куръон",
        body:
            "\"Поистине, Мы ниспослали Наставление (Коран). Мы, без сомнения, сохраним его (от искажений и изменений).\"\n Сура Аль-Хиджр, 9",
        doAnimateImage: true),
    PageModel(
        color: const Color(0xff664d7b),
        imageAssetPath: 'assets/images/page.png',
        title: "Eжедневные зикры",
        body:
            "Читайте утренные и веченые азкары в удобном виде в самом приложении",
        doAnimateImage: true),
    PageModel(
        color: const Color(0xff04364f),
        imageAssetPath: 'assets/images/page.png',
        title: "Время молитвы",
        body:
            "\"Поистине, молитва предписана для верующих в определенное время\"\n Сура ан-Ниса 4: 103",
        doAnimateImage: true),
    PageModel(
        color: const Color(0xff106791),
        imageAssetPath: 'assets/images/page.png',
        title: "Необычный и красивый дизайн",
        body:
            "Мы упорно трудились, чтобы выбрать красивые цвета, анимацию и в целом привлекательный дизайн для этой прекрасной книги",
        doAnimateImage: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        skipText: 'Пропустить',
        finishText: 'Войти',
        nextText: 'Продолжить',
        pages: pages,
        showBullets: true,
        skipCallback: () {
          Get.toNamed('/login');
        },
        finishCallback: () {
          Get.toNamed('/login');
        },
      ),
    );
  }
}
