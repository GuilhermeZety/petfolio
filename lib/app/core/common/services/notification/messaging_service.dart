// import 'dart:developer';

// import 'package:petfolio/app/core/common/services/notification/notification_integration_service.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class FirebaseMessagingService {
//   final NotificationIntegrationService _notificationService;

//   FirebaseMessagingService(this._notificationService);

//   Future initialize() async {
//     await FirebaseMessaging.instance.requestPermission();
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//           badge: true,
//           sound: true,
//           alert: true,
//         );
//     _onMessage();
//     log(
//       (await FirebaseMessaging.instance.getToken()) ??
//           'SEM TOKEN',
//       name: 'NotificationService',
//     );
//     // FirebaseMessaging.onBackgroundMessage(saveBackgroundMessage);
//   }

//   void _onMessage() => FirebaseMessaging.onMessage.listen(
//     _notificationService.showLocalNotification,
//   );
// }

// // @pragma('vm:entry-point')
// // Future<void> saveBackgroundMessage(RemoteMessage message) async {
// //   var jsonOptions = (await SharedPreferences.getInstance()).getString('firebase_options');
// //   if (jsonOptions == null) return;
// //   Map<String, dynamic> options = json.decode(jsonOptions);
// //   await Firebase.initializeApp(
// //     name: 'BackgroundMessageService',
// //     options: FirebaseOptions(
// //       apiKey: options['apiKey'],
// //       appId: options['appId'],
// //       messagingSenderId: options['messagingSenderId'],
// //       projectId: options['projectId'],
// //       authDomain: options['authDomain'],
// //       databaseURL: options['databaseURL'],
// //       storageBucket: options['storageBucket'],
// //       measurementId: options['measurementId'],
// //       trackingId: options['trackingId'],
// //       deepLinkURLScheme: options['deepLinkURLScheme'],
// //       androidClientId: options['androidClientId'],
// //       iosClientId: options['iosClientId'],
// //       iosBundleId: options['iosBundleId'],
// //       appGroupId: options['appGroupId'],
// //     ),
// //   );
// // }
