// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/core/common/constants/app_routes.dart';
import 'package:petfolio/app/core/common/utils/toasting.dart';
import 'package:petfolio/app/modules/auth/domain/usecases/login.dart';
import 'package:petfolio/main.dart';

class AuthPageController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future login(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      Toasting.error(
        context,
        title: 'Preencha todos os campos!',
        description: 'ou acesse com o google',
      );
      return;
    }

    var response = await Modular.get<Login>()(
      LoginParams(email: emailController.text, password: passwordController.text),
    );
    await response.fold(
      (failure) {
        Toasting.error(context, title: failure.title);
      },
      (success) async {
        Toasting.success(context, title: 'Login efetuado com sucesso!');
        await session.getSession();
        Modular.to.pushNamed(AppRoutes.splash, arguments: true);
      },
    );
  }
}
