import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const DialogButton({Key key, this.text, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: FlatButton(
          minWidth: 95,
          onPressed: onPressed,
          child: Text(
            '$text',
            style: GoogleFonts.signika(
                color: Colors.purple,
                fontWeight: FontWeight.normal,
                fontSize: 15),
          )),
    );
  }
}
