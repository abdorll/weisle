import 'package:flutter/material.dart';
import 'package:weisle/ui/constants/colors.dart';

InputDecorationTheme inputDecoration = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
    filled: true,
    fillColor: white,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorPrimary,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5))),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffE5E5E5)),
        borderRadius: BorderRadius.all(Radius.circular(5))),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: red,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5))),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: red,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5))),
    hintStyle: const TextStyle(
        fontWeight: FontWeight.w300, color: Color(0xff999999), fontSize: 14));
