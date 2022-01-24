import 'package:flutter/material.dart';
import 'package:weisle/ui/constants/colors.dart';

// ignore: non_constant_identifier_names
Widget FormButton(
    {String? text,
    bool? enabled,
    VoidCallback? function,
    Color? backgroundColor,
    Color? textColor}) {
  return InkWell(
    splashColor: Colors.white,
    onTap: enabled ?? false ? function : null,
    child: Container(
      height: 51,
      decoration: BoxDecoration(
        color: backgroundColor ??
            (enabled ?? false ? colorPrimary : colorPrimary.withOpacity(.2)),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border:
            backgroundColor != null ? Border.all(color: white, width: 2) : null,
      ),
      child: Center(
        child: Text(
          text!,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget OnboardingButton(
    {VoidCallback? function,
    Color? color,
    Widget? child,
    double? height,
    double? width}) {
  return InkWell(
    onTap: function ?? () => print(""),
    child: Container(
      height: height ?? 39,
      width: width ?? 46,
      // padding: EdgeInsets.symmetric(vertical: 17, horizontal: 10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(child: child),
    ),
  );
}
