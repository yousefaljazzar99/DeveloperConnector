import 'dart:convert';
import 'dart:developer';

import 'package:developer_app/models/Helper/dio_helper.dart';
import 'package:developer_app/models/Helper/http_helper.dart';
import 'package:developer_app/models/response/post_response.dart';
import 'package:developer_app/models/router.dart';
import 'package:developer_app/view/screens/Profiles.dart';
import 'package:developer_app/view/screens/posts.dart';
import 'package:developer_app/view/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/developer_provider.dart';

class Drower extends StatefulWidget {
  @override
  State<Drower> createState() => _DrowerState();
}

class _DrowerState extends State<Drower> {
  final Color color = Color.fromARGB(255, 85, 0, 255);
  String? name;
  String? email;
  String? date;
  String? id;
  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    email = prefs.getString('email');
    date = prefs.getString('date');
    id = prefs.getString('id').toString();
    print(name);
    setState(() {});
    // print(prefs.getString('user'));
    // Map valueMap = jsonDecode(prefs.getString('user')!);

    // print(valueMap['name'].toString());
  }

  @override
  void initState() {
    // TODO: implement initState

    getUser();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ignore: prefer_const_constructors
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 85, 0, 255),
            ),
            accountName: Text(name ?? ''),
            accountEmail: Text(email ?? ''),
            currentAccountPicture: Image.asset("assets/images/avatar.png"),
          ),
          ListTile(
            title: const Text(
              'Developers',
            ),
            leading: Icon(Icons.developer_mode),
            iconColor: color,
            onTap: () {
              AppRouter.NavigateWithReplacemtnToWidget(Profiles());
            },
          ),
          ListTile(
            title: const Text('Posts'),
            leading: Icon(Icons.post_add),
            iconColor: color,
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              dynamic token = pref.get("token");
              await Provider.of<DeveloperProvider>(context, listen: false)
                  .getAllPosts();
              AppRouter.NavigateWithReplacemtnToWidget(Posts(token: token));
            },
          ),

          ListTile(
            title: const Text('Dashboard'),
            leading: Icon(Icons.dashboard),
            iconColor: color,
            onTap: () {
              //   DeveloperDioHelper.developerDioHelper.getAllPosts();
              // DeveloperdioHelper.developerdioHelper.getUserAuth();
            },
          ),
          const AboutListTile(
            // <-- SEE HERE
            icon: Icon(
              Icons.info,
              color: Color.fromARGB(255, 85, 0, 255),
            ),
            child: Text('About app'),

            applicationIcon: Icon(
              Icons.terminal,
            ),
            applicationName: 'Developer Connector',
            applicationVersion: '1.0.25',
            applicationLegalese: '© 2022 Gaza sky Geeks',
            aboutBoxChildren: [
              ///Content goes here...
            ],
          ),
          ListTile(
            title: const Text('Sign out'),
            leading: Icon(Icons.exit_to_app),
            iconColor: color,
            onTap: () {
              DeveloperDioHelper.developerDioHelper.signout();
              AppRouter.NavigateWithReplacemtnToWidget(SignInSecreen());
            },
          ),
        ],
      ),
    );
  }
}
