import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataModel {
  String? userName;
  String? gmailId;
  List? ingredDetails;
  List? shelfValue;

  bool? serviceNoti; 
  bool? marketingNoti;

}