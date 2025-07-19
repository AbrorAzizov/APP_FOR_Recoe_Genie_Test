

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qolber_clean_arc/servise_locator.dart';

import 'injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServiceLocator();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Injection();
  }
}
