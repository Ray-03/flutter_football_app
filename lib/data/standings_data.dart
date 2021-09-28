import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_football_app/const.dart';
import 'package:flutter_football_app/model/table.dart' as table;
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class StandingsData {
  static Future<List<TableRow>> getStandingsData(int id) async {
    http.Response _response = await http.get(
      Uri.parse(
        kBackendMainUrl + '/' + id.toString() + '/standings',
      ),
      headers: {
        'X-Auth-Token': kXAuthToken,
      },
    );
    if (_response.statusCode == 200) {
      final json = jsonDecode(_response.body);
      List<TableRow> tableData = [
        const TableRow(
          children: [
            SizedBox(),
            SizedBox(),
            SizedBox(),
            Text('Pt'),
            Text('P'),
            Text('W'),
            Text('D'),
            Text('L'),
            Text('GF'),
            Text('GA'),
          ],
        ),
      ];
      List<table.Table> _data = [];
      json['standings'][0]['table'].forEach(
        (v) => _data.add(
          table.Table.fromJson(v),
        ),
      );
      for (var element in _data) {
        tableData.add(
          TableRow(
            children: [
              Text(tableData.length.toString()),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: element.team!.crestUrl != null
                    ? SvgPicture.network(
                        element.team!.crestUrl!,
                        fit: BoxFit.fitHeight,
                        width: 30,
                        height: 30,
                        semanticsLabel: 'team_logo',
                        placeholderBuilder: (BuildContext context) =>
                            const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Image.network(
                        'https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png',
                        width: 30,
                      ),
              ),
              Text(element.team!.name ?? '-'),
              Text(element.points!.toString()),
              Text(element.playedGames!.toString()),
              Text(element.won!.toString()),
              Text(element.draw!.toString()),
              Text(element.lost!.toString()),
              Text(element.goalsFor!.toString()),
              Text(element.goalsAgainst!.toString()),
            ],
          ),
        );
      }
      return tableData;
    } else {
      //TODO: Show something
      print(_response.statusCode);
      throw Error();
    }
  }
}
