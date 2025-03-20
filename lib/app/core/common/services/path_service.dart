import 'dart:io';

import 'package:path_provider/path_provider.dart' as path_;
import 'package:path_provider_foundation/path_provider_foundation.dart'
    as path_ios;

class PathService {
  static Future<String?> pathDocuments() async {
    if (Platform.isAndroid) {
      return (await path_.getApplicationDocumentsDirectory()).path;
    } else if (Platform.isIOS) {
      return await path_ios.PathProviderFoundation()
          .getApplicationDocumentsPath();
    }

    return null;
  }

  static Future<String?> pathTemporary() async {
    if (Platform.isAndroid) {
      return (await path_.getTemporaryDirectory()).path;
    } else if (Platform.isIOS) {
      return await path_ios.PathProviderFoundation().getTemporaryPath();
    }

    return null;
  }

  static Future<String?> pathDownloads() async {
    if (Platform.isAndroid) {
      return (await path_.getDownloadsDirectory())?.path;
    } else if (Platform.isIOS) {
      return await path_ios.PathProviderFoundation().getDownloadsPath();
    }

    return null;
  }

  static Future<String?> pathCache() async {
    if (Platform.isAndroid) {
      return (await path_.getApplicationCacheDirectory()).path;
    } else if (Platform.isIOS) {
      return await path_ios.PathProviderFoundation().getApplicationCachePath();
    }

    return null;
  }
}
