import 'package:developer_app/models/Helper/dio_helper.dart';
import 'package:developer_app/models/response/post_response.dart';
import 'package:developer_app/models/router.dart';
import 'package:developer_app/view/screens/sign_in_screen.dart';
import 'package:developer_app/view/widget/drower.dart';
import 'package:developer_app/view/widget/posts_widget.dart';
import 'package:developer_app/view/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

import '../../../provider/developer_provider.dart';

class Posts extends StatefulWidget {
  postResponse? post;
  String token;
  Posts({required this.token});
  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  nullValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "حقل مطلوب";
    }
  }

  TextEditingController PostControler = TextEditingController();

  final Color color = Color.fromARGB(255, 85, 0, 255);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drower(),
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Posts'),
        centerTitle: true,
      ),
      body: Consumer<DeveloperProvider>(
        builder: (context, provider, x) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Welcome to the community!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //     color: Colors.green, width: 2.0, style: BorderStyle.solid),
                  color: color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                // color: Colors.grey.withOpacity(0.2),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 5, right: 20, left: 20),
                child: Column(
                  children: [
                    Text(
                      'Say Something...',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (x) => provider.nullValidation(x),
                      controller: PostControler,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Create a post',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        provider.createPost(PostControler.text);
                      },
                      child: Text(
                        'submit',
                        style: TextStyle(color: color),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: provider.posts.length,
                    itemBuilder: ((context, index) {
                      return post_widget(provider.posts[index]);
                    })),
              ),
            ],
          );
        },
      ),
    );
  }
}
