import 'package:flutter/material.dart';
import 'package:flutter_football_app/data/matches_data.dart';
import 'package:flutter_football_app/model/matches.dart';

import 'matches_card_grouped_by_date.dart';

class MatchesSubScreen extends StatelessWidget {
  const MatchesSubScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FutureBuilder(
        future: MatchesData.getMatchesData(id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Map<String, List<Matches>> _data = snapshot.data;
            return ListView.builder(
              itemCount: _data.length,
              itemBuilder: (BuildContext context, int index) {
                String _dataKey = _data.keys.elementAt(index);
                List<Matches> _dataValue = _data[_dataKey]!;
                return MatchesCardGroupedByDate(
                    dataKey: _dataKey, dataValue: _dataValue);
              },
            );
          } else if (snapshot.hasError) {
            //TODO: Show error
            throw Error();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
