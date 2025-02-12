import 'package:argb_app/core/model2/apartment_info_model.dart';
import 'package:argb_app/core/model2/estate_info_model.dart';
import 'package:argb_app/core/model2/estate_model.dart';
import 'package:argb_app/core/model2/land_info_model.dart';
import 'package:argb_app/core/model2/shop_info_model.dart';
import 'package:argb_app/ui/views/apartment_view/apartment_controller.dart';
import 'package:argb_app/ui/views/apartment_view/apartment_view.dart';
import 'package:argb_app/ui/views/land_view/land_controller.dart';
import 'package:argb_app/ui/views/land_view/land_view.dart';
import 'package:argb_app/ui/views/shop_view/shop_controller.dart';
import 'package:argb_app/ui/views/shop_view/shop_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/custom_widget/custom_show_snackbar.dart';

class EstateTypeController extends GetxController {
  int selectedImageIndex = 0;
  late CarouselController buttonCarouselController = CarouselController();

  onPageChanged1(int index, _) {
    selectedImageIndex = index;
  }

  bool showContactOwner = false;
  String pass = '1212';
  String currentEstateType = '';
  RxBool isFurnished = false.obs;
  RxBool isBath = false.obs;
  RxBool thereBuilding = false.obs;
  RxBool isPlanted = false.obs;
  RxList<bool> expandedContainer = [false, false].obs;
  final GlobalKey<FormState> formKey = GlobalKey(debugLabel: 'AddApartment');
  final List<String> apartmentStates = ['على العضم', 'جاهز'];
  List<String> estateState = [
    'للبيع',
    'للإيجار',
  ];
  List<String> ownershipTypes = ['عقاري', 'كاتب عدل', 'زراعي'];
  List<String> estateTypes = ['شقة', 'محل', 'أرض'];
  final ImagePicker picker = ImagePicker();
  RxList<String> images = <String>[].obs;
  RxBool onPress = false.obs;
  TextEditingController inputPass = TextEditingController();

  TextEditingController estateStateController = TextEditingController();
  TextEditingController apartmentStateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController isFurnishedController = TextEditingController();
  TextEditingController spaceController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController numberBedController = TextEditingController();
  TextEditingController ownershipTypeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController specialController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController contactOwnerController = TextEditingController();

  validatePass() {
    if (inputPass.text == pass) {
      showContactOwner = true;
      inputPass.clear();
    } else {
      inputPass.clear();
      Get.snackbar(
        'خطأ',
        'يرجى ادخال كلمة سر صحيحة',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    update();
  }

  Future handleAddApartment() async {
    ApartmentController apartmentController = Get.find();
    apartmentController.addApartment(
        estate: EstateModel(
            dateTime: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            ),
            city: 'صافيتا',
            estateState: estateStateController.text,
            estateType: 'شقة',
            info: EstateInfoModel(
                contactOwner: int.parse(contactOwnerController.text),
                ownerName: ownerNameController.text,
                apartmentInfo: ApartmentInfoModel(
                    apartmentType: apartmentStateController.text,
                    floor: int.parse(floorController.text),
                    isFurnished: isFurnished.value,
                    numBath: 1,
                    numBed: int.parse(numberBedController.text)),
                images: images,
                note: noteController.text,
                special: specialController.text),
            location: locationController.text,
            numberView: apartmentController.allEstates.isEmpty
                ? 1
                : apartmentController
                        .allEstates[apartmentController.allEstates.length - 1]
                        .numberView! +
                    1,
            ownershipType: ownershipTypeController.text,
            price: double.parse(priceController.text),
            space: spaceController.text));
  }

  Future handleAddLand() async {
    LandController landController = Get.find();
    landController.addLand(
        estate: EstateModel(
            dateTime: DateTime.now(),
            city: 'صافيتا',
            estateState: 'للبيع',
            estateType: 'أرض',
            info: EstateInfoModel(
                contactOwner: int.parse(contactOwnerController.text),
                ownerName: ownerNameController.text,
                landInfo: LandInfoModel(
                    building: thereBuilding.value, planted: isPlanted.value),
                images: images,
                note: noteController.text,
                special: specialController.text),
            location: locationController.text,
            numberView: landController.allEstates.isEmpty
                ? 1
                : landController
                        .allEstates[landController.allEstates.length - 1]
                        .numberView! +
                    1,
            ownershipType: ownershipTypeController.text,
            price: double.parse(priceController.text),
            space: spaceController.text));
  }

  Future handleAddShop() async {
    ShopController shopController = Get.find();
    shopController.addShop(
        estate: EstateModel(
            dateTime: DateTime.now(),
            city: 'صافيتا',
            estateState: estateStateController.text,
            estateType: 'محل',
            info: EstateInfoModel(
                contactOwner: int.parse(contactOwnerController.text),
                ownerName: ownerNameController.text,
                shopInfoModel: ShopInfoModel(
                  isBath: isBath.value,
                  shopType: apartmentStateController.text,
                ),
                images: images,
                note: noteController.text,
                special: specialController.text),
            location: locationController.text,
            numberView: shopController.allEstates.isEmpty
                ? 1
                : shopController
                        .allEstates[shopController.allEstates.length - 1]
                        .numberView! +
                    1,
            ownershipType: ownershipTypeController.text,
            price: double.parse(priceController.text),
            space: spaceController.text));
  }

  Future handleAddClick() async {
    if (formKey.currentState!.validate()) {
      if (currentEstateType == 'أرض') {
        handleAddLand();
      } else if (currentEstateType == 'شقة') {
        handleAddApartment();
      } else if (currentEstateType == 'محل') {
        handleAddShop();
      }
    } else {
      showSnackBar(title: 'يرجى تعبأة الحقول قبل المتابعة');
    }
  }

  handleEditEstate({required EstateModel estate, required int index}) {
    ownerNameController.text = estate.info!.ownerName!;
    contactOwnerController.text = estate.info!.contactOwner.toString();
    ownershipTypeController.text = estate.ownershipType!;
    priceController.text = estate.price.toString();
    specialController.text = estate.info!.special!;
    noteController.text = estate.info!.note!;
    estateStateController.text = estate.estateState!;
    locationController.text = estate.location!;
    spaceController.text = estate.space!;
    images.value = estate.info!.images!.obs;
    if (currentEstateType == 'شقة') {
      floorController.text = estate.info!.apartmentInfo!.floor.toString();
      numberBedController.text = estate.info!.apartmentInfo!.numBed.toString();
      apartmentStateController.text =
          estate.info!.apartmentInfo!.apartmentType!;
      isFurnished.value = estate.info!.apartmentInfo!.isFurnished!;
    } else if (currentEstateType == 'أرض') {
      thereBuilding.value = estate.info!.landInfo!.building!;
      isPlanted.value = estate.info!.landInfo!.planted!;
    } else if (currentEstateType == 'محل') {
      isBath.value = estate.info!.shopInfoModel!.isBath!;
      apartmentStateController.text = estate.info!.shopInfoModel!.shopType!;
    }
    update();
  }

  clickToExpanded({required int index}) {
    expandedContainer[index] = !expandedContainer[index];
  }

  Future pickFile({required FileTypeEnum type}) async {
    images.clear();
    List<String> paths = [];
    switch (type) {
      case FileTypeEnum.camera:
        final image = await picker.pickImage(source: ImageSource.camera);
        image != null ? paths.add(image.path) : null;
        break;
      case FileTypeEnum.gallery:
        final image = await picker.pickMultiImage();
        for (XFile s in image) {
          paths.add(s.path);
        }
        break;
      case FileTypeEnum.file:
        break;
    }
    if (paths.isNotEmpty) {
      images.addAll(paths.obs);
      update();
    }
  }

  handleClickEstateType({required String estateType}) {
    if (estateType == 'شقة') {
      currentEstateType = 'شقة';
      Get.to(() => const ApartmentView());
    } else if (estateType == 'محل') {
      currentEstateType = 'محل';
      Get.to(() => const ShopView());
    } else if (estateType == 'أرض') {
      currentEstateType = 'أرض';
      Get.to(() => const LandView());
    }
  }

  clearDataField() {
    images.clear();
    isFurnished.value = false;
    isPlanted.value = false;
    thereBuilding.value = false;
    onPress.value = false;
    expandedContainer.value = [false, false];
    ownerNameController.clear();
    contactOwnerController.clear();
    numberBedController.clear();
    ownershipTypeController.clear();
    priceController.clear();
    specialController.clear();
    noteController.clear();
    estateStateController.clear();
    apartmentStateController.clear();
    locationController.clear();
    isFurnishedController.clear();
    spaceController.clear();
    floorController.clear();
  }
}

enum FileTypeEnum {
  camera,
  gallery,
  file,
}
