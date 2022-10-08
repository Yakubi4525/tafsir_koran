import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir/core/components/custom_button.dart';
import 'package:tafsir/core/components/custom_button_social.dart';
import 'package:tafsir/core/components/custom_text.dart';
import 'package:tafsir/core/components/custom_text_form_field.dart';
import 'package:tafsir/core/configurator/colors.dart';
import 'package:tafsir/core/style/dimensions.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Ассаламу алайкум',
                              fontSize: 28.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        hSizedBox1,
                        CustomText(
                          text: 'Авторизуйтесь, чтобы продолжить',
                          fontSize: 16,
                          color: Colors.grey,
                          alignment: Alignment.topLeft,
                        ),
                        hSizedBox3,
                        CustomTextFormField(
                          hint: 'example@gmail.com',
                          text: 'E-mail',
                          onSaved: (value) {},
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Введите e-mail';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                          controller: email,
                        ),
                        hSizedBox2,
                        CustomTextFormField(
                          hint: '**********',
                          text: 'Пароль',
                          onSaved: (value) {},
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Введите пароль';
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                          controller: password,
                        ),
                        hSizedBox3,
                        CustomButton(
                          text: 'Войти',
                          height: 50.0,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // controller.sinInWithEmailAndPassword();
                            }
                          },
                        ),
                        hSizedBox2,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Нет аккаунта? ',
                              fontSize: 16,
                              alignment: Alignment.topRight,
                            ),
                            InkWell(
                              onTap: () => Get.toNamed('/register'),
                              child: CustomText(
                                text: 'Создать',
                                fontSize: 16.0,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                hSizedBox2,
                CustomText(
                  text: '-Или-',
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                hSizedBox2,
                ButtonSocial(
                  onPressed: () {
                    // controller.googleSignIn();
                  },
                  text: 'Войти с Google почтой',
                  textImage: 'assets/images/google.png',
                ),
                hSizedBox2,
                ButtonSocial(
                  onPressed: () {
                    // controller.facebookLogin();
                  },
                  text: 'Войти с  Facebook аккаунтом',
                  textImage: 'assets/images/facebook.png',
                ),
                hSizedBox2,
                InkWell(
                  onTap: () => Get.toNamed('/main'),
                  child: CustomText(
                    text: 'Пропустить этот шаг',
                    fontSize: 16.0,
                    color: Colors.black,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
