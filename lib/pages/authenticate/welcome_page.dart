import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stripe_subscription_app/pages/authenticate/sign_in.dart';
import 'package:stripe_subscription_app/pages/authenticate/sign_up.dart';
import 'package:stripe_subscription_app/shared/color.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c2,
      body: Column(
        children: [
          Image.asset('assets/welcome.gif'),
          const SizedBox(height: 30),
          const Text(
            'Flutter Subscription App',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'A Stripe Subscription Demo',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 100),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: c1,
              ),
              child: const Text(
                'Signup with email',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
                text: 'Already joined? ',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: 'Sign In',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
