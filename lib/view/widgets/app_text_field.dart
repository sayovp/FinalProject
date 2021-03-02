import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final bool obscureText;
  final TextEditingController nombreVarible;

  const AppTextField({
    Key key,
    this.hintText,
    this.icon,
    this.obscureText = false,
    this.nombreVarible,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(90)),
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5)
        ],
      ),
      child: TextField(
        controller: nombreVarible,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: GoogleFonts.signika(
              fontSize: 18,
              color: Colors.black45,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
