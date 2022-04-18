import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  String? userName;
  String? gmailId;
  late Map<String,List> ingredients;
  List? ingredDetails;
  List? shelfValue;

  bool? serviceNoti; 
  bool? marketingNoti;

}