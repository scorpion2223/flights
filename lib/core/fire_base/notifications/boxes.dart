import 'package:hive/hive.dart';

import 'hiveObjects/message.dart';
import 'hiveObjects/myNotification.dart';
import 'hiveObjects/notifications.dart';

late final Box<MyNotification> boxNotification;

late final Box<NotificationHive> boxNotifications;

late final Box<MyMessage> boxMessage;