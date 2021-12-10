import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stripe_subscription_app/models/app_user_data.dart';

class UserDatabase {
  String uid;
  UserDatabase({required this.uid});

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  saveUserData(String email, String name) async {
    await firestore
        .collection('Users')
        .doc(uid)
        .set({'email': email, 'name': name});
  }

  Stream<AppUserData> get getUserData {
    return firestore
        .collection('Users')
        .doc(uid)
        .snapshots()
        .map(snapshotToUserData);
    // .map((DocumentSnapshot ds) => snapshotToUserData(ds));
  }

  AppUserData snapshotToUserData(DocumentSnapshot ds) {
    return AppUserData(email: ds.get('email'), name: ds.get('name'), uid: uid);
  }
}
