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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 30,
                          childAspectRatio: 4 / 1,
                        ),
                        itemCount: _dataValue.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          Matches _matchValue = _dataValue.elementAt(index);
                          // return Row(
                          //   children: [
                          //     Column(
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: [
                          //         Text(_matchValue.homeTeam!.name ?? '-'),
                          //         Text(_matchValue.awayTeam!.name ?? '-'),
                          //       ],
                          //     ),
                          //     Text(_matchValue.status ?? '-'),
                          //     Column(
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: [
                          //         Text(
                          //           _matchValue.score!.fullTime!.homeTeam!
                          //               .toString(),
                          //         ),
                          //         Text(
                          //           _matchValue.score!.fullTime!.awayTeam!
                          //               .toString(),
                          //         ),
                          //       ],
                          //     )
                          //   ],
                          // );
                          return Column(
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
                                    child:
                                        Text(_matchValue.homeTeam!.name ?? '-'),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${_matchValue.score!.fullTime!.homeTeam ?? '-'}',
                                    ),
                                  ),
                                  const Text(':'),
                                  Expanded(
                                    child: Text(
                                      '${_matchValue.score!.fullTime!.awayTeam ?? '-'}',
                                    ),
                                  ),
                                  Expanded(
                                    child:
                                        Text(_matchValue.awayTeam!.name ?? '-'),
                                  ),
                                ],
                              ),
                              Text(
                                'Match status: ${_matchValue.status ?? '-'}',
                              ),
                            ],
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
