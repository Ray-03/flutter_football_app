/// id : 2072
/// name : "England"
/// countryCode : "ENG"
/// ensignUrl : "https://crests.football-data.org/770.svg"

class Area {
  Area({
    int? id,
    String? name,
    String? ensignUrl,
  }) {
    _id = id;
    _name = name;
    _ensignUrl = ensignUrl;
  }

  Area.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _ensignUrl = json['ensignUrl'];
  }
  int? _id;
  String? _name;
  String? _ensignUrl;

  int? get id => _id;
  String? get name => _name;
  String? get ensignUrl => _ensignUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['ensignUrl'] = _ensignUrl;
    return map;
  }
}
