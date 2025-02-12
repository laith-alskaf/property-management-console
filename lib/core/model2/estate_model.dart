import 'package:argb_app/core/model2/estate_info_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'estate_model.g.dart';
@HiveType(typeId: 0)
class EstateModel extends HiveObject {
  @HiveField(0)
  final int? numberView;
  @HiveField(1)
  final String? space;
  @HiveField(2)
  final double? price;
  @HiveField(3)
  final String? estateType;
  @HiveField(4)
  final String? estateState;
  @HiveField(5)
  final String? city;
  @HiveField(6)
  final String? location;
  @HiveField(7)
  final String? ownershipType;
  @HiveField(8)
  final EstateInfoModel? info;
  @HiveField(8)
  final DateTime? dateTime;

  EstateModel(
      {this.numberView,
        this.space,
        this.price,
        this.estateType,
        this.estateState,
        this.city,
        this.location,
        this.ownershipType,
        this.info,this.dateTime, });
}