import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeLeft,
    ],
  );
  runApp(const FlutterFootballApp());
}

class FlutterFootballApp extends StatelessWidget {
  const FlutterFootballApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Football App',
    );
  }
}
