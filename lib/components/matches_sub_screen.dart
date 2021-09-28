import 'package:flutter/material.dart';
import 'package:flutter_football_app/data/matches_data.dart';
import 'package:flutter_football_app/model/matches.dart';
import 'package:flutter_football_app/service/connectivity_check.dart';

import 'matches_card_grouped_by_date.dart';

///[MatchesSubScreen] as a competition report view show match details

class MatchesSubScreen extends StatelessWidget {
  const MatchesSubScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: OfflineCheck(
        widgetChild: FutureBuilder(
          future: MatchesData.getMatchesData(id),
          builder: (
            BuildContext context,
            AsyncSnapshot<Map<String, List<Matches>>> snapshot,
          ) {
            if (snapshot.hasData) {
              //finish state
              Map<String, List<Matches>>? _data = snapshot.data;
              return ListView.builder(
                itemCount: _data!.length,
                itemBuilder: (BuildContext context, int index) {
                  String _dataKey = _data.keys.elementAt(index);
                  List<Matches> _dataValue = _data[_dataKey]!;
                  return MatchesCardGroupedByDate(
                    dataKey: _dataKey,
                    dataValue: _dataValue,
                  );
                },
              );
            } else if (snapshot.hasError) {
              //error state
              //TODO: Show error
              throw Error();
            } else {
              //empty state
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
