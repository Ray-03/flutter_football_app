import 'package:flutter/material.dart';

void main() => runApp(const FlutterFootballApp());

class FlutterFootballApp extends StatelessWidget {
  const FlutterFootballApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Football App',
    );
  }
}
