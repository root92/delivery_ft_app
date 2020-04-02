import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/resto.dart';
import 'package:delivery_app/models/restoType.dart';


class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference userProfileCollection = Firestore.instance.collection('userProfile');
  final CollectionReference restoCollection = Firestore.instance.collection('resto');
  final CollectionReference typeCollection = Firestore.instance.collection('type');

  Future updateUserData(String first_name, String last_name) async {
    return await userProfileCollection.document(uid).setData({
      'first_name': first_name,
      'last_name': last_name,
    });
  }

  Future updateRestoData(String first_name, String last_name) async {
    return await userProfileCollection.document().setData({
      'first_name': first_name,
      'last_name': last_name,
    });
  }

  List<Resto> _restoList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Resto(
        name: doc.data['name'] ?? '',
        description: doc.data['name'] ?? '',
        adress: doc.data['adress'] ?? '',
        phone_nbr_1: doc.data['phone_nbr_1'] ?? '',
        phone_nbr_2: doc.data['phone_nbr_2'] ?? '',
        city: doc.data['city'] ?? '',
        country: doc.data['country'] ?? '',
        type: doc.data['type'] ?? ''
      );
    }).toList();

  }

  //map RestoType to model
  List<RestoType> _restoTypeList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return RestoType(
          name: doc.data['name'] ?? '',
          description: doc.data['name'] ?? ''
      );
    }).toList();
  }

  //Get RestoType List
  Stream<List<RestoType>> get restoType {
    return typeCollection.snapshots()
        .map(_restoTypeList);
  }

  //Get Resto List
  Stream<List<Resto>> get resto {
    return restoCollection.snapshots()
      .map(_restoList);
  }
}