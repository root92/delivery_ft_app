import 'package:delivery_app/models/user.dart';
import 'package:delivery_app/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/screens/home_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // TODO: implement build
    if(user == null) {
      return Authenticate();
    } else {
      return MyHomePage();
    }
  }
}