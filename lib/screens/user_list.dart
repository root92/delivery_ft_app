import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class UserProfileList extends StatefulWidget {

  @override
  _UserProfileList createState() => _UserProfileList();
}

class _UserProfileList extends State<UserProfileList> {

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<QuerySnapshot>(context);
    for(var doc in userProfile.documents) {
      print(doc.data);
    }
    // TODO: implement build
    return null;
  }
}

