import 'package:developer_app/models/Helper/dio_helper.dart';
import 'package:developer_app/models/router.dart';
import 'package:developer_app/view/screens/sign_in_screen.dart';
import 'package:developer_app/view/widget/drower.dart';
import 'package:developer_app/view/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

import '../../../provider/developer_provider.dart';

class Profiles extends StatelessWidget {
  bool isLoding = true;
  final Color color = Color.fromARGB(255, 85, 0, 255);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drower(),
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
