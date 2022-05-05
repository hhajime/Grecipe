import 'package:get/get.dart';
import 'dart:io';

class FoodVisionIngController extends GetxController {
  RxList recgResult = [].obs;
  RxString fvSelectedIcon = '달걀'.obs;
  RxInt fvSelectedIndex = 0.obs;
  File? fvImage;

  createFvIng() {
    recgResult.add(fvSelectedIcon.value);
    update();
  }

  updateFvIng(index){
    recgResult[index]['detectedClass'] = fvSelectedIcon.value;
    update();
    
  }
  deleteFvIng(index){
    recgResult.removeAt(index);
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
