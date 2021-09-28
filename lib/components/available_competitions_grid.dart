import 'package:flutter/material.dart';
import 'package:flutter_football_app/data/competitions_data.dart';
import 'package:flutter_football_app/model/competition.dart';

import 'competition_item_card.dart';

/// [AvailableCompetitionsGrid] contains competition item cards

class AvailableCompetitionsGrid extends StatelessWidget {
  const AvailableCompetitionsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FutureBuilder(
        future: CompetitionData.getCompetitionData(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Competition>> snapshot,
        ) {
          if (snapshot.hasData) {
            //finish state
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (BuildContext context, int index) {
                Competition item = snapshot.data!.elementAt(index);
                return CompetitionsItemCard(itemData: item);
              },
              itemCount: snapshot.data!.length,
            );
          } else if (snapshot.hasError) {
            //error state
            throw Error();
          } else {
            //empty state
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
