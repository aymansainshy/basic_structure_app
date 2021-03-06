import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mumayaz/src/lang/app_localazation.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../utils/custom_page_transition.dart';

class AppColors {
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColors = Colors.orange;
  // Color.fromRGBO(14, 59, 101, 1);
}

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Tajawal',
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CustomPageTransitionBuilder(),
      TargetPlatform.iOS: CustomPageTransitionBuilder(),
    },
  ),
  //.copyWith(
  //  pageTransitionsTheme: const PageTransitionsTheme(
  //    builders: <TargetPlatform, PageTransitionsBuilder>{
  //      TargetPlatform.android: ZoomPageTransitionsBuilder(),
  //      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
  //    },
  //  ),
);

String translate(String text, BuildContext context) {
  return AppLocalization.of(context).translate(text);
}

Widget sleekCircularSlider(
    BuildContext context, double size, Color color1, Color color2) {
  return SleekCircularSlider(
    initialValue: 20,
    max: 100,
    onChange: (v) {},
    appearance: CircularSliderAppearance(
      spinnerMode: true,
      infoProperties: InfoProperties(),
      angleRange: 360,
      startAngle: 90,
      size: size,
      customColors: CustomSliderColors(
        hideShadow: true,
        dotColor: Colors.transparent,
        progressBarColors: [color1, color2],
        trackColor: Colors.transparent,
      ),
      customWidths: CustomSliderWidths(
        progressBarWidth: 4.0,
        trackWidth: 3.0,
      ),
    ),
  );
}
