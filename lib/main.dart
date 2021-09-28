import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_football_app/routes.dart';
import 'package:flutter_football_app/view/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );
  runApp(const FlutterFootballApp());
}

class FlutterFootballApp extends StatelessWidget {
  const FlutterFootballApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightGreen.shade300,
        colorScheme: ColorScheme.light(
          primary: Colors.green.shade500,
          secondary: Colors.greenAccent.shade400,
        ),
      ),
      initialRoute: HomeScreen.id,
      routes: routes,
    );
  }
}
