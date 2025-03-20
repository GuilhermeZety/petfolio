// import 'dart:developer';
// import 'dart:io';

// import 'package:petfolio/app/core/common/services/notification/messaging_service.dart';
// import 'package:petfolio/app/core/common/services/notification/notification_integration_service.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   Future<String?> get notificationToken {
//     return FirebaseMessaging.instance.getToken();
//   }

//   Future<void> initialize({
//     Future<void> Function(NotificationResponse response)?
//     onSelectNotification,
//   }) async {
//     log(
//       'Inicializando serviço [NotificationService]',
//       name: 'Services',
//     );

//     if (Platform.isIOS) {
//       var resp =
//           await FirebaseMessaging.instance.getAPNSToken();
//       log('apns token: $resp', name: 'NotificationService');
//     }

//     await FirebaseMessagingService(
//       NotificationIntegrationService(
//         onSelectNotification:
//             onSelectNotification ??
//             (_) async {
//               return;
//             },
//       ),
//     ).initialize();

//     log(
//       'hash ${await FirebaseMessaging.instance.getToken()}',
//       name: 'Services',
//     );
//   }
// }
