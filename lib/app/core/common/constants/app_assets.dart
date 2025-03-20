// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';

class AppAssets {
  static AppImages images = AppImages();
  static final AppSvgs svgs = AppSvgs();
}

class AppImages {
  static const String _path = 'assets/images';
}

class AppSvgs {
  static const String _path = 'assets/svgs';
  AppSvgsIcons icons = AppSvgsIcons();
  //
  final String notFound = '$_path/not_found.svg';
  final String desenvolvidoGrey = '$_path/desenvolvido_grey.svg';
  final String desenvolvidoWhite = '$_path/desenvolvido_white.svg';
  String desenvolvidoByTheme(BuildContext context) => context.isDark ? desenvolvidoWhite : desenvolvidoGrey;
  //
  final String logoComplete = '$_path/logo_complete.svg';
  final String logoName = '$_path/logo_name.svg';
  final String logoIcon = '$_path/logo_icon.svg';
}

class AppSvgsIcons {
  static const String _path = 'assets/svgs/icons';

  final String eyeChecked = '$_path/tabler_eye-check.svg';
  final String checkupList = '$_path/tabler_checkup-list.svg';
}
