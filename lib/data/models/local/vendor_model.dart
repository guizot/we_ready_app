import 'package:hive/hive.dart';

part 'vendor_model.g.dart';

@HiveType(typeId: 1)
class Vendor extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String category;

  @HiveField(3)
  String budget;

  @HiveField(4)
  String description;

  @HiveField(5)
  String eventId; // foreign key to Event

  @HiveField(6)
  DateTime createdAt;

  Vendor({
    required this.id,
    required this.name,
    required this.category,
    required this.budget,
    required this.description,
    required this.eventId,
    required this.createdAt,
  });
}
