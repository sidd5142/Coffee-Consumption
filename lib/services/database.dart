
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid});
  // collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('consumptions');

  Future updateUserData(String sugars, String name, String strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name' : name,
      'strength': strength,
    });
  }
}