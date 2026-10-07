import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  UserRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Stream<DocumentSnapshot<Map<String, dynamic>>> watchUser(String uid) {
    return _firestore.collection('users').doc(uid).snapshots();
  }

  Future<void> saveUser({
    required String uid,
    required String name,
    required String email,
    String photoUrl = '',
    String phone = '',
    required String provider,
  }) async {
    await _firestore.collection('users').doc(uid).set({
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'phone': phone,
      'provider': provider,
      'createdAt': FieldValue.serverTimestamp(),
      'lastLogin': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<void> updateLastLogin(String uid) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'lastLogin': FieldValue.serverTimestamp(),
      });
    } catch (_) {}
  }
}
