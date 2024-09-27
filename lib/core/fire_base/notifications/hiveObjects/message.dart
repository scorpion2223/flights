import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

// part 'message.g.dart';

@HiveType(typeId: 2)
class MyMessage extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  bool isRead;

  @HiveField(3)
  Data? data;

  MyMessage({
    required this.title,
    required this.content,
    required this.isRead,
    this.data,
  });


  String get getTitle => title;

  String get getContent => content;

  bool get getIsRead => isRead;

  set setIsRead(bool value) => isRead = value;

  Data? get getData => data;

  factory MyMessage.fromJson(Map<String, dynamic> json) {
    return MyMessage(
      title: json['title'],
      content: json['content'],
      isRead: json['isRead'],
      data: json['data'],
    );
  }
}

class MessageAdapter extends TypeAdapter<MyMessage> {
  @override
  final int typeId = 0;

  @override
  MyMessage read(BinaryReader reader) {
    return MyMessage(
      title: reader.read(),
      content: reader.read(),
      isRead: reader.read(),
      data: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, MyMessage obj) {
    writer
      ..write(obj.title)
      ..write(obj.content)
      ..write(obj.isRead)
      ..write(obj.data);
  }
}

@HiveType(typeId: 3) // Assign a unique typeId for the adapter
class Data {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String description;

  Data({
    required this.id,
    required this.description,
  });


  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      // data: json['data'],
      description: json['description'],
    );
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'] ?? '',
      description: map['description'] ?? '',
    );
  }



}
class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 3;

  @override
  Data read(BinaryReader reader) {
    return Data(
      id: reader.read(),
      description: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..write(obj.id)
      ..write(obj.description);
  }
}

void addMessageToBox(String title, String content, bool isRead, Data data) async {
  print("Add Notification");
  Box<MyMessage> messageBox = Hive.box<MyMessage>('mymessages1');
  print("opne");
  MyMessage newMessage = MyMessage(title: title, content: content, isRead: isRead, data: data);
  await messageBox.add(newMessage);
}




void removeAllNotificationsFromMyMessageBox() async {
  // Get the Hive box where notifications are stored
  Box<MyMessage> notificationBox = Hive.box<MyMessage>('mymessages1');

  // Loop through all items in the box and delete them
  for (int i = 0; i < notificationBox.length; i++) {
    await notificationBox.deleteAt(i);
  }
  print('All notifications removed successfully.');
}