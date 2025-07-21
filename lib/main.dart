

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qolber_clean_arc/features/auth/pages/login_page.dart';
import 'package:qolber_clean_arc/injection.dart';
import 'package:qolber_clean_arc/servise_locator.dart';


import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  runApp(Injection( child: MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SignUpPage(),
    );

  }
}
