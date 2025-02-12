// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EstateInfoAdapter extends TypeAdapter<EstateInfoModel> {
  @override
  final int typeId = 1;

  @override
  EstateInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EstateInfoModel(
      ownerName: fields[0] as String?,
      contactOwner: fields[1] as int?,
      note: fields[2] as String?,
      special: fields[3] as String?,
      apartmentInfo: fields[5] as ApartmentInfoModel?,
      landInfo: fields[6] as LandInfoModel?,
      images: (fields[4] as List?)?.cast<String>(),
      shopInfoModel:fields[7] as ShopInfoModel? ,
      videos: (fields[8] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, EstateInfoModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.ownerName)
      ..writeByte(1)
      ..write(obj.contactOwner)
      ..writeByte(2)
      ..write(obj.note)
      ..writeByte(3)
      ..write(obj.special)
      ..writeByte(4)
      ..write(obj.images)
      ..writeByte(5)
      ..write(obj.apartmentInfo)
      ..writeByte(6)
      ..write(obj.landInfo)
      ..writeByte(7)
      ..write(obj.shopInfoModel)
      ..writeByte(8)
      ..write(obj.videos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EstateInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
