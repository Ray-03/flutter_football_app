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
  }) {
    _id = id;
    _area = area;
    _name = name;
  }

  Competition.fromJson(dynamic json) {
    _id = json['id'];
    _area = json['area'] != null ? Area.fromJson(json['area']) : null;
    _name = json['name'];
  }
  int? _id;
  Area? _area;
  String? _name;

  int? get id => _id;
  Area? get area => _area;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_area != null) {
      map['area'] = _area?.toJson();
    }
    map['name'] = _name;
    return map;
  }
}
