import 'dart:convert';

import 'package:flutter_football_app/model/matches.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_football_app/const.dart';

class MatchesData {
  static Future getMatchesData(int id) async {
    DateTime dateNow = DateTime.now().toUtc();
    String dateFrom = dateNow
        .subtract(
          const Duration(days: 14),
        )
        .toString();
    String dateTo = dateNow
        .add(
          const Duration(days: 14),
        )
        .toString();
    http.Response _response = await http.get(
      Uri.parse(kBackendMainUrl +
          '/' +
          id.toString() +
          '/matches?dateFrom=${dateFrom.substring(
            0,
            dateFrom.indexOf(' '),
          )}&dateTo=${dateTo.substring(
            0,
            dateTo.indexOf(' '),
          )}'),
      headers: {
        'X-Auth-Token': kXAuthToken,
      },
    );
    Map<String, List<Matches>> _groupedData = {};
    if (_response.statusCode == 200) {
      final json = jsonDecode(_response.body);
      json['matches'].forEach(
        (v) {
          Matches _data = Matches.fromJson(v);
          String _date = _data.utcDate.toString();
          return _groupedData.update(
            _date.substring(
              0,
              _date.indexOf(' '),
            ),
            (list) => list..add(_data),
            ifAbsent: () => [_data],
          );
        },
      );
      return _groupedData;
    }
  }
}
