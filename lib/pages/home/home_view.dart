import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_firebase_auth/main.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_firebase_auth/pages/auth/sign_in/sign_in.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key,required this.userCredential});

  final UserCredential userCredential;
  void logout(BuildContext context)async{
    try {
      await googleSignIn!.signOut();
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder:(context) => const SignInView(),),
         (route) => false);
    } catch (e) {
      log(e.toString());
    }
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home Page'),
        actions: [
          IconButton(
            onPressed:() => logout(context),
             icon:Icon(Icons.logout))
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Image.network(
              userCredential.user!.photoURL??
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80'
           ,height: 60,
           width: 60,
            ),

            Text(userCredential.user!.displayName??"user")
          ],
        ),
      ),
    ); 
  }
}