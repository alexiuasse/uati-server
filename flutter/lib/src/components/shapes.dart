import 'package:flutter/material.dart';

get roundedBorderRadius => const BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0));

get roundedBoxDecoration => BoxDecoration(borderRadius: roundedBorderRadius);

get roundedShape => RoundedRectangleBorder(borderRadius: roundedBorderRadius);

get fullRoundedShape => const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0)));

get outlinedBorder => OutlineInputBorder(borderRadius: BorderRadius.circular(16.0), borderSide: const BorderSide());
