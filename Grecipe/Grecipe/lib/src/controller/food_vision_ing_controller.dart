import 'package:get/get.dart';
import 'dart:io';

class FoodVisionIngController extends GetxController {
  RxList recgResult = [].obs;
  RxList IngResult = [].obs;
  RxString fvSelectedIcon = '달걀'.obs;
  RxInt fvSelectedIndex = 0.obs;
  File? fvImage;

  createFvIng() {
    IngResult.add(fvSelectedIcon.value);
    update();
  }

  updateFvIng(index){
    IngResult[index] = fvSelectedIcon.value;
    update();
    
  }
  deleteFvIng(index){
    IngResult.removeAt(index);
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
