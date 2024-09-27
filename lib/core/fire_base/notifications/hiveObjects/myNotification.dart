import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// part 'myNotification.g.dart';

@HiveType(typeId: 0)
class MyNotification extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  bool isRead;

  MyNotification(this.title, this.content, this.isRead);


  String get getTitle => title;

  String get getContent => content;

  bool get getIsRead => isRead;

  set setIsRead(bool value) => isRead = value;
}

// Assuming you have the Notification class and necessary setup in place

void addNotificationToBox(String title, String content, bool isRead) async {
  // Get the Hive box where notifications are stored
  print("Add Notification");
  Box<MyNotification> notificationBox = Hive.box<MyNotification>('notifications');

  // Create a new notification object
  MyNotification newNotification = MyNotification(title, content, isRead);

  // Add the new notification to the box
  await notificationBox.add(newNotification);
}

class NotificationAdapter extends TypeAdapter<MyNotification> {
  @override
  final typeId = 0;

  @override
  MyNotification read(BinaryReader reader) {
    return MyNotification(
      reader.readString(),
      reader.readString(),
      reader.readBool(),
    );

  }

  @override
  void write(BinaryWriter writer, MyNotification obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.content);
    writer.writeBool(obj.isRead);
  }
}


void removeNotificationFromBox(int index) async {
  // Get the Hive box where notifications are stored
  Box<MyNotification> notificationBox = Hive.box<MyNotification>('notifications');

  // Check if the index is valid
  if (index >= 0 && index < notificationBox.length) {
    // Delete the notification at the specified index
    await notificationBox.deleteAt(index);
    print('Notification at index $index removed successfully.');
  } else {
    print('Invalid index provided. No notification removed.');
  }
}

void removeAllNotificationsFromBox() async {
  // Get the Hive box where notifications are stored
  Box<MyNotification> notificationBox = Hive.box<MyNotification>('notifications');

  // Loop through all items in the box and delete them
  for (int i = 0; i < notificationBox.length; i++) {
    await notificationBox.deleteAt(i);
  }
  print('All notifications removed successfully.');
}
