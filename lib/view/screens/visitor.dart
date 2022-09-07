import 'package:developer_app/models/Helper/dio_helper.dart';
import 'package:developer_app/models/router.dart';
import 'package:developer_app/view/screens/sign_in_screen.dart';
import 'package:developer_app/view/screens/sign_up_screen.dart';
import 'package:developer_app/view/screens/splash_screen.dart';
import 'package:developer_app/view/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

import '../../../provider/developer_provider.dart';

class visitor extends StatelessWidget {
  final Color color = Color.fromARGB(255, 85, 0, 255);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // ignore: prefer_const_constructors
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 85, 0, 255),
              ),
              accountName: Text("Gaza Sky Geeks"),
              accountEmail: Text("GazaSkyGeeks@visitor.com"),
              currentAccountPicture: Image.asset("assets/images/avatar.png"),
            ),
            ListTile(
              title: const Text(
                'Developers',
              ),
              leading: Icon(Icons.developer_mode),
              iconColor: color,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Login'),
              leading: Icon(Icons.login),
              iconColor: color,
              onTap: () {
                AppRouter.NavigateWithReplacemtnToWidget(SignInSecreen());
              },
            ),

            ListTile(
              title: const Text('Registration'),
              leading: Icon(Icons.app_registration),
              iconColor: color,
              onTap: () {
                AppRouter.NavigateWithReplacemtnToWidget(SignUpScreen());
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
              title: const Text('EXIT'),
              leading: Icon(Icons.exit_to_app),
              iconColor: color,
              onTap: () {
                AppRouter.NavigateWithReplacemtnToWidget(SplachScreen());
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Developers'),
        centerTitle: true,
      ),
      body: Consumer<DeveloperProvider>(
        builder: (context, provider, x) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.preview),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Browse and connect with developers',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: provider.profile.length,
                      itemBuilder: ((context, index) {
                        return ProfileWidget(provider.profile[index]);
                      })),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
