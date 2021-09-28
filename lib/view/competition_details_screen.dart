import 'package:flutter/material.dart';
import 'package:flutter_football_app/components/matches_sub_screen.dart';
import 'package:flutter_football_app/components/standings_sub_screen.dart';
import 'package:flutter_football_app/model/competition.dart';

class CompetitionDetailsScreen extends StatelessWidget {
  static String id = 'competition_details_screen';
  const CompetitionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Competition competition =
        ModalRoute.of(context)!.settings.arguments as Competition;
    return SafeArea(
      child: DefaultTabController(
        child: Scaffold(
          appBar: AppBar(
            title: Text(competition.name ?? "-"),
            bottom: const TabBar(
              indicatorColor: Colors.green,
              tabs: [
                Tab(
                  text: 'STANDINGS',
                ),
                Tab(
                  text: 'MATCHES',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              StandingsSubScreen(
                id: competition.id!,
              ),
              MatchesSubScreen(
                id: competition.id!,
              ),
            ],
          ),
        ),
        length: 2,
      ),
    );
  }
}
