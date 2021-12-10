import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripe_subscription_app/models/app_user_data.dart';
import 'package:stripe_subscription_app/shared/color.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Homepage extends StatefulWidget {
  final AppUserData appUserData;
  const Homepage({Key? key, required this.appUserData}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Hi, ${widget.appUserData.name}',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const Expanded(
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            //log out
                            FirebaseAuth.instance.signOut();
                          },
                          icon: const Icon(Icons.exit_to_app)),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // activeSubscriptionFree(),
                  activeSubscriptionPlan('Pro Plan'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Upgrade plan to',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const Text('Highly Experience.',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  starterPlan(),
                  const SizedBox(
                    height: 20,
                  ),
                  proPlan(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  proPlan() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: c1,
        ),
        width: MediaQuery.of(context).size.width - 40,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14)),
                  color: c4,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.star_border, color: Colors.white),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Recommanded', style: TextStyle(color: Colors.white))
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Pro Plan',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      const SizedBox(
                        height: 5,
                      ),
                      RichText(
                          text: const TextSpan(
                              text: '\$',
                              children: [
                                TextSpan(
                                    text: '134',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white)),
                                TextSpan(
                                    text: '/year',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey))
                              ],
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('Perfect for save 10%',
                          style: TextStyle(color: c4, fontSize: 16)),
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(
                      width: 5,
                    ),
                  ),
                  Image.asset('assets/sub2.png', width: 100),
                  const SizedBox(
                    width: 25,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: c3,
                ),
                width: 200,
                alignment: Alignment.center,
                child: const Text(
                  'Select Plan',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  starterPlan() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: c1,
        ),
        width: MediaQuery.of(context).size.width - 40,
        // height: 50,
        padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Starter Plan',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                        text: const TextSpan(
                            text: '\$',
                            children: [
                              TextSpan(
                                  text: '80',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white)),
                              TextSpan(
                                  text: '/month',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey))
                            ],
                            style:
                                TextStyle(fontSize: 16, color: Colors.white))),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Perfect for starters',
                        style: TextStyle(color: c4, fontSize: 16)),
                  ],
                ),
                Image.asset('assets/sub1.png', width: 130)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: c3,
                ),
                width: 200,
                alignment: Alignment.center,
                child: const Text(
                  'Select Plan',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ));
  }

  activeSubscriptionFree() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: c2,
      ),
      width: MediaQuery.of(context).size.width - 40,
      // height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Active Subscription', style: TextStyle(fontSize: 14)),
          SizedBox(
            height: 10,
          ),
          Text('Free Plan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  activeSubscriptionPlan(String planId) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: c2,
      ),
      width: MediaQuery.of(context).size.width - 40,
      // height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Active Subscription', style: TextStyle(fontSize: 14)),
          const SizedBox(
            height: 10,
          ),
          Text(planId,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: c3,
                ),
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Settings',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.settings,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
