import 'package:flutter/material.dart';

class AvailableCompetitionsGrid extends StatelessWidget {
  const AvailableCompetitionsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
    );
  }
}
