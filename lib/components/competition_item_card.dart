import 'package:flutter/material.dart';
import 'package:flutter_football_app/model/competition.dart';
import 'package:flutter_football_app/style/font.dart';
import 'package:flutter_football_app/view/competition_details_screen.dart';

import 'competition_item_card_country_flag.dart';

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
        color: Colors.lightGreen.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //flag
            CompetitionItemCardCountryFlag(itemData: itemData),
            //competition name
            Text(
              itemData.name ?? '-',
              textAlign: TextAlign.center,
              style: kHeader1Font,
            ),
            const Divider(
              endIndent: 10,
              indent: 10,
            ),
            //country
            Text(
              itemData.area!.name ?? '-',
              textAlign: TextAlign.center,
              style: kHeader2Font,
            ),
          ],
        ),
      ),
    );
  }
}
