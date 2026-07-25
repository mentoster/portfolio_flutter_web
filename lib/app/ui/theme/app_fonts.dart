import 'package:flutter/material.dart';

import 'responsive.dart';

const TextStyle usualText = TextStyle(fontSize: 20);
const TextStyle heading1 = TextStyle(fontSize: 60, fontWeight: FontWeight.bold);
const TextStyle heading2 =
    TextStyle(fontSize: 36, fontWeight: FontWeight.normal);
const TextStyle heading2Bold = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.bold,
);

const TextStyle appBar = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
final TextStyle darkAppBar = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white.withOpacity(0.87));

TextStyle responsiveHeading1(double width) =>
    heading1.copyWith(fontSize: ResponsiveLayout.heading1Size(width));

TextStyle responsiveHeading2(double width) =>
    heading2.copyWith(fontSize: ResponsiveLayout.heading2Size(width));

TextStyle responsiveHeading2Bold(double width) =>
    heading2Bold.copyWith(fontSize: ResponsiveLayout.heading2Size(width));

TextStyle responsiveBody(double width) =>
    usualText.copyWith(fontSize: ResponsiveLayout.bodySize(width));
