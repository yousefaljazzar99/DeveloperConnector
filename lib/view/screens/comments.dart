import 'package:developer_app/models/router.dart';
import 'package:developer_app/provider/developer_provider.dart';
import 'package:developer_app/view/widget/comments_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Commentsdetails extends StatelessWidget {
  nullValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "حقل مطلوب";
    }
  }

  TextEditingController PostControler = TextEditingController();
  final Color color = Color.fromARGB(255, 85, 0, 255);
  // late ProfileResponce profile;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
        centerTitle: true,
        backgroundColor: color,
      ),
      body: Consumer<DeveloperProvider>(
        builder: (context, provider, x) {
          return Container(
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
            margin: EdgeInsets.only(top: 20, right: 20, left: 20),
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
                      labelText: 'Create a Comment',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Add comment',
                    style: TextStyle(color: color),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: provider.profile.length,
                        itemBuilder: ((context, index) {
                          return CommentWidget(provider.profile[index]);
                        })),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
