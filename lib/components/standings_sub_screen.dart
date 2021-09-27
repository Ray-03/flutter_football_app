import 'package:flutter/material.dart';

class StandingsSubScreen extends StatelessWidget {
  const StandingsSubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
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
            TableRow(
              children: [
                Text('1.'),
                FlutterLogo(),
                Text('Club Name'),
                Text('Pt'),
                Text('P'),
                Text('W'),
                Text('D'),
                Text('L'),
                Text('GF'),
                Text('GA'),
              ],
            ),
            TableRow(
              children: [
                Text('2.'),
                FlutterLogo(),
                Text('Club Name'),
                Text('Pt'),
                Text('P'),
                Text('W'),
                Text('D'),
                Text('L'),
                Text('GF'),
                Text('GA'),
              ],
            ),
          ],
          defaultColumnWidth: const IntrinsicColumnWidth(
            flex: 0.15,
          ),
          border: TableBorder(
            horizontalInside: BorderSide(width: 1),
          ),
          columnWidths: const {
            2: FlexColumnWidth(),
          },
        ),
      ),
    );
  }
}
