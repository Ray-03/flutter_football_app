/// id : 735
/// startDate : "2021-08-07"
/// endDate : "2022-05-09"
/// currentMatchday : 9
/// winner : null

class CurrentSeason {
  CurrentSeason({
    int? id,
    String? startDate,
    String? endDate,
    int? currentMatchday,
    dynamic winner,
  }) {
    _id = id;
    _startDate = startDate;
    _endDate = endDate;
    _currentMatchday = currentMatchday;
    _winner = winner;
  }

  CurrentSeason.fromJson(dynamic json) {
    _id = json['id'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _currentMatchday = json['currentMatchday'];
    _winner = json['winner'];
  }
  int? _id;
  String? _startDate;
  String? _endDate;
  int? _currentMatchday;
  dynamic _winner;

  int? get id => _id;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  int? get currentMatchday => _currentMatchday;
  dynamic get winner => _winner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['currentMatchday'] = _currentMatchday;
    map['winner'] = _winner;
    return map;
  }
}
