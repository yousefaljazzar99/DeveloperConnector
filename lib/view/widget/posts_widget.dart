import 'package:developer_app/models/Helper/dio_helper.dart';
import 'package:developer_app/models/response/post_response.dart';
import 'package:developer_app/models/router.dart';
import 'package:developer_app/view/screens/comments.dart';
import 'package:developer_app/view/screens/posts.dart';
import 'package:developer_app/view/screens/profile_details.dart';
import 'package:flutter/material.dart';

class post_widget extends StatelessWidget {
  // post_response posts;

  post_widget(
//   this.posts,
      );
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
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
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
                child: Image.network(''
                    //   "assets/images/avatar.png",
                    // 'https:' + (posts.user!.avatar ?? ''),
                    // fit: BoxFit.cover,
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
                        '',
                        // posts.user!.name ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          //posts.text ?? '',
                          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint possimus corporis sunt necessitatibus! Minus nesciunt soluta suscipit nobis. Amet accusamus distinctio cupiditate blanditiis dolor? Illo perferendis eveniet cum cupiditate aliquam?',
                          //  profile.status ?? '',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Posted on   2021/12/01',
                          //   posts.date ?? '',
                          style: TextStyle(
                              color: Color.fromARGB(255, 220, 220, 220))),
                      Row(
                        children: [
                          ElevatedButton.icon(
                              icon: Icon(
                                Icons.add_comment,
                                color: color,
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white, onPrimary: Colors.red),
                              onPressed: () {
                                AppRouter.NavigateToWidget(Commentsdetails());
                                // DeveloperDioHelper.developerDioHelper
                                //     .getProfileUser(profile.user!.sId ?? "");
                              },
                              label: Text(
                                'Add comments',
                                style: TextStyle(color: color),
                              )),
                        ],
                      )
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
