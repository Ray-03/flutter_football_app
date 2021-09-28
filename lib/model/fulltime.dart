/// fullTime : {
///     "homeTeam":0,
///     "awayTeam":1
/// }

class FullTime {
  FullTime({
    int homeTeam = 0,
    int awayTeam = 0,
  }) {
    _homeTeam = homeTeam;
    _awayTeam = awayTeam;
  }

  FullTime.fromJson(dynamic json) {
    _homeTeam = json['homeTeam'];
    _awayTeam = json['awayTeam'];
  }
  int? _homeTeam;
  int? _awayTeam;

  int? get homeTeam => _homeTeam;
  int? get awayTeam => _awayTeam;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['homeTeam'] = _homeTeam;
    map['awayTeam'] = _awayTeam;
    return map;
  }
}
