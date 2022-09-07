import 'package:developer_app/models/Helper/dio_helper.dart';
import 'package:developer_app/models/router.dart';
import 'package:developer_app/view/screens/comments.dart';
import 'package:developer_app/view/screens/profile_details.dart';
import 'package:flutter/material.dart';

import '../../models/response/profile_responce.dart';

class CommentWidget extends StatelessWidget {
  ProfileResponce profile;

  CommentWidget(
    this.profile,
  );
  final Color color = Color.fromARGB(255, 85, 0, 255);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(
        //     color: Colors.green, width: 2.0, style: BorderStyle.solid),
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      // color: Colors.grey.withOpacity(0.2),
      // padding: EdgeInsets.all(20),
      // margin: EdgeInsets.only(top: 20, right: 20, left: 20),

      child: SizedBox(
        height: 230,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    "assets/images/avatar.png",
                    // 'https:' + (profile.user?.avatar ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  profile.user!.name ?? '',
                  // 'Yousef Aljazzar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint possimus corporis sunt necessitatibus! Minus nesciunt soluta suscipit nobis. Amet accusamus distinctio cupiditate blanditiis dolor? Illo perferendis eveniet cum cupiditate aliquam?',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Posted on   2021/12/01',
                //profile.location ?? '',
                style: TextStyle(color: Color.fromARGB(255, 220, 220, 220))),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
