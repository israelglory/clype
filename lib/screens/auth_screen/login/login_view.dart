import 'package:clype/exports.dart';
import 'package:clype/routes/routes.dart';
import 'package:clype/screens/auth_screen/login/login_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginViewModel>(
      init: LoginViewModel(),
      builder: (model) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.blue,
                                        //Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      controller: model.emailController,
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(16.0),
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: Colors.blue,
                                          ),
                                          hintText: "Email address",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      controller: model.passController,
                                      obscureText: model.show,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(16.0),
                                          prefixIcon: const Icon(
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
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            InkWell(
                              onTap: () {
                                model.login(context);
                              },
                              child: Container(
                                height: 50,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Visibility(
                                    visible: !model.inProgress,
                                    replacement: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAndToNamed(
                                    RoutesClass.getRegisterRoute());
                              },
                              child: const AppText(
                                "Doesn't have an account? Sign Up",
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const AppText(
                              'Or',
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AppButton(
                              onPressed: () async {
                                await model.signInWithGoogle();
                              },
                              borderWidth: 2,
                              radius: 25,
                              padding: const EdgeInsets.all(16.0),
                              borderColor: Colors.blue,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.googleIconSvg,
                                    semanticsLabel: 'Google SignIn Button',
                                    height: 35,
                                    width: 35,
                                  ),
                                  const Spacer(),
                                  const AppText(
                                    'SignIn With  Google',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  const Spacer()
                                ],
                              ),
                            )
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
