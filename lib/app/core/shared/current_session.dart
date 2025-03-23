// ignore_for_file: use_build_context_synchronously

import 'package:petfolio/app/core/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentSession {
  late SharedPreferences prefs;

  UserModel? user;
  double fontSize = 1.25;
  bool forceResync = false;

  Future getSession() async {
    var userMap = prefs.getString('user');
    if (userMap == null) {
      return;
    }
    user = UserModel.fromJson(userMap);
  }

  bool isLogged() => prefs.getString('user') != null;

  Future logout() async {
    await prefs.remove('user');
    user = null;
  }

  Future initialize() async {
    prefs = await SharedPreferences.getInstance();
    fontSize = prefs.getDouble('fontSize') ?? 1;
    await getSession();
  }

  Future setFontSize(double value) => prefs
      .setDouble('fontSize', value)
      .then((value) => fontSize = prefs.getDouble('fontSize') ?? 1.25);
}
