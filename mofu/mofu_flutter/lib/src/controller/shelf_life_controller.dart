import 'package:get/get.dart';

class ShelfLifeController extends GetxController {

  static changeTabIndex(int index) {
  RxList<bool> isSelected = <bool>[].obs; 
  var tabIndex = 0.obs;
    tabIndex.value = index;
          for(int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++){
            if(buttonIndex == index){
              isSelected[buttonIndex] = true;
            } else {
              isSelected[buttonIndex] = false;
            }
          }
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
