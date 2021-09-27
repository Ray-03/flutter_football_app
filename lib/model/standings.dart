import 'package:flutter_football_app/model/table.dart';

/// stage : "REGULAR_SEASON"
/// type : "TOTAL"
/// group : null
/// table : [
///     {
///         "position":1,
///         "team":{
///             "id":64,
///             "name":"Liverpool FC",
///             "crestUrl":"https://crests.football-data.org/64.svg"
///         },
///         "playedGames":6,
///         "form":null,
///         "won":4,
///         "draw":2,
///         "lost":0,
///         "points":14,
///         "goalsFor":15,
///         "goalsAgainst":4,
///         "goalDifference":11
///     }
/// ]

class Standings {
  Standings({
    String? stage,
    String? type,
    dynamic group,
    List<Table>? table,
  }) {
    _stage = stage;
    _type = type;
    _group = group;
    _table = table;
  }

  Standings.fromJson(dynamic json) {
    _stage = json['stage'];
    _type = json['type'];
    _group = json['group'];
    if (json['table'] != null) {
      _table = [];
      json['table'].forEach((v) {
        _table?.add(Table.fromJson(v));
      });
    }
  }
  String? _stage;
  String? _type;
  dynamic _group;
  List<Table>? _table;

  String? get stage => _stage;
  String? get type => _type;
  dynamic get group => _group;
  List<Table>? get table => _table;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stage'] = _stage;
    map['type'] = _type;
    map['group'] = _group;
    if (_table != null) {
      map['table'] = _table?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
