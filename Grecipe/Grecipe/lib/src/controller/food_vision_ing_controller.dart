import 'package:get/get.dart';
import 'dart:io';

class FoodVisionIngController extends GetxController {
  RxList recgResult = [].obs;
  RxList ingResult = [].obs;
  RxString fvSelectedIcon = '달걀'.obs;
  RxInt fvSelectedIndex = 0.obs;
  File? fvImage;

  createFvIng() {
    ingResult.add(fvSelectedIcon.value);
    update();
  }

  updateFvIng(index) {
    ingResult[index] = fvSelectedIcon.value;
    update();
  }

  deleteFvIng(index) {
    ingResult.removeAt(index);
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
