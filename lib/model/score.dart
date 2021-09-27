import 'fulltime.dart';

class Score {
  Score({
    FullTime? fullTime,
  }) {
    _fullTime = fullTime;
  }

  Score.fromJson(dynamic json) {
    _fullTime =
        json['fullTime'] != null ? FullTime.fromJson(json['fullTime']) : null;
  }
  FullTime? _fullTime;

  FullTime? get fullTime => _fullTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_fullTime != null) {
      map['fullTime'] = _fullTime?.toJson();
    }
    return map;
  }
}
