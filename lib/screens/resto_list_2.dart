import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RestoList extends StatefulWidget {

  @override
  _RestoListState createState() => _RestoListState();
}


Future getData() async {
  var resto = await Firestore.instance.collection('resto').snapshots();
  print('Test ok');
  print(resto);
  //var restoType = await Firestore.instance.collection('type').document('type'),

}


class _RestoListState extends State<RestoList> {
  String restoType = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-85,
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('resto').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return new Text('Loading...');
            default:
              return new ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  /*Future getData() async {
                    String data = await Firestore.instance.collection('type').document(document['type']).get().then((doc) {
                      restoType = doc.data['name'];
                      return restoType;
                    });
                    print(data);
                    return data;
                  }
                  getData();*/

                  return new ListTile(
                    title: new Text(document['name']),
                    subtitle: new Text(''),
                  );
                }).toList(),
              );
          }
        },
      ),
    );

  }
}
