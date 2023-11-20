import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';

class ParametresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Parametres'),

      ),
      body: Center(
        child: Text(
          'Page Parametres',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}

