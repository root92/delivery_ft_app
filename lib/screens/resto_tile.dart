import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/screens/resto_details.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/models/resto.dart';

class RestoTile extends StatelessWidget {
  final Resto resto;
  RestoTile({this.resto});

  Future getType() async {
    var typeDocument = await Firestore.instance.collection('type').document(resto.type).get();
    String result = typeDocument.data['name'];
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RestoDetails(resto: resto.name)));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 260,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: Card(
                  elevation: 10,
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  color: Colors.amber,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(image: AssetImage('assets/images/fastfood_1.jpg'), fit: BoxFit.fill,),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Icon(Icons.favorite_border, color: Colors.amber,),
              ),
              Positioned(
                top: 150,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${resto.name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text('${resto.adress}-${resto.city} / ${resto.phone_nbr_1}', style: TextStyle(fontSize: 18), textAlign: TextAlign.left,),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              color: Colors.amber,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text('${resto.type}', style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            )
                        ),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );



  }

}
