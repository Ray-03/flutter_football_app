import 'package:flutter/material.dart';

class MatchesSubScreen extends StatelessWidget {
  const MatchesSubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('date YYYY-MM-DD'),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 16 / 9,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.amber,
                    );
                  },
                  itemCount: 3,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
