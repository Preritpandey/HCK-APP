// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OngoingClassGroupAdapter extends TypeAdapter<OngoingClassGroup> {
  @override
  final int typeId = 0;

  @override
  OngoingClassGroup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OngoingClassGroup(
      id: fields[0] as String,
      courseType: fields[1] as String,
      moduleName: fields[2] as String,
      teacherName: fields[3] as String,
      classType: fields[4] as String,
      groups: (fields[5] as List).cast<String>(),
      roomName: fields[6] as String,
      blockName: fields[7] as String,
      day: fields[8] as String,
      startTime: fields[9] as String,
      endTime: fields[10] as String,
      status: fields[11] as String,
      createdOn: fields[12] as String,
      v: fields[13] as int,
    );
  }

  @override
  void write(BinaryWriter writer, OngoingClassGroup obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.courseType)
      ..writeByte(2)
      ..write(obj.moduleName)
      ..writeByte(3)
      ..write(obj.teacherName)
      ..writeByte(4)
      ..write(obj.classType)
      ..writeByte(5)
      ..write(obj.groups)
      ..writeByte(6)
      ..write(obj.roomName)
      ..writeByte(7)
      ..write(obj.blockName)
      ..writeByte(8)
      ..write(obj.day)
      ..writeByte(9)
      ..write(obj.startTime)
      ..writeByte(10)
      ..write(obj.endTime)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.createdOn)
      ..writeByte(13)
      ..write(obj.v);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OngoingClassGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
