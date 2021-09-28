import 'package:flutter/material.dart';
import 'package:flutter_football_app/data/matches_data.dart';
import 'package:flutter_football_app/model/matches.dart';
import 'package:flutter_football_app/style/font.dart';

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
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(),
                          ),
                          Text(_dataKey),
                          const Expanded(
                            child: Divider(),
                          ),
                        ],
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 30,
                        ),
                        itemCount: _dataValue.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          Matches _matchValue = _dataValue.elementAt(index);
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.lightGreen.shade100,
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: const [
                                      Expanded(
                                        child: Text(
                                          'HOME',
                                          textAlign: TextAlign.center,
                                          style: kTeamPositionFont,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'AWAY',
                                          textAlign: TextAlign.center,
                                          style: kTeamPositionFont,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          _matchValue.homeTeam!.name ?? '-',
                                          textAlign: TextAlign.center,
                                          style: kHeader1Font,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          _matchValue.awayTeam!.name ?? '-',
                                          textAlign: TextAlign.center,
                                          style: kHeader1Font,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          color: Colors.black87,
                                          child: Text(
                                            '${_matchValue.score!.fullTime!.homeTeam ?? '-'}',
                                            textAlign: TextAlign.center,
                                            style: kScoreCounterFont,
                                          ),
                                          padding: const EdgeInsets.all(20),
                                        ),
                                      ),
                                      Text(
                                        ' : ',
                                        style: kScoreCounterFont.copyWith(
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.black87,
                                          child: Text(
                                            '${_matchValue.score!.fullTime!.awayTeam ?? '-'}',
                                            textAlign: TextAlign.center,
                                            style: kScoreCounterFont,
                                          ),
                                          padding: const EdgeInsets.all(20),
                                        ),
                                      ),
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
                        },
                      ),
                    ],
                  ),
                );
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
