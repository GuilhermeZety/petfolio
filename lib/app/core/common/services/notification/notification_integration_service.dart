// import 'dart:convert';

// import 'package:petfolio/app/core/common/services/notification/notification_channels.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationIntegrationService {
//   final FlutterLocalNotificationsPlugin
//   localNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   final NotificationChannels channels =
//       NotificationChannels();

//   Future<void> Function(NotificationResponse payload)
//   onSelectNotification;

//   NotificationIntegrationService({
//     required this.onSelectNotification,
//   }) {
//     _setupNotifications();
//   }

//   void _setupNotifications() async {
//     await _initializeNotifications();
//   }

//   Future<void> _initializeNotifications() async {
//     const android = AndroidInitializationSettings(
//       '@mipmap/launcher_icon',
//     );
//     const ios = DarwinInitializationSettings();
//     // Fazer: macOs, iOS, Linux...
//     await localNotificationsPlugin.initialize(
//       const InitializationSettings(
//         android: android,
//         iOS: ios,
//       ),
//       // onDidReceiveNotificationResponse: onSelectNotification,
//       // onDidReceiveBackgroundNotificationResponse: onSelectBackgroundNotification,
//     );
//   }

//   Future<void> showLocalNotification(
//     RemoteMessage message,
//   ) async {
//     final notification = message.notification;

//     final AndroidNotificationDetails androidDetails =
//         await channels.android.notification(
//           notification?.android,
//         );
//     final DarwinNotificationDetails iosDetails =
//         await channels.ios.notification(
//           notification?.apple,
//         );

//     await localNotificationsPlugin.show(
//       notification.hashCode,
//       notification!.title!,
//       notification.body,
//       NotificationDetails(
//         android: androidDetails,
//         iOS: iosDetails,
//       ),
//       payload: jsonEncode(message.data),
//     );
//   }

//   Future<void> checkForNotifications() async {
//     final details =
//         await localNotificationsPlugin
//             .getNotificationAppLaunchDetails();
//     var initialMessage =
//         await FirebaseMessaging.instance
//             .getInitialMessage();
//     if (details != null &&
//         details.didNotificationLaunchApp &&
//         details.notificationResponse != null) {
//       await onSelectNotification(
//         details.notificationResponse!,
//       );
//     } else if (initialMessage != null) {
//       await onSelectNotification(
//         NotificationResponse(
//           payload: jsonEncode(initialMessage.data),
//           notificationResponseType:
//               NotificationResponseType.selectedNotification,
//         ),
//       );
//     }
//   }
// }
