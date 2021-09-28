import 'package:flutter/material.dart';
import 'package:flutter_football_app/data/matches_data.dart';
import 'package:flutter_football_app/model/matches.dart';

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
                      Text(_dataKey),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 30,
                            mainAxisExtent: MediaQuery.of(context).size.height),
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: const [
                                      Expanded(
                                        child: Text(
                                          'HOME',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'AWAY',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              _matchValue.homeTeam!.name ?? '-',
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '${_matchValue.score!.fullTime!.homeTeam ?? '-'}',
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Text(':'),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              _matchValue.awayTeam!.name ?? '-',
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '${_matchValue.score!.fullTime!.awayTeam ?? '-'}',
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Match status: ${_matchValue.status ?? '-'}',
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
