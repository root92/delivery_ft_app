import 'package:delivery_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SigninPage extends StatefulWidget {
  //SigninPage({Key key, this.title}) : super(key: key);
  final Function toggleView;
  SigninPage({this.toggleView});
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final AuthService _authService = new AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
          elevation: 0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {widget.toggleView();}, icon: Icon(Icons.account_circle), label: Text('Sign Up'),
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
                                      dynamic result = await _authService.signInWithEmailAndPassword(email, password);
                                      if(result == null) {
                                        setState(() {
                                          error = 'Email et/ ou mot de pass non valide';
                                        });
                                      }
                                    }
                                  },
                                  child: Text("Sign In", style: TextStyle()
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
