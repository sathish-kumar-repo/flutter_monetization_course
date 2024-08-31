import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_monetization_course/model/account.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'services/ad_mob_service.dart';
import 'services/auth_service.dart';
import 'views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await AuthService().getOrCreateUser();

  // Its not required
  // if (defaultTargetPlatform == TargetPlatform.android) {
  //   InAppPurchaseAndroidPlatformAddition.enablePendingPurchases();
  // }

  final initAdFuture = MobileAds.instance.initialize();
  final adMobService = AdMobService(initAdFuture);

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: AuthService()),
        Provider.value(value: adMobService),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Decider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: false,
      ),
      home: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(context.read<AuthService>().currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Account account = Account.fromSnapshot(
              snapshot.data,
              context.read<AuthService>().currentUser?.uid,
            );
            return HomeView(account: account);
          }
          return Container(color: Colors.white);
        },
      ),
    );
  }
}
/*
decisions_yt_5
decisions_yt_50
decisions_yt_500
premium_yt
unlimited_yt_monthly
unlimited_yt_yearly

5 decisions
Get 5 decisions to use anytime

 */