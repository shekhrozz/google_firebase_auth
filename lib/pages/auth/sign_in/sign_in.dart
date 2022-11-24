import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_firebase_auth/main.dart';
import 'package:google_firebase_auth/pages/auth/sign_up/sign_up_view.dart';
import 'package:google_firebase_auth/pages/home/home_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

  class _SignInViewState extends State<SignInView> {
  TextEditingController controllerEmail=TextEditingController();
  TextEditingController controllerPassword=TextEditingController();

  void signIn()async{
    try {
      await FirebaseAuth.instance.signOut();
      GoogleSignInAccount? account=await googleSignIn!.signIn();
      GoogleSignInAuthentication googleAuth=await account!.authentication;
      final credential=GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken:googleAuth.idToken,
      );
      final UserCredential authCredentional=
      await FirebaseAuth.instance.signInWithCredential(credential);
      log(credential.token.toString());
      if (authCredentional.user!=null) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder:(context) => HomePage(userCredential: authCredentional),),
           (route) => false);
      
         
      }

    } catch (e) {
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoButton.filled(child:const Text('sign in'),
             onPressed:() {
               signIn;
             },
             ),
             CupertinoButton(
              child:const Text('sign up'),
               onPressed:() {
                 Navigator.of(context).push(CupertinoPageRoute(builder:(context) => 
                 const SignUpView(),));
               },)
          ],
        ),),
    );
  }
}