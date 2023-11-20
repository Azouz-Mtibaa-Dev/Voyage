import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/pages/contact.page.dart';
import 'package:voyage/pages/gallerie.page.dart';
import 'package:voyage/pages/home.page.dart';
import 'package:voyage/pages/inscription.page.dart';
import 'package:voyage/pages/authentification.page.dart';
import 'package:voyage/pages/meteo.page.dart';
import 'package:voyage/pages/parametres.dart';
import 'package:voyage/pages/pays.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = {
    '/home': (context) => HomePage(),
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/contact': (context) => ContactPage(),
    '/gallerie': (context) => GalleriePage(),
    '/meteo': (context) => MeteoPage(),
    '/pays': (context) => PaysPage(),
    '/parametres': (context) => ParametresPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        home: FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                bool conn = snapshot.data?.getBool('connecte') ?? false;
                if (conn) return HomePage();
              }
              return AuthentificationPage();
            }));
  }
}
