import 'package:flutter/material.dart';

class textPague extends StatelessWidget {
  final String textp;

  const textPague({Key key, this.textp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('$textp');
  }
}
