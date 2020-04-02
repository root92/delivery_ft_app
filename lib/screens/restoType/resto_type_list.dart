import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/restoType.dart';
import 'package:delivery_app/screens/restoType/Resto_type_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestoTypeList extends StatefulWidget {

  @override
  _RestoTypeListState createState() => _RestoTypeListState();
}

class _RestoTypeListState extends State<RestoTypeList> {
  double paddinTop = 50.0;
  @override
  Widget build(BuildContext context) {
    final restoTypes = Provider.of<List<RestoType>>(context);
    return Container(
      padding: EdgeInsets.only(top: paddinTop),
      width: MediaQuery.of(context).size.width,
      height: 60 + (paddinTop/2),
      child: ListView.builder(
        itemCount: restoTypes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return RestoTypeItem(restoType: restoTypes[index]);
        },

      ),
    );
  }
}
