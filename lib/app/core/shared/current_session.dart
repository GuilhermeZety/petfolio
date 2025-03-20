// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:petfolio/app/core/common/constants/app_routes.dart';
import 'package:petfolio/app/core/common/utils/toasting.dart';
import 'package:petfolio/app/core/shared/features/user/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentSession {
  late SharedPreferences prefs;

  String? userJwt;
  UserModel? user;
  double fontSize = 1.25;
  bool forceResync = false;

  Future getSession() async {
    userJwt = prefs.getString('userJwt');
    log('getSession-userJwt: $userJwt');
    if (userJwt == null) {
      return;
    }
    user =
        prefs.getString('userJwt') != null
            ? UserModel.fromMap(JwtDecoder.decode(prefs.getString('userJwt')!))
            : null;

    // if (!await Modular.get<ConnectionService>()
    //     .isConnected) {
    //   user =
    //       prefs.getString('user') != null
    //           ? UserModel.fromJson(prefs.getString('user')!)
    //           : null;
    //   return;
    // }
    // var response = await Modular.get<GetUserInfo>()(
    //   NoParams(),
    // );

    // await response.fold(
    //   (l) {
    //     if (l is TokenExpiredFailure) {
    //       tokenExpired();
    //       return;
    //     }
    //   },
    //   (r) async {
    //     user = r;
    //     await prefs.setString(
    //       'user',
    //       r.toJson(addPhoneArea: false),
    //     );
    //   },
    // );
  }

  Future setUserJwt(String jwt) => prefs
      .setString('userJwt', jwt)
      .then((value) => userJwt = prefs.getString('userJwt'));

  Future logout() async {
    await prefs.remove('userJwt');
    userJwt = null;
    user = null;
  }

  bool isLogged() => prefs.getString('userJwt') != null;

  Future initialize() async {
    prefs = await SharedPreferences.getInstance();
    userJwt = prefs.getString('userJwt');
    fontSize = prefs.getDouble('fontSize') ?? 1.25;
  }

  Future setFontSize(double value) => prefs
      .setDouble('fontSize', value)
      .then((value) => fontSize = prefs.getDouble('fontSize') ?? 1.25);

  Future tokenExpired({BuildContext? context}) async {
    [prefs.remove('userJwt'), prefs.remove('user_machines')];
    userJwt = null;
    user = null;
    if (context != null) {
      Toasting.error(
        context,
        title: 'Sessão expirada',
        description: 'Sua sessão expirou, por favor, faça login novamente.',
      );
    }
    Modular.to.pushNamedAndRemoveUntil(AppRoutes.splash, (route) => false);
  }

  bool get passApresentation => prefs.getBool('passApresentation') ?? false;
  Future setPassApresentation(bool value) =>
      prefs.setBool('passApresentation', value);
}
