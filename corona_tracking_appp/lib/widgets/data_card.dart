import 'package:flutter/material.dart';

import '../constants.dart';

class DataCard extends StatelessWidget {
  final String title;
  final String data;
  final Color colour;

  DataCard({
    @required this.title,
    @required this.data,
    @required this.colour,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shadowColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      color: colour,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
        leading: Text(
          title,
          style: kLabelTextStyle,
        ),
        trailing: Text(
          data,
          style: kDataTextSTyle,
        ),
      ),
    );
  }
}
