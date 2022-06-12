import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData getTheme() {
    return _themeData();
  }

  static TextStyle largeText(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 25.0.sp,
          fontWeight: FontWeight.w700,
          color: AppPallet.textColor,
          fontFamily: "Netflix",
        );
  }

  static TextStyle appHeaderText(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 17.0.sp,
          fontWeight: FontWeight.w600,
          color: AppPallet.textColor,
          fontFamily: "Netflix",
        );
  }

  static TextStyle semiLargeText(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w700,
          color: AppPallet.textColor,
          fontFamily: "Netflix",
        );
  }

  static TextStyle mediumText(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w700,
          color: AppPallet.textColor,
          fontFamily: "Netflix",
        );
  }

  static TextStyle normalText(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 12.0.sp,
          fontWeight: FontWeight.w500,
          color: AppPallet.textColor,
          fontFamily: "Netflix",
        );
  }

  static TextStyle smallText(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 9.0.sp,
          fontWeight: FontWeight.w300,
          color: AppPallet.textColor,
          fontFamily: "Netflix",
        );
  }

  static TextStyle smallestText(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 10.0.sp,
          fontWeight: FontWeight.w300,
          color: AppPallet.textColor,
          fontFamily: "Netflix",
        );
  }

  static ThemeData _themeData() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        color: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppPallet.primaryColor,
        ),
      ),
      fontFamily: 'Netflix',
      // scaffoldBackgroundColor: AppPallet.fadeColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      platform: TargetPlatform.iOS,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
    );
  }
}

// class CustomTheme {

// }
