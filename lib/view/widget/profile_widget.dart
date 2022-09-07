import 'package:developer_app/models/response/profile_responce.dart';
import 'package:developer_app/models/router.dart';
import 'package:developer_app/view/screens/profile_details.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  ProfileResponce profile;

  ProfileWidget(
    this.profile,
  );

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final Color color = Color.fromARGB(255, 85, 0, 255);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(
          //     color: Colors.green, width: 2.0, style: BorderStyle.solid),
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(80),
          ),
        ),
        // color: Colors.grey.withOpacity(0.2),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          children: [
            Container(
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.asset(
                  "assets/images/avatar.png",
                  //'https:' + (profile.user?.avatar ?? ''),
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
                        widget.profile.user!.name ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(widget.profile.status ?? '',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(widget.profile.location ?? '',
                          style: TextStyle(color: Colors.white)),
                      ElevatedButton.icon(
                          icon: Icon(
                            Icons.view_headline,
                            color: color,
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white, onPrimary: Colors.red),
                          onPressed: () {
                            AppRouter.NavigateToWidget(
                              ProfileDetails(
                                  id: widget.profile.user!.sId.toString()),
                            );

                            // DeveloperDioHelper.developerDioHelper
                            //     .getProfileUser(profile.user!.sId ?? "");
                            // DeveloperDioHelper.developerDioHelper
                            //     .Login("joseph@gmail.com", "123456");
                          },
                          label: Text(
                            'View Profile',
                            style: TextStyle(color: color),
                          ))
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
