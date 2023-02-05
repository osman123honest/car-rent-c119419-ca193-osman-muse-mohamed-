// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, avoid_print

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController email =TextEditingController();
  TextEditingController Pass =TextEditingController();

  bool isloading = false;
  registers() async{
    try{
      isloading=true;
      setState(() {});
      var response =await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: Pass.text);
      print("success");
    }catch(e){
      log(e.toString());
    }
    isloading=false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10,left: 10,top: 50),
            child: Column(
              children: [
                // ignore: prefer_const_constructors
                 Center(child: Text("SignUP",style: TextStyle(
                  fontSize: 30
                ),),),
                
                SizedBox(height: 30,),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Email",
                  ),
                ),
                SizedBox(height: 30,),
                TextField(
                  controller: Pass,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Passworsddsd",
                  ),
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: ()=>registers(), 
                  child: isloading? 
                  CircularProgressIndicator(backgroundColor: Colors.white,):Text("Submit")
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}