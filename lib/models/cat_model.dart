import 'package:cloud_firestore/cloud_firestore.dart';

class CatModel {
  String? catId;
  late String name;
  late String description;
  late String catImageLink;
  late Timestamp createdOn;
  late bool isFeature;
  CatModel({
    required this.name,
    required this.description,
    required this.isFeature,
    required this.catId,
    required this.catImageLink,
  });

  CatModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    catId = documentSnapshot["catId"];
    name = documentSnapshot["name"];
    description = documentSnapshot["description"];
    createdOn = documentSnapshot["createdOn"];
    isFeature = documentSnapshot["isFeature"];
    catImageLink = documentSnapshot["catImageLink"];
  }
}
