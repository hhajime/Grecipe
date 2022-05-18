import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CommunityRecipeAddController extends GetxController {
  var tabIndex = 0.obs;
  PickedFile? titleImage;

  Future pickImage() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    titleImage = image!;
  }
}
