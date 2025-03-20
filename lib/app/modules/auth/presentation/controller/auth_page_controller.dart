// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/core/common/constants/app_routes.dart';
import 'package:petfolio/app/core/common/utils/toasting.dart';
import 'package:petfolio/main.dart';

class AuthPageController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future login(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      Toasting.error(context, title: 'Preencha todos os campos!');
      return;
    }

    // var response = await Modular.get<Login>()(
    //   LoginParams(
    //     email: emailController.text,
    //     password: passwordController.text,
    //   ),
    // );

    // if (response.isFailure) {
    //   Toasting.error(
    //     context,
    //     title: response.getFailure?.title ?? 'Erro',
    //   );
    //   return;
    // }

    // var jwt = response.getSuccessOr(() => '').toString();
    await session.setUserJwt(
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6IjU1NDc5OTI0NTI5MTIiLCJuYW1lIjoiSm9obiBEb2UiLCJjcGYiOiIxMTUuNTU1LjU1NS0yMiIsInBob3RvIjoiaHR0cHM6Ly9jYXRhYXMuY29tL2NhdCJ9.KS0Yv5TwNiU7WvZN03kKctmryDzbKWNRq6rzI2Qm_GY',
    );
    await session.getSession();

    await Future.delayed(700.ms);

    Modular.to.pushNamed(AppRoutes.sync, arguments: true);
  }
}
