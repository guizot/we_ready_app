import 'package:hive/hive.dart';

part 'invitation_model.g.dart';

@HiveType(typeId: 3)
class Invitation extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String category;

  @HiveField(3)
  String invitationPackage;

  @HiveField(4)
  String confirm;

  @HiveField(5)
  String eventId; // foreign key to Event

  Invitation({
    required this.id,
    required this.name,
    required this.category,
    required this.invitationPackage,
    required this.confirm,
    required this.eventId,
  });
}
