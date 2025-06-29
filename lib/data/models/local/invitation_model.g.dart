// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvitationAdapter extends TypeAdapter<Invitation> {
  @override
  final int typeId = 3;

  @override
  Invitation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Invitation(
      id: fields[0] as String,
      name: fields[1] as String,
      category: fields[2] as String,
      invitationPackage: fields[3] as String,
      confirm: fields[4] as String,
      eventId: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Invitation obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.invitationPackage)
      ..writeByte(4)
      ..write(obj.confirm)
      ..writeByte(5)
      ..write(obj.eventId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvitationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
