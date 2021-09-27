import 'package:flutter/material.dart';
import 'package:flutter_football_app/data/standings_data.dart';

class StandingsSubScreen extends StatelessWidget {
  const StandingsSubScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: FutureBuilder(
          future: StandingsData.getStandingsData(id),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<TableRow>> snapshot,
          ) {
            if (snapshot.hasData) {
              return Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: snapshot.data ?? [],
                defaultColumnWidth: const IntrinsicColumnWidth(
                  flex: 0.15,
                ),
                border: const TableBorder(
                  horizontalInside: BorderSide(width: 1),
                ),
                columnWidths: const {
                  2: FlexColumnWidth(),
                },
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              throw Error();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
