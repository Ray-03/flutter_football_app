import 'package:flutter/material.dart';

class CompetitionDetailsScreen extends StatelessWidget {
  static String id = 'competition_details_screen';
  const CompetitionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        child: Scaffold(
          appBar: AppBar(
            title: Text('text'),
            bottom: const TabBar(
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
              //TODO: add standings sub screen,
              //TODO: add matches sub screen,
            ],
          ),
        ),
        length: 2,
      ),
    );
  }
}
