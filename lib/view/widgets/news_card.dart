import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bit/model/news.dart';
import 'package:flutter_app_bit/view/news_more_info.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(url) async {
  //const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class NewsCard extends StatelessWidget {
  final News news;
  final Function(News) onTapFav;
  const NewsCard({Key key, @required this.news, this.onTapFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: MediaQuery.of(context).size.height / 1.72,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.black12)
          ]),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: news.urlToImage != null
                        ? NetworkImage(news.urlToImage)
                        : AssetImage('assets/img/fondolog.jpg'))),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title ?? 'Title not find',
                    maxLines: 3,
                    style: GoogleFonts.signika(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    news.author ?? 'Author not find',
                    style: GoogleFonts.signika(
                        fontSize: 14,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    news.description ?? 'Description not find',
                    maxLines: 3,
                    style: GoogleFonts.signika(
                        fontSize: 12,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 13, left: 13),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.favorite_border_outlined),
                      onPressed: () {
                        onTapFav(news);
                      }),
                  IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        Share.share(news.url);
                      }),
                  InkWell(
                    onTap: () {
                      child:
                      if (news.content == null) {
                        //print(news.url);
                        _launchURL(news.url);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsMoreInfo(
                                    news: news,
                                  )),
                        );
                      }
                    },
                    child: Text(
                      'MORE>',
                      style: GoogleFonts.signika(
                          fontSize: 14,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
