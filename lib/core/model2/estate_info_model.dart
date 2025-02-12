import 'package:argb_app/core/model2/apartment_info_model.dart';
import 'package:argb_app/core/model2/land_info_model.dart';
import 'package:argb_app/core/model2/shop_info_model.dart';
import 'package:hive/hive.dart';

part 'estate_info_model.g.dart';

@HiveType(typeId: 1)
class EstateInfoModel extends HiveObject {
  @HiveField(0)
  final String? ownerName;
  @HiveField(1)
  final int? contactOwner;
  @HiveField(2)
  final String? note;
  @HiveField(3)
  final String? special;
  @HiveField(4)
  final List<String>? images;
  @HiveField(5)
  final ApartmentInfoModel? apartmentInfo;
  @HiveField(6)
  final LandInfoModel? landInfo;
  @HiveField(7)
  final ShopInfoModel? shopInfoModel;
  @HiveField(8)
  final List<String>? videos;

  EstateInfoModel(
      {this.ownerName,
      this.contactOwner,
      this.note,
      this.special,
      this.apartmentInfo,
      this.landInfo,
      this.images,
      this.videos,
      this.shopInfoModel});
}
