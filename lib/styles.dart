import 'package:flutter/material.dart';
import 'package:smuctian/theme_data.dart';

class AppStyle {
  static TextStyle headingTextStyle = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.bold,
    color: AppTheme.colorScheme.primary,
  );

  static TextStyle subHeaderTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: AppTheme.colorScheme.secondary.withOpacity(
      0.8,
    ),
  );

  static TextStyle loginHeaderTextField = TextStyle(
    fontSize: 21,
    color: AppTheme.lightTheme.primaryColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle featuredTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
}
