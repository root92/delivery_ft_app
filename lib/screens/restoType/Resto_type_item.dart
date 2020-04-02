import 'package:flutter/material.dart';
import 'package:delivery_app/models/restoType.dart';

class RestoTypeItem extends StatelessWidget {
  final RestoType restoType;
  RestoTypeItem({this.restoType});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text('${restoType.name}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          ),
        )
    );

  }
}
