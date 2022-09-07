import 'package:developer_app/models/Helper/dio_helper.dart';
import 'package:flutter/material.dart';

import '../../models/response/profile_responce.dart';

class DetailsWidget extends StatelessWidget {
  ProfileResponce user;

  DetailsWidget(this.user);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(
          //     color: Colors.green, width: 2.0, style: BorderStyle.solid),
          color: Color.fromARGB(255, 217, 217, 217),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(50),
          ),
        ),
        // color: Colors.grey.withOpacity(0.2),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  'https:' + (user.user?.avatar ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        user.user!.name ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(user.status ?? ''),
                      SizedBox(
                        height: 10,
                      ),
                      Text(user.location ?? ''),
                      Text(user.company ?? ''),
                      Text(user.website ?? ''),
                      Text(user.githubusername ?? ''),
                      // Text(user.),

                      ElevatedButton(
                          onPressed: () {
                            DeveloperDioHelper.developerDioHelper
                                .getProfileUser(user.user!.sId ?? "");
                          },
                          child: Text('View Profile'))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
