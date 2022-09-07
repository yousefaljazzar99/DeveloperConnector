import 'dart:developer';

import 'package:developer_app/models/Helper/dio_helper.dart';
import 'package:developer_app/models/router.dart';
import 'package:developer_app/provider/developer_provider.dart';
import 'package:developer_app/view/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplachScreen extends StatefulWidget {
  final Color color = Color.fromARGB(255, 85, 0, 255);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  void initState() {
    super.initState();
    navigationFun();
  }

  bool isLogin = false;
  navigationFun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getString('token') != null ? true : false;

    // await Future.delayed(Duration(seconds: 3));
    setState(() {});
    // Provider.of<DeveloperProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    //  initFun();
    return Scaffold(
        body: InkWell(
      onTap: () {
        DeveloperDioHelper.developerDioHelper.checkUser(isLogin);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Expanded(
              flex: 20,
              child: Center(
                child: Image.asset(
                  'assets/images/logo3.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ),

          // Spacer(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Expanded(
              flex: 5,
              child: Center(
                child: Column(
                  children: const [
                    Text(
                      'Developed by',
                      style: TextStyle(
                        color: Color.fromARGB(255, 85, 0, 255),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Yousef Aljazzar',
                      style: TextStyle(
                          color: Color.fromARGB(255, 85, 0, 255),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
