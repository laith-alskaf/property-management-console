// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'land_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LandInfoAdapter extends TypeAdapter<LandInfoModel> {
  @override
  final int typeId = 3;

  @override
  LandInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LandInfoModel(
      planted: fields[0] as bool?,
      building: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, LandInfoModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.planted)
      ..writeByte(1)
      ..write(obj.building);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LandInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
