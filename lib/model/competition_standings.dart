import 'package:flutter_football_app/model/season.dart';
import 'package:flutter_football_app/model/standings.dart';

/// season : {
///     "id":733,
///     "startDate":"2021-08-13",
///     "endDate":"2022-05-23",
///     "currentMatchday":6,
///     "winner":null
/// }
/// standings : [
///     {
///         "stage":"REGULAR_SEASON",
///         "type":"TOTAL",
///         "group":null,
///         "table":[
///             {
///                 "position":1,
///                 "team":{
///                     "id":64,
///                     "name":"Liverpool FC",
///                     "crestUrl":"https://crests.football-data.org/64.svg"
///                 },
///                 "playedGames":6,
///                 "form":null,
///                 "won":4,
///                 "draw":2,
///                 "lost":0,
///                 "points":14,
///                 "goalsFor":15,
///                 "goalsAgainst":4,
///                 "goalDifference":11
///             },
///         ]
///     }
/// ]

class CompetitionStandings {
  CompetitionStandings({
    Season? season,
    List<Standings>? standings,
  }) {
    _season = season;
    _standings = standings;
  }

  CompetitionStandings.fromJson(dynamic json) {
    _season = json['season'] != null ? Season.fromJson(json['season']) : null;
    if (json['standings'] != null) {
      _standings = [];
      json['standings'].forEach((v) {
        _standings?.add(Standings.fromJson(v));
      });
    }
  }
  Season? _season;
  List<Standings>? _standings;

  Season? get season => _season;
  List<Standings>? get standings => _standings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_season != null) {
      map['season'] = _season?.toJson();
    }
    if (_standings != null) {
      map['standings'] = _standings?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
