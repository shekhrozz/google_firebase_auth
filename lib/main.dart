import 'package:flutter/material.dart';
import 'package:google_firebase_auth/pages/auth/sign_in/sign_in.dart';
import 'package:google_firebase_auth/services/app_setup.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async{
  await Appsetup.setup;
  runApp(const MyApp());
}
GoogleSignIn? googleSignIn = GoogleSignIn(
    clientId:
        "854756996047-be6sfv309384579og0m405ro93o7cri9.apps.googleusercontent.com",
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(     
        primarySwatch: Colors.blue,
      ),
      home: const SignInView(),
    );
  }
}
