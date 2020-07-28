import 'package:flutter/material.dart';

class CountryButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  CountryButton({this.onPressed, this.text});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 160.0,
      buttonColor: Color(0xFF6f4a8e),
      focusColor: Colors.red,
      highlightColor: Colors.yellow,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xFFffdbc5),
              fontSize: 20.0,
              fontFamily: 'Rowdies',
            ),
          ),
        ),
      ),
    );
  }
}
