import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
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
                              Text('Heros Coffe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              Text('Almamya-Kaloum-Cky', style: TextStyle(fontSize: 18), textAlign: TextAlign.left,),
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
                                      child: Text('Resto', style: TextStyle(fontWeight: FontWeight.bold),),
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
            RaisedButton(
              onPressed: () async {
                //await _authService.signOut();
                //await _databaseService.getRestoData();
              },
              child: Text("Logout"),
            )
          ],
        ),
      ),
    );

  }
}
