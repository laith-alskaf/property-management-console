import 'package:hive_flutter/hive_flutter.dart';

part 'land_info_model.g.dart';

@HiveType(typeId: 3)
class LandInfoModel extends HiveObject {
  @HiveField(0)
  final bool? planted;
  @HiveField(1)
  final bool? building;

  LandInfoModel({this.planted, this.building});
}
