import 'package:flutter/material.dart';

class AppTheme {
  static var colorScheme = ColorScheme.fromSeed(seedColor:
  // Colors.blue
    const Color(0xFF1e3c72)
  );
  static ThemeData lightTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    colorScheme: colorScheme,

    textTheme: TextTheme(

    ),

    // scaffoldBackgroundColor: Colors.blueAccent.shade100,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.inversePrimary,
      // foregroundColor: Colors.black,

      centerTitle: true,
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      border: InputBorder.none,
      // OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black.withOpacity(0.6),
      ),
      fillColor: Colors.white54,
      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     width: 1,
      //     color: colorScheme.primary,
      //   ),
      // ),
      floatingLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
      alignLabelWithHint: true,
    ),
    listTileTheme: ListTileThemeData(
        // contentPadding: const EdgeInsets.only(left: 10),
        // shape: RoundedRectangleBorder(
        //   side: BorderSide(width: 2, color: colorScheme.outline.withOpacity(0.1)),
        //   borderRadius: BorderRadius.circular(25),
        // ),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: colorScheme.primary.withOpacity(0.8),
          fontSize: 17,
        ),
        subtitleTextStyle: const TextStyle().copyWith(
            fontWeight: FontWeight.w600, color: Colors.black, fontSize: 12)),
    expansionTileTheme: const ExpansionTileThemeData(
      childrenPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll<Color?>(colorScheme.background),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
          textStyle: const MaterialStatePropertyAll<TextStyle?>(
              TextStyle(fontSize: 16)),
          minimumSize: const MaterialStatePropertyAll<Size?>(Size(120, 47)),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
    ),

    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(shape: CircleBorder()),

    useMaterial3: true,
  );
}
