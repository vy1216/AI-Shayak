
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(String userId, Map<String, dynamic> data) {
    return _db.collection('users').doc(userId).set(data);
  }

  Future<void> addSymptom(String userId, Map<String, dynamic> data) {
    return _db.collection('users').doc(userId).collection('symptoms').add(data);
  }

  Stream<QuerySnapshot> getSymptoms(String userId) {
    return _db.collection('users').doc(userId).collection('symptoms').snapshots();
  }
}
