import 'package:flutter/material.dart';

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
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
          ),
          itemBuilder: (BuildContext context, int index) => Card(
            color: Colors.amber,
            child: Center(
              child: Text('$index'),
            ),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
