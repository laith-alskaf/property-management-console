import 'package:hive_flutter/hive_flutter.dart';

part 'shop_info_model.g.dart';

@HiveType(typeId: 4)
class ShopInfoModel extends HiveObject {
  @HiveField(0)
  final bool? isBath;
  @HiveField(1)
  final String? shopType;

  ShopInfoModel({this.isBath,this.shopType});
}
