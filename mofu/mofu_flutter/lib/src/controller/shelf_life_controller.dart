import 'package:get/get.dart';

class ShelfLifeController extends GetxController {

  RxList<bool> isSelected = [true, false, false].obs;
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
