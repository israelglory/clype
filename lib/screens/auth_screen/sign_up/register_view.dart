// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clype/routes/routes.dart';
import 'package:clype/screens/auth_screen/sign_up/register_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterViewModel>(
      init: RegisterViewModel(),
      builder: (model) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Create a new account and join us now!",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      controller: model.firstNameController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(16.0),
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: Colors.blue,
                                          ),
                                          hintText: "First Name",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      controller: model.lastNameController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(16.0),
                                          prefixIcon: Icon(
                                            Icons.supervised_user_circle,
                                            color: Colors.blue,
                                          ),
                                          hintText: "Last Name",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      controller: model.phoneNumberController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(16.0),
                                          prefixIcon: Icon(
                                            Icons.phone,
                                            color: Colors.blue,
                                          ),
                                          hintText: "Phone Number",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: model.emailController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(16.0),
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: Colors.blue,
                                          ),
                                          hintText: "Email address",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.done,
                                      controller: model.passController,
                                      obscureText: model.show,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(16.0),
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.blue,
                                          ),
                                          suffixIcon: model.show == true
                                              ? InkWell(
                                                  onTap: () {
                                                    model.onObscure();
                                                  },
                                                  child: const Icon(
                                                    CupertinoIcons.eye_fill,
                                                  ))
                                              : InkWell(
                                                  onTap: () {
                                                    model.onhide();
                                                  },
                                                  child: const Icon(
                                                    CupertinoIcons
                                                        .eye_slash_fill,
                                                  ),
                                                ),
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            InkWell(
                              onTap: () {
                                model.signUp(context);
                              },
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue),
                                child: Center(
                                  child: Visibility(
                                    visible: !model.inProgress,
                                    replacement: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAndToNamed(RoutesClass.getLoginRoute());
                              },
                              child: Text(
                                "Login Instead",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
