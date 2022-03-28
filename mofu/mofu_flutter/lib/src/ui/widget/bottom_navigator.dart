import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:mofu_flutter/src/ui/view/mypage_view/mypage_page.dart';


BottomNavigationBar myBNBar(){
  int _selectedIndex = 0;
return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: mainColor,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        onTap: (int index) {
          _selectedIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            label: 'fridge',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'food vision',
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            label: 'my page',
            icon: Icon(Icons.location_on),
          ),
        ],
      );}