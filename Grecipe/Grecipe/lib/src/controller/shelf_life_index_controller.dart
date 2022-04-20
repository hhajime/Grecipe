import 'package:get/get.dart';

class ShelfLifeIndexController extends GetxController {

  RxList<bool> isSelected = [true, false, false, false].obs;
  void changeTabIndex(int index) {
          for(int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++){
            if(buttonIndex == index){
              isSelected[buttonIndex] = true;
            } else {
              isSelected[buttonIndex] = false;
            }
          }
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
