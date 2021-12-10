import 'package:flutter/material.dart';
import 'package:stripe_subscription_app/models/app_user_data.dart';
import 'package:stripe_subscription_app/pages/authenticate/welcome_page.dart';
import 'package:stripe_subscription_app/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stripe_subscription_app/service/database/user_database.dart';
import 'package:stripe_subscription_app/shared/show_loading.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, sp) {
        if (sp.data != null) {
          print('user is logged in');

          return StreamBuilder<AppUserData>(
              stream: UserDatabase(uid: sp.data!.uid).getUserData,
              builder: (context, sp2) {
                if (sp2.hasData == false) return Loading();
                AppUserData? appUserData = sp2.data;
                print(appUserData!.name);
                print(appUserData.email);

                return Homepage(appUserData: appUserData);
              });
        } else {
          print('user is not logged in');
          return const WelcomePage();
        }
      },
    );
  }
}
