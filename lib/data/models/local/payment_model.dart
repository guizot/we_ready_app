import 'package:hive/hive.dart';

part 'payment_model.g.dart';

@HiveType(typeId: 2)
class Payment extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String amount;

  @HiveField(3)
  String date;

  @HiveField(4)
  String vendorId; // foreign key to Vendor

  Payment({
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
    required this.vendorId,
  });
}
