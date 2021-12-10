import 'package:firebase_auth/firebase_auth.dart';
import 'package:stripe_subscription_app/service/database/user_database.dart';

signupWithEmailAndPassword(String email, String password, String name) async {
  try {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    User? user = credential.user;
    //adding user data in db
    UserDatabase(uid: user!.uid).saveUserData(email, name);

    print(user.email);
    print(user.uid);
  } catch (e) {
    print('Signup Error');
    print(e.toString());
  }
}

signinWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    User? user = credential.user;

    print(user!.email);
    print(user.uid);
  } catch (e) {
    print('Signin Error');
    print(e.toString());
  }
}
