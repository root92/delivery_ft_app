import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/resto.dart';
import 'package:delivery_app/models/restoType.dart';
import 'package:delivery_app/screens/restoType/resto_type_list.dart';
import 'package:delivery_app/screens/resto_list.dart';
import 'package:delivery_app/services/auth.dart';
import 'package:delivery_app/services/databaseService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AuthService _authService = AuthService();
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
             StreamProvider<List<RestoType>>.value(
                value: DatabaseService().restoType,
                child: RestoTypeList(),
              ),
              StreamProvider<List<Resto>>.value(
                value: DatabaseService().resto,
                child: RestoList(),
              ),
            ],
          ),
        )
      );
  }
}
