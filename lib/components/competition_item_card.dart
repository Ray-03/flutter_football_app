import 'package:flutter/material.dart';
import 'package:flutter_football_app/model/competition.dart';
import 'package:flutter_football_app/view/competition_details_screen.dart';
import 'package:flutter_svg/svg.dart';

class CompetitionsItemCard extends StatelessWidget {
  const CompetitionsItemCard({
    Key? key,
    required this.itemData,
  }) : super(key: key);

  final Competition itemData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        CompetitionDetailsScreen.id,
        arguments: itemData,
      ),
      child: Card(
        elevation: 4,
        shadowColor: Colors.green,
        color: Colors.lightGreen.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: itemData.area!.ensignUrl != null
                    ? SvgPicture.network(
                        itemData.area!.ensignUrl!,
                        semanticsLabel: 'Flag',
                        fit: BoxFit.fitHeight,
                        placeholderBuilder: (BuildContext context) =>
                            const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Image.network(
                        'https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png',
                        fit: BoxFit.fitHeight,
                      ), // show image not found if ensignUrl null,
              ),
            ),
            Text(
              itemData.name ?? '-',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Divider(
              endIndent: 10,
              indent: 10,
            ),
            Text(
              itemData.area!.name ?? '-',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
