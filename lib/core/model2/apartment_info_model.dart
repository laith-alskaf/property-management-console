import 'package:hive_flutter/hive_flutter.dart';

part 'apartment_info_model.g.dart';

@HiveType(typeId: 2)
class ApartmentInfoModel extends HiveObject {
  @HiveField(0)
  final int? numBed;
  @HiveField(1)
  final int? numBath;
  @HiveField(2)
  final String? apartmentType;
  @HiveField(3)
  final bool? isFurnished;
  @HiveField(4)
  final int? floor;

  ApartmentInfoModel(
      {this.numBed,
      this.numBath,
      this.apartmentType,
      this.isFurnished,
      this.floor});
}
