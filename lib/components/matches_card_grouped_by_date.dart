import 'package:flutter/material.dart';
import 'package:flutter_football_app/model/matches.dart';
import 'competition_match_card.dart';
import 'date_divider.dart';

class MatchesCardGroupedByDate extends StatelessWidget {
  const MatchesCardGroupedByDate({
    Key? key,
    required String dataKey,
    required List<Matches> dataValue,
  })  : _dataKey = dataKey,
        _dataValue = dataValue,
        super(key: key);

  final String _dataKey;
  final List<Matches> _dataValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DateDivider(date: _dataKey),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
            ),
            itemCount: _dataValue.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              Matches _matchValue = _dataValue.elementAt(index);
              return CompetitionMatchCard(matchValue: _matchValue);
            },
          ),
        ],
      ),
    );
  }
}
