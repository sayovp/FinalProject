import 'package:flutter/material.dart';
import 'package:flutter_app_bit/model/news.dart';
import 'package:flutter_app_bit/view/widgets/news_card.dart';

class buildItemList extends StatelessWidget {
  final News snapshotData;
  final Function(News) onTapFav;

  buildItemList({Key key, @required this.snapshotData, this.onTapFav});

  @override
  Widget build(BuildContext context) {
    return NewsCard(
      news: snapshotData,
      onTapFav: onTapFav,
    );
  }
}
