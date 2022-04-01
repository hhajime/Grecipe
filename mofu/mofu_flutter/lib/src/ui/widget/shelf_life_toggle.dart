import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/controller/shelf_life_controller.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:get/get.dart';

Widget ShelfLifeToggleBtn(context, ShelfLifeController) {
  final shelfLifeController = 
      Get.put(ShelfLifeController(), permanent: false);
  return Obx((() => ToggleButtons(
        children: const [
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
        ],
        onPressed: (int index) {
          shelfLifeController.changeShelfLife(index);
        },
        isSelected: [
          shelfLifeController.shelfLifeIndex == 0,
          shelfLifeController.shelfLifeIndex == 1,
          shelfLifeController.shelfLifeIndex == 2,
        ],
      )));
}
