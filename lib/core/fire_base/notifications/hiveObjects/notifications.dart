// Define the model classes for the JSON data
import 'package:hive/hive.dart';

class Notificationss {
  int id;
  String title;
  List<DataItem> data;
  String type;
  int isRead;
  String description;

  Notificationss({
    required this.id,
    required this.title,
    required this.data,
    required this.type,
    required this.isRead,
    required this.description
  });

  factory Notificationss.fromJson(Map<String, dynamic> json) {
    return Notificationss(
      id: json['id'],
      title: json['title'],
      data: (json['data'] as List).map((data) => DataItem.fromJson(data)).toList(),
      type: json['type'],
      isRead: json['is_read'],
      description: json['description'],
    );
  }
}

class DataItem {
  String key;
  String value;

  DataItem({required this.key, required this.value});

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      key: json['key'],
      value: json['value'],
    );
  }
}

// Define the Hive class and Adapter
@HiveType(typeId: 0)
class NotificationHive extends HiveObject {
  @HiveField(0)
  late double id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late List<DataItem> data;

  @HiveField(3)
  late String type;

  @HiveField(4)
  late int isRead;

  @HiveField(5)
  late String description;
}

class NotificationHiveAdapter extends TypeAdapter<NotificationHive> {
  @override
  final int typeId = 0;

  @override
  NotificationHive read(BinaryReader reader) {
    return NotificationHive()
      ..id = reader.read()
      ..title = reader.read()
      ..data = reader.read()
      ..type = reader.read()
      ..isRead = reader.read()
      ..description = reader.read();
  }

  @override
  void write(BinaryWriter writer, NotificationHive obj) {
    writer
      ..write(obj.id)
      ..write(obj.title)
      ..write(obj.data)
      ..write(obj.type)
      ..write(obj.isRead)
      ..write(obj.description);
  }
}



   const String _boxName = 'notification';

   Future<void> addNotifications(List<Notificationss> notifications) async {
    final box = await Hive.openBox<Notificationss>(_boxName);

    for (var notification in notifications) {
      final notificationHive = Notificationss(
        id: notification.id,
        title: notification.title,
        data: notification.data,
        type: notification.type,
        isRead: notification.isRead,
        description: notification.description,
      );

      box.add(notificationHive);
    }

    await box.close();
  }



 Future<void> clearNotifications() async {
final box = await Hive.openBox<NotificationHive>(_boxName);

await box.clear();

await box.close();
}
