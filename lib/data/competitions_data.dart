import 'dart:convert';
import 'package:flutter_football_app/const.dart';
import 'package:flutter_football_app/model/competition.dart';
import 'package:http/http.dart' as http;

/// [CompetitionData] class helps get available competitions in several
/// countries with specific areas and plan
/// areas=[kCompetitionAreas]
/// plan=[kCompetitionPlan]

class CompetitionData {
  static Future<List<Competition>> getCompetitionData() async {
    http.Response _response = await http.get(
      Uri.parse(
        kBackendMainUrl +
            'competitions?areas=$kCompetitionAreas&plan=$kCompetitionPlan',
      ),
      headers: {
        'X-Auth-Token': kXAuthToken,
      },
    );
    if (_response.statusCode == 200) {
      final json = jsonDecode(_response.body);
      List<Competition> _data = [];
      json['competitions'].forEach(
        (v) => _data.add(
          Competition.fromJson(v),
        ),
      );
      return _data;
    } else {
      //TODO: Show something
      print(_response.statusCode);
      throw Error();
    }
  }
}
