import 'package:flutter/material.dart';
import 'package:flutter_app_bit/utils/styles.dart';

class DrawerOption extends StatelessWidget {
  final String text;
  final Function ontap;

  const DrawerOption({Key key, this.text, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '> $text',
        style: Styles.drawerOptionStyle,
      ),
      onTap: ontap,
    );
  }
}
