// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:car_rent_app/screens/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'register.dart';
import 'screens/home.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email =TextEditingController();
  TextEditingController Pass =TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 50),
            child: Column(
              children: [
                Center(child: Text("Login",style: TextStyle(
                  fontSize: 30
                ),),),
                SizedBox(height: 30,),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter Email",),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: Pass,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Password",
                  ),
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: () {
                      loning() async{
                          try{
                            isloading=true;
                            setState(() {});
                            var response =await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: Pass.text);
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context)=>myapp())
                            );
                          }catch(e){
                            log(e.toString());
                          }
                          isloading=false;
                          setState(() {});
                        };
                        loning();

                    }, child: isloading? 
                        CircularProgressIndicator(backgroundColor: Colors.white,):Text("Login")),
                    TextButton(onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=>register())
                      );
                    }, child: Text("Register")),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
