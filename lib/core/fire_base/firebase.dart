import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../main.dart';
import 'notifications/notificationDetailes.dart';

class FireBase {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> showNotification(message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'high_importance_channel', 'High Importance Notifications',
            channelDescription:
                'This channel is used for important notification',
            icon: '@drawable/logo', // استخدم اسم الأيقونة هنا
            importance: Importance.defaultImportance);

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, '${message.tilte}', '${message.body}', platformChannelSpecifics);
  }

//   after download firebase local notification
  final androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notifications',
      description: 'This channel is used for important notification',
      importance: Importance.defaultImportance);
  final localNotifications = FlutterLocalNotificationsPlugin();

  void initAndroidChannel(message) {
    final localNotifications = FlutterLocalNotificationsPlugin();
    final notification = message.notification;
    if (notification == null) return;
    localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
            androidChannel.id, androidChannel.name,
            channelDescription: androidChannel.description,
            icon: '@drawable/logo'),
      ),
      payload: jsonEncode(message.toMap()),
    );
  }

  getPermissionToMyApp() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    //this is for apple and web without android
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      //notification
      announcement: false,
      //contant notification
      badge: true,
      //counter to unreded measseages
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future<String?> getAccessToken() async {
  

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);
      //get access token
      auth.AccessCredentials credentials =
          await auth.obtainAccessCredentialsViaServiceAccount(
              auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
              scopes,
              client);

      client.close();
      print(
          "Access Token: ${credentials.accessToken.data}"); // Print Access Token
      return credentials.accessToken.data;
    } catch (e) {
      print("Error getting access token: $e");
      return null;
    }
  }

  firebaseMessagingForegroundHandler() {
    //رح تضل مفتوحة هي الفانكشن
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      if (notification == null) return;
      initAndroidChannel(message);
      final data = message.data;
      if (data != null &&
          data is Map<String, dynamic> &&
          data.containsKey('data')) {
        String dataList = data['data'];
        print("dataList ${dataList}");
        var dataList1 = jsonDecode(dataList);
        print("dataList Decode ${dataList}");
        print("dataList Decode 1 ${dataList1[0]}");

        String description = data['description'];
        print("description ${description}");
        String id = data['id'];
        print("id ${id}");
        String type = data['type'];
        print("type ${type}");
      }
    });
  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;
    // هنا يمكنك تنفيذ الإجراءات الخاصة بك عندما يكون التطبيق مُغلقًا أو في الخلفية
    if (notification == null) return;
    localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
            androidChannel.id, androidChannel.name,
            channelDescription: androidChannel.description,
            icon: '@drawable/logo'),
      ),
      payload: jsonEncode(message.toMap()),
    );
  }

  // backgroundInteraction() {
  //   // Also handle any interaction when the app is in the background via a Stream listener
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     if (message.notification != null) {
  //       print(
  //           "------------------------------------------------------------interaction ");
  //       navigatorKey.currentState!
  //           .pushNamed(NotificationDetailes.route, arguments: message);
  //       print("message.notification   ${message.notification}");
  //       // print("message.data   ${message.data}");
  //       print("message.notification.title   ${message.notification!.title}");
  //       print("message.notification.body   ${message.notification!.body}");
  //     }
  //   });
  // }

  //
  // terminatedInteraction() async {
  //   // Get any messages which caused the application to open from a terminated state.
  //   RemoteMessage? initialMessage =
  //       await FirebaseMessaging.instance.getInitialMessage();
  //
  //   // If the message also contains a data property  navigate to a screen
  //   if (initialMessage != null) {
  //     print(
  //         "---------------------------------------------------------terminated interaction ");
  //     navigatorKey.currentState!
  //         .pushNamed(NotificationDetailes.route, arguments: initialMessage);
  //   }
  // }

  // void handlmessage(RemoteMessage? message) {
  //   if (message == null) return;
  //   navigatorKey.currentState!
  //       .pushNamed(NotificationDetailes.route, arguments: message);
  // }

  // Future initLocalNotification() async {
  //   const ios = IOSInitializationSettings();
  //   const android = AndroidInitializationSettings('@drawable/logo');
  //   const settings = InitializationSettings(android: android, iOS: ios);
  //
  //   await localNotifications.initialize(settings,
  //       onSelectNotification: (payload) {
  //     final message = RemoteMessage.fromMap(jsonDecode(payload!));
  //     handlmessage(message);
  //   });
  //   final platform = localNotifications.resolvePlatformSpecificImplementation<
  //       AndroidFlutterLocalNotificationsPlugin>();
  //   await platform?.createNotificationChannel(androidChannel);
  // }
  //
  // Future initPushNotifications() async {
  //   print("initPushNotifications*********");
  //   await FirebaseMessaging.instance
  //       .setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );
  //   firebaseMessagingForegroundHandler();
  //   terminatedInteraction(); //termenated
  //   backgroundInteraction();
  // }
  //
  // Future<void> initNotifications() async {
  //   await FirebaseMessaging.instance.requestPermission();
  //   final fcMToken = await FirebaseMessaging.instance.getToken();
  //   print('Token:${fcMToken}');
  //   initPushNotifications();
  //   initLocalNotification();
  //   // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // }
}
