import 'package:delivery_app/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget{
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = new AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error ='';
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {widget.toggleView();}, icon: Icon(Icons.account_circle), label: Text('Sign In'),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.amber
                ),
              ),
            ),
            Flexible(
              flex: 2,
              //top: (MediaQuery.of(context).size.height - 350),
              child: Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    color: Colors.white
                ),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                  ),
                  margin: EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Form(
                          key: _formKey,
                            child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    validator: (val) => val.isEmpty ? 'Veuillez saisir un email' : null,
                                    onChanged: (val) {
                                      setState(() {
                                        email = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      //border: InputBorder(borderSide: BorderSide.)
                                    ),
                                  ),
                                  TextFormField(
                                    validator: (val) => val.length < 6 ? 'Votre mot de passe doit avoir au minimum 6 caracteres' : null,
                                    obscureText: true,
                                    onChanged: (val) {
                                      setState(() {
                                        password = val;
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: RaisedButton(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(30))
                                        ),
                                        onPressed: () async {
                                          if(_formKey.currentState.validate()){
                                            dynamic result = await _authService.registerWithEmailAndPassword(email, password);
                                            if(result == null) {
                                              setState(() {
                                                error = 'Email non valide';
                                              });
                                            }
                                          }
                                        },
                                        child: Text("Inscription", style: TextStyle()
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(error, style: TextStyle(color: Colors.red),)
                                ]

                            )
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: SizedBox(
                              width: (MediaQuery.of(context).size.width-60)/2,
                              height: 50,
                              child: RaisedButton(
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                  ),
                                  onPressed: () async {
                                    dynamic result = await _authService.signInAnon();
                                    if(result == null) {
                                      print('Erroor sigin in');
                                    }else{
                                      print('Signed in');
                                      print(result.uid);
                                    }
                                  },
                                  child: Text("Facebook", style: TextStyle(color: Colors.white),)
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: SizedBox(
                              width: (MediaQuery.of(context).size.width-60)/2,
                              height: 50,
                              child: RaisedButton(
                                  color: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                  ),
                                  onPressed: () {},
                                  child: Text("Google", style: TextStyle(color: Colors.white),)
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
  
}