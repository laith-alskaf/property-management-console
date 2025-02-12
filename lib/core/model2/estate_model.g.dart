// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EstateAdapter extends TypeAdapter<EstateModel> {
  @override
  final int typeId = 0;

  @override
  EstateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EstateModel(
      numberView: fields[0] as int?,
      space: fields[1] as String?,
      price: fields[2] as double?,
      estateType: fields[3] as String?,
      estateState: fields[4] as String?,
      city: fields[5] as String?,
      location: fields[6] as String?,
      ownershipType: fields[7] as String?,
      info: fields[8] as dynamic,
      dateTime: fields[9] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, EstateModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.numberView)
      ..writeByte(1)
      ..write(obj.space)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.estateType)
      ..writeByte(4)
      ..write(obj.estateState)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.ownershipType)
      ..writeByte(8)
      ..write(obj.info)
      ..writeByte(9)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EstateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
