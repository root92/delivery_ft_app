import 'package:delivery_app/screens/wrapper.dart';
import 'package:delivery_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/screens/authenticate/signin_page.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Wrapper(),
      ),
    );
  }
}
