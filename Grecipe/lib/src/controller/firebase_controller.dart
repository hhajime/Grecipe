import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCloudFireStoreController extends GetxController {
  final userCollectionReference = FirebaseFirestore.instance
      .collection("COOKRCP")
      .doc("j6QXko9oShfPpFpqIWdB");

  void createData() {
    userCollectionReference.set({});
  }

  void readData() {
    userCollectionReference.get().then((value) {
      print(value.data());
    });
  }
}
