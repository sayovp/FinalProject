import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bit/view/news_page.dart';

void Initializing() async {
  await Firebase.initializeApp();
}

void stateFirebase(context) {
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      showMaterialDialog(
          context: context, message: 'User is currently signed out!');
    } else {
      showMaterialDialog(context: context, message: 'User is signed in!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new NewsPage();
      }), (Route<dynamic> route) => false);
    }
  });
}

void signIn({@required email, @required password, @required context}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showMaterialDialog(
          context: context, message: 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      showMaterialDialog(
          context: context, message: 'Wrong password provided for that user.');
    }
  }
}

void registerUser(
    {@required String email,
    @required String password,
    @required context}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showMaterialDialog(
          context: context, message: 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      showMaterialDialog(
          context: context,
          message: 'The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

void stateChanges(context) async {
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      showMaterialDialog(
          context: context, message: 'User is currently signed out!');
    } else {
      showMaterialDialog(context: context, message: 'User is signed in!');
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushNamed(context, '/api', arguments: user);
      });
    }
  });
}

void signOut() async {
  await FirebaseAuth.instance.signOut();
}

showMaterialDialog({@required context, @required String message}) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
            title: Text("Warning!"),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('Close me!'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
}
