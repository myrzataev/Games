import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_game/screens/main_screen.dart';
import 'package:quiz_game/services/shared_preferences_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (_, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(),
            home: MainScreen());
      },
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesManager.instance.init();

  runApp(const MyApp());
}
