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
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "aqarservice-8de54",
      "private_key_id": "5a54e755abda63f375c1d782fb5977b17fa00601",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCiDjd9efkrvi4A\nIpOqYQh9GJyP1T0twFAckyz5Hf/BvEUIsVl9koWC5xW5POfJiLDXLMxPbUp6UtVy\nd/oafzBNxvJQO0spVcRWh/Z4oN+cHaYNhkZSmEbIFNEE0AEMLxpSYHeyc10bR7SC\nuq5v9Nhm+aMUTBvNFeYNDP0QIDKbjIP1gsptqn5ltk6qMu9oYEhC4hnlS6xiEdUk\nfsKWpQxhGwoI+rDX6mC+TYc8Wxq+shZNgra703gcAocAtPiLarehdCBS2Hw7x6uF\niozTUz3PYE0T4c+wTGThHbrXi1f3pyGkR/+yxFj60nQ5N7Llt1GZ6SlOwTjCrWSh\n5ymAC6DfAgMBAAECggEAI4WlQTJi3WVHFQ1/O8ogP7eM3fRagDRW+ySBp6udO7zG\njxS87osXC+4Wc2+3yRPW25u8vy5QNIcCtaA56OP3VR0mUVLl804TBvqvmpp82W4g\nT3ee44zwevwhIwJrMF4E0YjGxA2Im6m4li1Qfkb3xn6y8giK0YYa0sKFmCrOnQyz\nH0W7sBJnsr3zN1p23uTjLL6IZcJX0Y3k1j/LjgYU3X6vAkSZHbCo8+Eou5DMB5aZ\ncT2m/HiQzYhiiU3OnqKWSkpWyyj28XqYs9cLSf+QY8JcDgUZDftc/w+YWcThsl6Y\nQECcVrtg5rHxH+uqZ2xBlOPLeTNTWHj/Zm0bDKVe5QKBgQDVKQmzqoYB5INRjfqv\nEPEjQvOxI7S3TtS+XZ3eaUGDUILJPRpW9wFPEU4cApYeau/QAYPtKDQXPVL7vvDa\neBHkU4uxUuTHGsZrOqswmHa5kplqErCtWBuCa6ypa1wuVW2PE1UoAg9pjM7GF3i0\nNaaND+FpKKuAoORWRohRrW96iwKBgQDCn9712fExt+xXFtyIxn7jP64p86ASNFz0\nM927TyyLHOGOvC78afi/nuZVpBzUeUcQNKYU+1Y4cT8xjd8HGyPGcvRTx3BMKtdQ\n+4N3egdXVT1ujM2/gHd4zXJKU2aVvLNviKxnzqZ0Kgp9p1dKsMQ81WwHYJWJKSp0\nxcR7iO7BfQKBgQCF7c/rs/OY0tPzdOqR/moUBqgIn2+XUQ94QGfFa4q/D+HswNiA\n1Zdb73qNPM7Hc9cTcTBL3NvF0kEGbbT0/0X2mMuHcZbOxrLugqE22kSWWlbL/8xE\nTbyTGEYW+J6legVpRPNXPNwkLFVqvyqWx7LKpLSzFtuS6QQudQiHkRoe+wKBgFuM\nsGideGOWzMm6q0p7dLyY++gn/agSkZcdvrOZbq6Ri1iFFOUPRD9/E4I9jII1+kOZ\nQHamM8yhGMTKo5rIHXAAKwYtzplFnbsuVI0jDcj7A8a43R+z4n8kxRpJWPweo5lX\nhSHfh1UlYYHx8ZHkzKqBCiv+NtkqUBpV3TLvGsBRAoGALdQ+jyc0Y1pBirmiS0Oo\nOwPRw4fkncpil0z/+VWhJzunQ945rwouh1ux4j5x9xPUdedkfFjca6LhuBrzh//N\n8LhqtU9CtWOkkVSLFe7ltIl0Q6bMQBSLVjOgG5sPBb5wiGa8QGL53rgDqFIg6mfC\njlaJuKjAptUi8s0iEzXjtsk=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-sae4c@aqarservice-8de54.iam.gserviceaccount.com",
      "client_id": "111736256342923147101",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-sae4c%40aqarservice-8de54.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

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
