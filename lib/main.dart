import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:speso_assessment/constants/text_theme.dart';
import 'package:speso_assessment/presentation/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // onGenerateRoute: Routers().onGenerateRoute,
          theme: CustomTheme.getTheme(),
          title: 'Speso',
          home: const BottomAppBarScreen(),
        );
      }),
    );
  }
}
