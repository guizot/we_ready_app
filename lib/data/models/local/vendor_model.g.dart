// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VendorAdapter extends TypeAdapter<Vendor> {
  @override
  final int typeId = 1;

  @override
  Vendor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vendor(
      id: fields[0] as String,
      name: fields[1] as String,
      category: fields[2] as String,
      budget: fields[3] as String,
      eventId: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Vendor obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.budget)
      ..writeByte(4)
      ..write(obj.eventId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VendorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
