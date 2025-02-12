// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShopInfoAdapter extends TypeAdapter<ShopInfoModel> {
  @override
  final int typeId = 4;

  @override
  ShopInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShopInfoModel(isBath: fields[0] as bool?,shopType: fields[1] as String?);
  }

  @override
  void write(BinaryWriter writer, ShopInfoModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isBath)
    ..writeByte(1)
    ..write(obj.shopType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
