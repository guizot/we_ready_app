import 'package:hive/hive.dart';

part 'rundown_model.g.dart';

@HiveType(typeId: 4)
class Rundown extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String start;

  @HiveField(3)
  String end;

  @HiveField(4)
  String description;

  @HiveField(5)
  String eventId; // foreign key to Event

  Rundown({
    required this.id,
    required this.name,
    required this.start,
    required this.end,
    required this.description,
    required this.eventId,
  });
}
