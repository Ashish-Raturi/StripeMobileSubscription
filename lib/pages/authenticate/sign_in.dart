import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripe_subscription_app/service/auth.dart';
import 'package:stripe_subscription_app/shared/color.dart';
import 'package:stripe_subscription_app/shared/show_loading.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formkey = GlobalKey<FormState>();
  final FocusNode _pwdFocusNode = FocusNode();
  bool _showLoading = false;
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    if (_showLoading) return const Loading();
    return SafeArea(
      child: Scaffold(
          backgroundColor: c2,
          appBar: AppBar(
            backgroundColor: c2,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Sign In',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 30),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Email',
                            fillColor: Colors.white,
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide:
                                    BorderSide(color: Colors.grey[200]!)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide:
                                    BorderSide(color: Colors.grey[200]!)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide:
                                    const BorderSide(color: Colors.white))),
                        validator: (val) {
                          if (val!.isEmpty) return 'Enter a email address';
                          return null;
                        },
                        onChanged: (val) => setState(() => _email = val),
                        onFieldSubmitted: (val) {
                          FocusScope.of(context).requestFocus(_pwdFocusNode);
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        focusNode: _pwdFocusNode,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            fillColor: Colors.white,
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide:
                                    BorderSide(color: Colors.grey[200]!)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide:
                                    BorderSide(color: Colors.grey[200]!)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide:
                                    const BorderSide(color: Colors.white))),
                        validator: (val) => val!.length < 6
                            ? 'Please enter 6+ char password'
                            : null,
                        onChanged: (val) => setState(() => _password = val),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20), color: c1),
                        child: TextButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                print('signin');
                                setState(() => _showLoading = true);
                                signinWithEmailAndPassword(_email, _password);
                                Navigator.pop(context);
                                setState(() => _showLoading = false);
                              }
                            },
                            child: Text('Sign In with Email',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
