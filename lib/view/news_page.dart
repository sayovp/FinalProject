import 'package:flutter/material.dart';
import 'package:flutter_app_bit/presenter/build_view.dart';
import 'package:flutter_app_bit/utils/firebaseController.dart'
    as firebaseController;
import 'package:flutter_app_bit/view/widgets/drawer_option.dart';

import 'login_page.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int NewsInt = 1;

  String viewName = 'NewList';
  static const DrawerOptions = <Map<String, dynamic>>[
    {
      'value': 1,
      'text': '> Top headlines from Colombia',
    },
    {
      'value': 2,
      'text': '> Top business headlines in the US right now',
    },
    {
      'value': 3,
      'text':
          '> All articles mentioning Apple from yesterday, sorted by popular publishers first',
    },
    {
      'value': 4,
      'text': '> Top headlines from TechCrunch right now',
    },
    {
      'value': 5,
      'text':
          '> All articles published by the Wall Street Journal in the last 6 months, sorted by recent first',
    },
    {
      'value': 6,
      'text':
          '> All articles about Tesla from the last month, sorted by recent first',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'BIT News',
          style: TextStyle(color: Colors.black26),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.favorite),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(children: [
          DrawerHeader(
              child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            child: Image.network(
                'https://bit.institute/images/Instituto-Cursos-Programacion.png'),
          )),
          ...DrawerOptions.map(
            (option) => DrawerOption(
                text: option['text'],
                ontap: () {
                  setState(() {
                    NewsInt = option['value'];
                    Navigator.pop(context);
                  });
                }),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Setting',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text('Sign Out'),
            onTap: () {
              firebaseController.signOut();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return new LoginPage();
              }), (Route<dynamic> route) => false);
            },
          ),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: BuildVieW(
          viewName: viewName,
          intNews: NewsInt,
        ),
        /*child: ListView(
          children: NewsRepository()
              .NEWS
              .map((news) => NewsCard(
                    news: news,
                  ))
              .toList(),
        ),*/
      ),
    );
  }
}
