import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir/core/components/custom_button.dart';
import 'package:tafsir/core/components/custom_text.dart';
import 'package:tafsir/core/components/custom_text_form_field.dart';
import 'package:tafsir/core/configurator/colors.dart';
import 'package:tafsir/core/constants/constants.dart';
import 'package:tafsir/core/style/dimensions.dart';
import 'package:tafsir/core/style/icon_broken.dart';

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: padding(context),
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
                        CustomText(
                          alignment: Alignment.topLeft,
                          text: 'Регистрация',
                          fontSize: 28.0,
                          color: Colors.black,
                        ),
                        hSizedBox3,
                        CustomTextFormField(
                          hint: 'Абдукаххор',
                          text: 'Имя',
                          onSaved: (value) {},
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Введите свое имя';
                            }
                            return null;
                          },
                          type: TextInputType.name,
                          controller: name,
                        ),
                        hSizedBox3,
                        CustomTextFormField(
                          hint: 'учфьзду@gmail.com',
                          text: 'E-mail',
                          onSaved: (value) {},
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Введите email';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                          controller: email,
                        ),
                        hSizedBox3,
                        CustomTextFormField(
                          hint: '**********',
                          text: 'Password',
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
                          text: 'Создать аккаунт',
                          height: 50.0,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // controller.createUserWithEmailAndPassword();
                            }
                          },
                        ),
                        hSizedBox2,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Уже есть аккаунт? ',
                              fontSize: 16,
                              alignment: Alignment.topRight,
                            ),
                            InkWell(
                              onTap: () => Get.toNamed('/login'),
                              child: CustomText(
                                text: 'Войти',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
