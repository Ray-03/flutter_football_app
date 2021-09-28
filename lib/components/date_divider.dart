import 'package:flutter/material.dart';

class DateDivider extends StatelessWidget {
  const DateDivider({Key? key, required this.date}) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            endIndent: 20,
          ),
        ),
        Text(date),
        const Expanded(
          child: Divider(
            indent: 20,
          ),
        )
      ],
    );
  }
}
