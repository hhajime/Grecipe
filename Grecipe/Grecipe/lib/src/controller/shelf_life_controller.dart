import 'package:get/get.dart';

class ShelfLifeController extends GetxController {
  RxString shelflife = 'good'.obs;

  RxList<bool> isSelected = [true, false, false].obs;
  void changeTabIndex(int index) {
          for(int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++){
            if(buttonIndex == index){
              isSelected[buttonIndex] = true;
            } else {
              isSelected[buttonIndex] = false;
            }
          }if(index == 0){
            shelflife.value = 'good';
          } else if(index == 1){
            shelflife.value = 'danger';
          } else {
            shelflife.value = 'expired';
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
