// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rundown_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RundownAdapter extends TypeAdapter<Rundown> {
  @override
  final int typeId = 4;

  @override
  Rundown read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rundown(
      id: fields[0] as String,
      name: fields[1] as String,
      start: fields[2] as String,
      end: fields[3] as String,
      description: fields[4] as String,
      eventId: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Rundown obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.start)
      ..writeByte(3)
      ..write(obj.end)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.eventId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RundownAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
