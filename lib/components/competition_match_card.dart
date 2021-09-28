import 'package:flutter/material.dart';
import 'package:flutter_football_app/model/matches.dart';
import 'package:flutter_football_app/style/font.dart';

class CompetitionMatchCard extends StatelessWidget {
  const CompetitionMatchCard({
    Key? key,
    required Matches matchValue,
  })  : _matchValue = matchValue,
        super(key: key);

  final Matches _matchValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.lightGreen.shade100,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: const [
                HomeAwayPositionText(
                  text: 'HOME',
                ),
                HomeAwayPositionText(
                  text: 'AWAY',
                ),
              ],
            ),
            Row(
              children: [
                TeamNameText(
                  teamName: _matchValue.homeTeam!.name ?? '-',
                ),
                TeamNameText(
                  teamName: _matchValue.awayTeam!.name ?? '-',
                )
              ],
            ),
            Row(
              children: [
                TeamScoreText(
                    score: '${_matchValue.score!.fullTime!.homeTeam ?? '-'}'),
                Text(
                  ' : ',
                  style: kScoreCounterFont.copyWith(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                TeamScoreText(
                    score: '${_matchValue.score!.fullTime!.awayTeam ?? '-'}'),
              ],
            ),
            Text(
              'Match status: ${_matchValue.status ?? '-'}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class TeamScoreText extends StatelessWidget {
  const TeamScoreText({
    Key? key,
    required String score,
  })  : _score = score,
        super(key: key);

  final String _score;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black87,
        child: Text(
          _score,
          textAlign: TextAlign.center,
          style: kScoreCounterFont,
        ),
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}

class TeamNameText extends StatelessWidget {
  const TeamNameText({
    Key? key,
    required String teamName,
  })  : _teamName = teamName,
        super(key: key);

  final String _teamName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        _teamName,
        textAlign: TextAlign.center,
        style: kHeader1Font,
      ),
    );
  }
}

class HomeAwayPositionText extends StatelessWidget {
  const HomeAwayPositionText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: kTeamPositionFont,
      ),
    );
  }
}
