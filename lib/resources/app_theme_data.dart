import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';

class AppThemeData {
  const AppThemeData({Key? key});

  static ThemeData lightModeThemeData(BuildContext context) {
    return ThemeData(
        brightness: Brightness.light,
        primarySwatch: materialHeraldGreen,
        scaffoldBackgroundColor: white,
        fontFamily: fontFamily,
        expansionTileTheme: const ExpansionTileThemeData(
            childrenPadding: EdgeInsets.all(20),
            textColor: heraldGreen,
            iconColor: heraldGreen),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: textColor,
              displayColor: textColor,
              fontFamily: fontFamily,
            ),
        appBarTheme: const AppBarTheme(
          backgroundColor: white,
          iconTheme: IconThemeData(color: textColor),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          selectedItemColor: heraldGreen,
          selectedIconTheme: IconThemeData(size: 35),
          unselectedItemColor: iconColorBlack,
        ),
        listTileTheme:
            const ListTileThemeData(iconColor: textColor, textColor: textColor),
        tabBarTheme: const TabBarTheme(
          labelColor: Color(0xFF2F4858),
          unselectedLabelColor: textColor,
        ),
        dividerColor: Colors.grey,
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: white));
  }

  static ThemeData darkModeThemeData(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: materialHeraldGreen,
      scaffoldBackgroundColor: dark,
      fontFamily: fontFamily,
      appBarTheme: const AppBarTheme(
        backgroundColor: dark,
        iconTheme: IconThemeData(color: white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: dark,
        selectedItemColor: heraldGreen,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(size: 35),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
          childrenPadding: EdgeInsets.all(20),
          textColor: heraldGreen,
          iconColor: heraldGreen),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: white,
            displayColor: white,
            fontFamily: fontFamily,
          ),
      listTileTheme: const ListTileThemeData(
          tileColor: Colors.black, textColor: Color(0xffFEFEFE)),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Colors.white,
      ),
      dividerColor: Colors.white,
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.black),
    );
  }
}
