import 'package:flutter/material.dart';
import 'package:flutter_football_app/data/competitions_data.dart';
import 'package:flutter_football_app/model/competition.dart';

class AvailableCompetitionsGrid extends StatelessWidget {
  const AvailableCompetitionsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CompetitionData.getCompetitionData(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Competition>> snapshot,
      ) {
        if (snapshot.hasData) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
            ),
            itemBuilder: (BuildContext context, int index) => Card(
              color: Colors.amber,
              child: Center(
                child: Text(snapshot.data!.elementAt(index).name ?? '-'),
              ),
            ),
            itemCount: snapshot.data!.length,
          );
        } else if (snapshot.hasError) {
          throw Error();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
