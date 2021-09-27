/// id : 64
/// name : "Liverpool FC"
/// crestUrl : "https://crests.football-data.org/64.svg"

class Team {
  Team({
    int? id,
    String? name,
    String? crestUrl,
  }) {
    _id = id;
    _name = name;
    _crestUrl = crestUrl;
  }

  Team.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _crestUrl = json['crestUrl'];
  }
  int? _id;
  String? _name;
  String? _crestUrl;

  int? get id => _id;
  String? get name => _name;
  String? get crestUrl => _crestUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['crestUrl'] = _crestUrl;
    return map;
  }
}
