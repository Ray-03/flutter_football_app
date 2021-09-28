import 'package:flutter/material.dart';
import 'package:flutter_football_app/model/competition.dart';
import 'package:flutter_svg/svg.dart';

class CompetitionItemCardCountryFlag extends StatelessWidget {
  const CompetitionItemCardCountryFlag({
    Key? key,
    required this.itemData,
  }) : super(key: key);

  final Competition itemData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: itemData.area!.ensignUrl != null
            ? SvgPicture.network(
                itemData.area!.ensignUrl!,
                semanticsLabel: 'Flag',
                fit: BoxFit.cover,
                placeholderBuilder: (BuildContext context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Image.network(
                'https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png',
                fit: BoxFit.cover,
              ), // show image not found if ensignUrl null,
      ),
    );
  }
}
