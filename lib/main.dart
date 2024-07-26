import 'package:bmi_calculator/pages/home.dart';
import 'package:bmi_calculator/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return ScreenUtilInit(
          designSize: const Size(360, 690), // Set according to your design
          minTextAdapt: true,
          builder: (context, child) {
            return  MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeProvider.themeMode,
              home: const Home(),
            );
          });
    });
  }
}
