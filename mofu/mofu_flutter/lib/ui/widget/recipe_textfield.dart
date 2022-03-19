import 'package:flutter/material.dart';

TextField recipeTextField(controller,text,boolean) {
  return TextField(
      controller: controller,
      obscureText: boolean,
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffFFFAEC),
          labelText: text,
          labelStyle: const TextStyle(color: Color(0xffFFBA7D)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Color(0xffFFBA7D)),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Color(0xffFFBA7D)),
            borderRadius: BorderRadius.circular(15),
          )));
}
