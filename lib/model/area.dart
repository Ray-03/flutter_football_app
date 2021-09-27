/// id : 2072
/// name : "England"
/// countryCode : "ENG"
/// ensignUrl : "https://crests.football-data.org/770.svg"

class Area {
  Area({
    int? id,
    String? name,
    String? countryCode,
    String? ensignUrl,
  }) {
    _id = id;
    _name = name;
    _countryCode = countryCode;
    _ensignUrl = ensignUrl;
  }

  Area.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _countryCode = json['countryCode'];
    _ensignUrl = json['ensignUrl'];
  }
  int? _id;
  String? _name;
  String? _countryCode;
  String? _ensignUrl;

  int? get id => _id;
  String? get name => _name;
  String? get countryCode => _countryCode;
  String? get ensignUrl => _ensignUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['countryCode'] = _countryCode;
    map['ensignUrl'] = _ensignUrl;
    return map;
  }
}
