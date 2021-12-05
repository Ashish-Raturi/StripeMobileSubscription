import 'package:flutter/material.dart';
import 'package:stripe_subscription_app/shared/color.dart';
import 'package:stripe_subscription_app/shared/show_loading.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  late String _email, _fullName, _password, _reEnterPassword;
  final FocusNode _emailFN = FocusNode(),
      _passwordFN = FocusNode(),
      _reEnterPasswordFN = FocusNode();
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    if (showLoading) return const Loading();
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
                      const Text('Sign Up',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 30),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: 'Username',
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
                        validator: (val) =>
                            val!.isEmpty ? 'Please enter your full name' : null,
                        onChanged: (val) => setState(() => _fullName = val),
                        onFieldSubmitted: (val) {
                          FocusScope.of(context).requestFocus(_emailFN);
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        focusNode: _emailFN,
                        decoration: InputDecoration(
                            hintText: 'Email Id',
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
                          FocusScope.of(context).requestFocus(_passwordFN);
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        focusNode: _passwordFN,
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
                        onFieldSubmitted: (val) {
                          FocusScope.of(context)
                              .requestFocus(_reEnterPasswordFN);
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        focusNode: _reEnterPasswordFN,
                        decoration: InputDecoration(
                            hintText: 'Re-enter Password',
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
                        onChanged: (val) =>
                            setState(() => _reEnterPassword = val),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20), color: c1),
                        child: TextButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                print('sign up');
                              }
                            },
                            child: const Text('Sign Up with Email',
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
