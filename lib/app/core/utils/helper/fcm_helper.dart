// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:lams/app/core/state/global_state.dart';
// import 'package:lams/app/modules/chat/chat_controller.dart';
// import 'package:lams/app/modules/main_nav/group/group_controller.dart';
// import 'package:lams/app/routes/app_pages.dart';
// import 'package:soft_builder/constraints/my_constraints.dart';
//
// import '../../../data/model/app_helper_model/notification_message_data_model.dart';
// import '../../../modules/main_nav/message/message_controller.dart';
// import '../../constants/app_colors.dart';
//
// late AndroidNotificationChannel channel;
// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
// class FCMHelper {
//   initLocalNotification() async {
//     if (!kIsWeb) {
//       channel = const AndroidNotificationChannel(
//         'LAMS',
//         'LAMS',
//         description: 'This channel is used for App related notifications.',
//         importance: Importance.max,
//         enableLights: true,
//         enableVibration: true,
//       );
//
//       flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);
//
//       await FirebaseMessaging.instance
//           .setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//     }
//   }
//
//   localNotificationListener() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       logger.d('main localNotificationListener:  ${message.notification}');
//       logger.d(
//           'localNotificationListener title:  ${message.notification?.title}');
//       logger
//           .d('localNotificationListener body:  ${message.notification?.body}');
//       logger.d('localNotificationListener data:  ${message.data}');
//
//       NotificationMessageDataModel? notificationData;
//
//       try {
//         notificationData = notificationMessageDataModelFromJson(
//             (message.data["body"].toString()));
//         logger.i("response: ${notificationData.toJson()}");
//         logger.i("conversationId: ${notificationData.conversationId}");
//         logger.i("conversationType: ${notificationData.conversationType}");
//         logger.i("message: ${notificationData.message}");
//
//         if (notificationData.conversationType.toString() == 1.toString()) {
//           Get.find<GroupController>()
//               .handleNewMessageFromNotification(notificationData);
//         } else if (notificationData.conversationType.toString() ==
//             2.toString()) {
//           Get.find<MessageController>()
//               .handleNewMessageFromNotification(notificationData);
//         }
//
//         // if (Get.currentRoute == Routes.CHAT) {
//         if (Get.isRegistered<ChatController>()) {
//           logger.i("asdf");
//           Get.find<ChatController>().chatRefresh(notificationData);
//         }
//       } catch (e) {
//         logger.i("error: $e");
//       }
//
//       if ((notificationData?.conversationType.toString() == 1.toString() &&
//           notificationData?.senderUserId ==
//               Get.find<GlobalState>().userDetails.value.id)) {
//         // note - no task need to be done.
//       } else if ((Get.currentRoute == Routes.CHAT &&
//           Get.isRegistered<ChatController>())) {
//         if (!(Get.find<ChatController>().convId.value ==
//             (notificationData?.conversationId ?? 0).toInt())) {
//           showNotification(
//             message,
//             notificationData ?? NotificationMessageDataModel(),
//           );
//         }
//       } else {
//         showNotification(
//           message,
//           notificationData ?? NotificationMessageDataModel(),
//         );
//       }
//     });
//   }
//
//   showNotification(
//       RemoteMessage message, NotificationMessageDataModel notificationData) {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//     logger.e("notification.hashCode : ${notification.hashCode}");
//     if (notification != null && android != null && !kIsWeb) {
//       flutterLocalNotificationsPlugin.show(
//         (notificationData.conversationId ?? notification.hashCode).toInt(),
//         // notification.title,
//         notificationData.title ?? "",
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//             channelDescription: channel.description,
//             icon: 'launcher_icon',
//             color: AppColor.white,
//             importance: Importance.max,
//             priority: Priority.high,
//             ongoing: true,
//             autoCancel: true,
//             styleInformation: const BigTextStyleInformation(''),
//           ),
//         ),
//       );
//     }
//   }
//
//   handleBgMessageOnTap() {
//     /*// logger.i("Get.routeInformationParser: ${Get.previousRoute}");
//     // HomeBinding().dependencies();
//     var notificationData = NotificationMessageDataModel(
//         title: "asdf",
//         conversationId: 50,
//         conversationType: 2,
//         message: "asdfasdfasdf",
//         senderName: "asdfasdf",
//         senderUserId: 2);
//     // Get.offNamed(Routes.HOME);
//     Get.toNamed(
//       Routes.CHAT,
//       arguments: {
//         "notification_data": notificationData,
//         "type": notificationData.conversationType ?? 0,
//       },
//     );*/
//
//     logger.i("1234567```");
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) {
//       if (message != null) {
//         _handleMessage(message);
//       }
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
//   }
//
//   void _handleMessage(RemoteMessage message) {
//     logger.i("_handleMessage");
//     var notificationData =
//         notificationMessageDataModelFromJson((message.data["body"].toString()));
//     // Get.offNamed(Routes.HOME);
//     Get.toNamed(
//       Routes.CHAT,
//       arguments: {
//         "notification_data": notificationData,
//         "type": notificationData.conversationType ?? 0,
//       },
//     );
//   }
//
//   void removeNotification(int notificationId) async {
//     await flutterLocalNotificationsPlugin.cancel(notificationId);
//   }
// }
