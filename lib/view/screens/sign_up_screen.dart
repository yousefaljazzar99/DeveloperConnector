import 'dart:developer';

import 'package:developer_app/models/router.dart';
import 'package:developer_app/provider/developer_provider.dart';
import 'package:developer_app/view/screens/Profiles.dart';
import 'package:developer_app/view/screens/sign_in_screen.dart';
import 'package:developer_app/view/widget/custum_textfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpSecreen();
}

class _SignUpSecreen extends State<SignUpScreen> {
  final Color color = Color.fromARGB(255, 85, 0, 255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        centerTitle: true,
        backgroundColor: color,
      ),
      body: Consumer<DeveloperProvider>(builder: (context, provider, x) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Form(
                  key: provider.SignUpKey,
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        // width: 200,
                        child: Image.asset('assets/images/signup.png'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: CustumTextField(
                          textInputType: TextInputType.emailAddress,
                          titel: 'User Name',
                          controller: provider.userNameController,
                          validtor: provider.validatorName,
                          suffix: Icon(
                            Icons.person,
                            color: color,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        child: CustumTextField(
                          textInputType: TextInputType.emailAddress,
                          titel: 'Email',
                          controller: provider.emailController,
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
                          controller: provider.passwordController,
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: color,
                              textStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              fixedSize: Size(250, 40)),
                          child: Text('Registration'),
                          onPressed: () {
                            provider.RegisterUser(
                                provider.userNameController.text,
                                provider.emailController.text,
                                provider.passwordController.text);
                          },
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            AppRouter.NavigateWithReplacemtnToWidget(
                                SignInSecreen());
                          },
                          child: Text(
                            'Already have an account',
                            style: TextStyle(color: color),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
