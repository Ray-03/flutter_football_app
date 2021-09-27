import 'package:flutter/material.dart';
import 'package:flutter_football_app/data/competitions_data.dart';
import 'package:flutter_football_app/model/competition.dart';
import 'package:flutter_football_app/view/competition_details_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvailableCompetitionsGrid extends StatelessWidget {
  const AvailableCompetitionsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CompetitionData.getCompetitionData(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Competition>> snapshot,
      ) {
        if (snapshot.hasData) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemBuilder: (BuildContext context, int index) {
              Competition item = snapshot.data!.elementAt(index);
              return InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  CompetitionDetailsScreen.id,
                  arguments: item,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (item.area!.ensignUrl != null)
                      Expanded(
                        child: SvgPicture.network(
                          item.area!.ensignUrl!,
                          semanticsLabel: 'Flag',
                          fit: BoxFit.fitHeight,
                          placeholderBuilder: (BuildContext context) =>
                              const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                    else
                      Image.network(
                        'https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png',
                      ), // show image not found if ensignUrl null
                    Text(item.name ?? '-'),
                    Text(item.area!.name ?? '-'),
                  ],
                ),
              );
            },
            itemCount: snapshot.data!.length,
          );
        } else if (snapshot.hasError) {
          throw Error();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
