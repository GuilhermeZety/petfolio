// import 'dart:convert';
// import 'dart:io';

// import 'package:petfolio/app/core/common/services/path_service.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:http/http.dart' as http;

// class NotificationChannels {
//   final AndroidNotificationChannels android =
//       AndroidNotificationChannels();
//   final IosNotificationChannels ios =
//       IosNotificationChannels();
// }

// class AndroidNotificationChannels {
//   Future<AndroidNotificationDetails> notification(
//     AndroidNotification? notification,
//   ) async {
//     BigPictureStyleInformation? bigPicture;

//     if (notification != null &&
//         notification.imageUrl != null) {
//       var response = await http.get(
//         Uri.parse(notification.imageUrl!),
//       );
//       if (response.statusCode == 200) {
//         bigPicture = BigPictureStyleInformation(
//           ByteArrayAndroidBitmap.fromBase64String(
//             base64Encode(response.bodyBytes),
//           ),
//           largeIcon:
//               ByteArrayAndroidBitmap.fromBase64String(
//                 base64Encode(response.bodyBytes),
//               ),
//         );
//       }
//     }
//     return AndroidNotificationDetails(
//       'notifications_details',
//       'Notificacoes',
//       channelDescription: 'Este canal é para notificações',
//       importance: Importance.max,
//       priority: Priority.max,
//       enableVibration: true,
//       enableLights: true,
//       ledColor: Colors.yellow,
//       ledOffMs: 1000,
//       ledOnMs: 1000,
//       subText: 'notificação',
//       styleInformation: bigPicture,
//     );
//   }
// }

// class IosNotificationChannels {
//   Future<DarwinNotificationDetails> notification(
//     AppleNotification? notification,
//   ) async {
//     final path = await PathService.pathTemporary();

//     String? imagePath;

//     if (notification != null &&
//         notification.imageUrl != null) {
//       imagePath =
//           '$path/${notification.imageUrl!.split('/').last}';

//       var response = await http.get(
//         Uri.parse(notification.imageUrl!),
//       );
//       if (response.statusCode == 200) {
//         await File(
//           imagePath,
//         ).writeAsBytes(response.bodyBytes);
//       }
//     }

//     return DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//       subtitle: 'notificação',
//       sound: 'default',
//       attachments: [
//         if (imagePath != null)
//           DarwinNotificationAttachment(imagePath),
//       ],
//     );
//   }
// }
