import 'package:flutter/material.dart';
import 'package:flutter_app_bit/utils/firebaseController.dart'
    as firebaseController;
import 'package:flutter_app_bit/view/login_page.dart';
import 'package:flutter_app_bit/view/news_page.dart';
import 'package:flutter_app_bit/view/register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  firebaseController.Initializing();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => new LoginPage());
          case '/register':
            return MaterialPageRoute(builder: (context) => new RegisterUser());
          case '/newsPage':
            return MaterialPageRoute(builder: (context) => new NewsPage());
          default:
            return null;
        }
      },
    );
  }
}
