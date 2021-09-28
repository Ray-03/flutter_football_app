import 'package:flutter_football_app/model/score.dart';

import 'home_away_team.dart';

/// id : 328846
/// utcDate : "2021-06-22T18:00:00Z"
/// status : "FINISHED"
/// score : {
///     "winner":"AWAY_TEAM",
///     "duration":"REGULAR",
///     "fullTime":{
///         "homeTeam":0,
///         "awayTeam":1
///     },
///     "halfTime":{
///         "homeTeam":0,
///         "awayTeam":0
///     },
///     "extraTime":{
///         "homeTeam":null,
///         "awayTeam":null
///     },
///     "penalties":{
///         "homeTeam":null,
///         "awayTeam":null
///     }
/// }
/// homeTeam : {
///     "id":8166,
///     "name":"HB"
/// }
/// awayTeam : {
///     "id":8912,
///     "name":"Inter Club d'Escaldes"
/// }

class Matches {
  Matches({
    int? id,
    DateTime? utcDate,
    String? status,
    Score? score,
    HomeAwayTeam? homeTeam,
    HomeAwayTeam? awayTeam,
  }) {
    _id = id;
    _utcDate = utcDate;
    _status = status;
    _score = score;
    _homeTeam = homeTeam;
    _awayTeam = awayTeam;
  }

  Matches.fromJson(dynamic json) {
    _id = json['id'];
    _utcDate = DateTime.parse(json['utcDate']).toLocal();
    _status = json['status'];
    _score = json['score'] != null ? Score.fromJson(json['score']) : null;
    _homeTeam = json['homeTeam'] != null
        ? HomeAwayTeam.fromJson(json['homeTeam'])
        : null;
    _awayTeam = json['awayTeam'] != null
        ? HomeAwayTeam.fromJson(json['awayTeam'])
        : null;
  }

  int? _id;
  DateTime? _utcDate;
  String? _status;
  Score? _score;
  HomeAwayTeam? _homeTeam;
  HomeAwayTeam? _awayTeam;

  int? get id => _id;

  DateTime? get utcDate => _utcDate;

  String? get status => _status;

  Score? get score => _score;

  HomeAwayTeam? get homeTeam => _homeTeam;

  HomeAwayTeam? get awayTeam => _awayTeam;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['utcDate'] = _utcDate;
    map['status'] = _status;
    if (_score != null) {
      map['score'] = _score?.toJson();
    }
    if (_homeTeam != null) {
      map['homeTeam'] = _homeTeam?.toJson();
    }
    if (_awayTeam != null) {
      map['awayTeam'] = _awayTeam?.toJson();
    }
    return map;
  }
}
