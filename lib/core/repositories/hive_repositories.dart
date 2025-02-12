import 'package:argb_app/core/model2/apartment_info_model.dart';
import 'package:argb_app/core/model2/estate_info_model.dart';
import 'package:argb_app/core/model2/estate_model.dart';
import 'package:argb_app/core/model2/land_info_model.dart';
import 'package:argb_app/core/model2/shop_info_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveRepository {
  static String primary = "app_project";
  String apartments = 'apartments';
  String shops = 'shops';
  String lands = 'lands';
  late Box boxApartment;
  late Box boxLand;
  late Box boxShop;

  registerAdapter() {
    Hive.registerAdapter(EstateAdapter());
    Hive.registerAdapter(EstateInfoAdapter());
    Hive.registerAdapter(ApartmentInfoAdapter());
    Hive.registerAdapter(LandInfoAdapter());
    Hive.registerAdapter(ShopInfoAdapter());
  }

  Future init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
  }

  Future initEstate({required String nameKey}) async {
    if (nameKey == apartments) {
      boxApartment = await Hive.openBox(apartments);
    } else if (nameKey == lands) {
      boxLand = await Hive.openBox(lands);
    } else {
      boxShop = await Hive.openBox(shops);
    }
  }

  Future closeBox({required Box boxName}) async {
    await boxName.close();
  }

  Future<void> setApartments(List<EstateModel> value) async {
    await boxApartment.put(apartments, value);
  }

  List<dynamic> getApartments() {
    return boxApartment.get(apartments, defaultValue: <EstateModel>[]);
  }

  Future<void> setLands(List<EstateModel> value) async {
    await boxLand.put(lands, value);
  }

  List<dynamic> getLands() {
    return boxLand.get(lands, defaultValue: <EstateModel>[]);
  }

  Future<void> setShops(List<EstateModel> value) async {
    await boxShop.put(shops, value);
  }

  List<dynamic> getShops() {
    return boxShop.get(shops, defaultValue: <EstateModel>[]);
  }
}
