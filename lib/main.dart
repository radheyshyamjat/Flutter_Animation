import 'package:animation_app/colors.dart';
import 'package:animation_app/main_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Constraint for only portrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((item) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            theme: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(secondary: CustomColor.primary),
            ),
            home: const MainViewPage(),
          );
        }
    );
  }
}