import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {

  final String text;
  final lead;
  final trailing;

  const CardDetail({this.text, this.lead, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 15.0, right: 30.0),
        leading: lead,
        title: Text('$text'),
        trailing: trailing,
      ),
    );
  }
}