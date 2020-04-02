import 'package:flutter/material.dart';


class RestoDetails extends StatefulWidget {
  final String resto;

  RestoDetails({Key key, @required this.resto}) : super(key: key);

  @override
  _RestoDetailsState createState() => _RestoDetailsState();
}

class _RestoDetailsState extends State<RestoDetails> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Text('Tes ok'),
    );
  }

}