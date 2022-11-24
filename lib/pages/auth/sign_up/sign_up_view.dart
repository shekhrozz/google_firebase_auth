import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_firebase_auth/pages/auth/sign_in/sign_in.dart';
import 'package:google_firebase_auth/pages/home/home_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  
  TextEditingController controllerEmail=TextEditingController();
  TextEditingController controllerPassword=TextEditingController();
  TextEditingController controllerConfirmation=TextEditingController();

  void get signUp async{
    try {
      if(controllerEmail.text.isEmpty||controllerPassword.text.isEmpty||controllerConfirmation.text.isEmpty)return;
      if (controllerPassword.text!=controllerConfirmation.text) {
        return;
      }
      final   UserCredential credential=await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: controllerEmail.text, password: controllerPassword.text);
      if(credential.user!=null){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder:(context) => HomePage(userCredential: credential),), (route) => false);
      }
    } catch (e) {
      log(e.toString());
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
            TextField(
              controller: controllerEmail,
              decoration: const InputDecoration(
                hintText: 'Email'
              ),
            ),
             TextField(
              controller: controllerPassword,
              decoration: const InputDecoration(
                hintText: 'Password'
              ),
            ),
             TextField(
              controller: controllerConfirmation,
              decoration: const InputDecoration(
                hintText: 'Confirm'
              ),
            ),
            CupertinoButton.filled(
              child:const Text('sign up'),
               onPressed:() => signUp,),      
             CupertinoButton(child: const Text('sign in') ,
              onPressed:() => const SignInView(),)
          ],
        ),
      ),
    );
  }
}