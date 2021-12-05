import 'package:flutter/material.dart';
import 'package:stripe_subscription_app/pages/authenticate/welcome_page.dart';
import 'package:stripe_subscription_app/pages/home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  final bool userLogedIn = true;

  @override
  Widget build(BuildContext context) {
    if (userLogedIn) {
      return const Homepage();
    } else {
      return const WelcomePage();
    }
  }
}
