import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/controller/shelf_life_controller.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:get/get.dart';

Widget ShelfLifeToggleBtn() {
  return ToggleButtons(
        children: const [
          Icon(Icons.ac_unit,
                    size: 20.0,),
          Icon(Icons.airport_shuttle,
                    size: 20.0,),
          Icon(Icons.all_inclusive,
                    size: 20.0,),
        ],
        onPressed: (int index) {
          ShelfLifeController.changeTabIndex(index);
        },
        isSelected: [
        ]);
      
}
