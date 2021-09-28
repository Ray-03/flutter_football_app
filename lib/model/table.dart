import 'package:flutter_football_app/model/team.dart';

/// position : 1
/// team : {
///     "id":64,
///     "name":"Liverpool FC",
///     "crestUrl":"https://crests.football-data.org/64.svg"
/// }
/// playedGames : 6
/// form : null
/// won : 4
/// draw : 2
/// lost : 0
/// points : 14
/// goalsFor : 15
/// goalsAgainst : 4
/// goalDifference : 11

class Table {
  Table({
    int? position,
    Team? team,
    int? playedGames,
    dynamic form,
    int? won,
    int? draw,
    int? lost,
    int? points,
    int? goalsFor,
    int? goalsAgainst,
    int? goalDifference,
  }) {
    _position = position;
    _team = team;
    _playedGames = playedGames;

    _won = won;
    _draw = draw;
    _lost = lost;
    _points = points;
    _goalsFor = goalsFor;
    _goalsAgainst = goalsAgainst;
  }

  Table.fromJson(dynamic json) {
    _position = json['position'];
    _team = json['team'] != null ? Team.fromJson(json['team']) : null;
    _playedGames = json['playedGames'];

    _won = json['won'];
    _draw = json['draw'];
    _lost = json['lost'];
    _points = json['points'];
    _goalsFor = json['goalsFor'];
    _goalsAgainst = json['goalsAgainst'];
  }

  int? _position;
  Team? _team;
  int? _playedGames;
  int? _won;
  int? _draw;
  int? _lost;
  int? _points;
  int? _goalsFor;
  int? _goalsAgainst;

  int? get position => _position;

  Team? get team => _team;

  int? get playedGames => _playedGames;

  int? get won => _won;

  int? get draw => _draw;

  int? get lost => _lost;

  int? get points => _points;

  int? get goalsFor => _goalsFor;

  int? get goalsAgainst => _goalsAgainst;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['position'] = _position;
    if (_team != null) {
      map['team'] = _team?.toJson();
    }
    map['playedGames'] = _playedGames;
    map['won'] = _won;
    map['draw'] = _draw;
    map['lost'] = _lost;
    map['points'] = _points;
    map['goalsFor'] = _goalsFor;
    map['goalsAgainst'] = _goalsAgainst;

    return map;
  }
}
