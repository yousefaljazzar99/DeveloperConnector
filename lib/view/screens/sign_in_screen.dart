import 'dart:developer';

import 'package:developer_app/models/router.dart';
import 'package:developer_app/provider/developer_provider.dart';
import 'package:developer_app/view/screens/Profiles.dart';
import 'package:developer_app/view/screens/sign_up_screen.dart';
import 'package:developer_app/view/screens/visitor.dart';
import 'package:developer_app/view/widget/custum_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInSecreen extends StatefulWidget {
  @override
  State<SignInSecreen> createState() => _SignInSecreen();
}

class _SignInSecreen extends State<SignInSecreen> {
  final Color color = Color.fromARGB(255, 85, 0, 255);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login '),
        centerTitle: true,
        backgroundColor: color,
      ),
      body: Consumer<DeveloperProvider>(builder: (context, provider, x) {
        return Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Form(
                key: provider.loginKey,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/login.png',
                        //  height: 200,
                        // width: 200,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: CustumTextField(
                        textInputType: TextInputType.emailAddress,
                        titel: 'Email',
                        controller: provider.LoginemailController,
                        validtor: provider.validatorEmail,
                        suffix: Icon(
                          Icons.email,
                          color: color,
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: CustumTextField(
                        hidepassword: true,
                        textInputType: TextInputType.visiblePassword,
                        titel: 'Password',
                        controller: provider.LoginpasswordController,
                        validtor: provider.validatorPassword,
                        suffix: Icon(
                          Icons.lock,
                          color: color,
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: InkWell(
                        onDoubleTap: () {
                          AppRouter.NavigateWithReplacemtnToWidget(Profiles());
                        },
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              textStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              fixedSize: Size(250, 40)),
                          child: Text('Login'),
                          onPressed: () async {
                            await provider.login(
                                provider.LoginemailController.text,
                                provider.LoginpasswordController.text);
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: color,
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            fixedSize: Size(250, 40)),
                        child: Text('Registration'),
                        onPressed: () {
                          AppRouter.NavigateWithReplacemtnToWidget(
                              SignUpScreen());
                        },
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          AppRouter.NavigateWithReplacemtnToWidget(visitor());
                        },
                        child: Text(
                          'Login as a visitor',
                          style: TextStyle(
                              color: color, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
