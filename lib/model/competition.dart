import 'area.dart';
import 'current_season.dart';

/// id : 2016
/// area : {
///     "id":2072,
///     "name":"England",
///     "countryCode":"ENG",
///     "ensignUrl":"https://crests.football-data.org/770.svg"
/// }
/// name : "Championship"
/// code : "ELC"
/// emblemUrl : null
/// plan : "TIER_ONE"
/// currentSeason : {
///     "id":735,
///     "startDate":"2021-08-07",
///     "endDate":"2022-05-09",
///     "currentMatchday":9,
///     "winner":null
/// }
/// numberOfAvailableSeasons : 5
/// lastUpdated : "2021-04-17T00:00:18Z"

class Competition {
  Competition({
    int? id,
    Area? area,
    String? name,
    String? code,
    String? emblemUrl,
    String? plan,
    CurrentSeason? currentSeason,
    int? numberOfAvailableSeasons,
    String? lastUpdated,
  }) {
    _id = id;
    _area = area;
    _name = name;
    _code = code;
    _emblemUrl = emblemUrl;
    _plan = plan;
    _currentSeason = currentSeason;
    _numberOfAvailableSeasons = numberOfAvailableSeasons;
    _lastUpdated = lastUpdated;
  }

  Competition.fromJson(dynamic json) {
    _id = json['id'];
    _area = json['area'] != null ? Area.fromJson(json['area']) : null;
    _name = json['name'];
    _code = json['code'];
    _emblemUrl = json['emblemUrl'];
    _plan = json['plan'];
    _currentSeason = json['currentSeason'] != null
        ? CurrentSeason.fromJson(json['currentSeason'])
        : null;
    _numberOfAvailableSeasons = json['numberOfAvailableSeasons'];
    _lastUpdated = json['lastUpdated'];
  }
  int? _id;
  Area? _area;
  String? _name;
  String? _code;
  dynamic _emblemUrl;
  String? _plan;
  CurrentSeason? _currentSeason;
  int? _numberOfAvailableSeasons;
  String? _lastUpdated;

  int? get id => _id;
  Area? get area => _area;
  String? get name => _name;
  String? get code => _code;
  dynamic get emblemUrl => _emblemUrl;
  String? get plan => _plan;
  CurrentSeason? get currentSeason => _currentSeason;
  int? get numberOfAvailableSeasons => _numberOfAvailableSeasons;
  String? get lastUpdated => _lastUpdated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_area != null) {
      map['area'] = _area?.toJson();
    }
    map['name'] = _name;
    map['code'] = _code;
    map['emblemUrl'] = _emblemUrl;
    map['plan'] = _plan;
    if (_currentSeason != null) {
      map['currentSeason'] = _currentSeason?.toJson();
    }
    map['numberOfAvailableSeasons'] = _numberOfAvailableSeasons;
    map['lastUpdated'] = _lastUpdated;
    return map;
  }
}
