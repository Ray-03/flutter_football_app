import 'package:flutter/material.dart';
import 'package:flutter_football_app/components/available_competitions_grid.dart';
import 'package:flutter_football_app/service/connectivity_check.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Football App'),
        ),
        body: const OfflineCheck(
          widgetChild: AvailableCompetitionsGrid(),
        ),
      ),
    );
  }
}
