import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_contacts/firebase_options.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_contacts/models/contact_provider.dart';
import 'package:my_contacts/views/home.dart';
import 'package:provider/provider.dart';

void main() async {
  //initialize
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() => print("INIT RUN")).catchError((e) => print("Error:$e"));

  runApp(ChangeNotifierProvider(
      create: (context) => ContactModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}
