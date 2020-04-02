import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/resto.dart';
import 'package:delivery_app/services/auth.dart';
import 'package:delivery_app/services/databaseService.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/screens/resto_tile.dart';
import 'package:provider/provider.dart';

class RestoList extends StatefulWidget {

  @override
  _RestoListState createState() => _RestoListState();
}

class _RestoListState extends State<RestoList> {
  @override
  Widget build(BuildContext context) {
    final restos = Provider.of<List<Resto>>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-85,
      child: ListView.builder(
        itemCount: restos.length,
        itemBuilder: (context, index) {
          return RestoTile(resto: restos[index]);
        },
      ),
    );

  }
}

