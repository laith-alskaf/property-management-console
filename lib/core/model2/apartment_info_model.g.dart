// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartment_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApartmentInfoAdapter extends TypeAdapter<ApartmentInfoModel> {
  @override
  final int typeId = 2;

  @override
  ApartmentInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ApartmentInfoModel(
      numBed: fields[0] as int?,
      numBath: fields[1] as int?,
      apartmentType: fields[2] as String?,
      isFurnished: fields[3] as bool?,
      floor: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ApartmentInfoModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.numBed)
      ..writeByte(1)
      ..write(obj.numBath)
      ..writeByte(2)
      ..write(obj.apartmentType)
      ..writeByte(3)
      ..write(obj.isFurnished)
      ..writeByte(4)
      ..write(obj.floor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApartmentInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
