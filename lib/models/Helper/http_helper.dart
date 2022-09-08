import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class DeveloperhttpHelper {
  DeveloperhttpHelper._();
  static DeveloperhttpHelper developerhttpHelper = DeveloperhttpHelper._();

  // regester2(String name, String email, String password) async {
  //   Response response = await post(
  //       Uri.parse('https://developer-connector-sami.herokuapp.com/api/users'),
  //       body: {'name': name, 'email': email, 'password': password});

  //   log(response.body.toString());
  // }

  // getAllPosts() async {
  //   var headers = {
  //     'Authorization':
  //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjFhNzdiOTcyZDQwMWVkOGRmMDI2MzdkIn0sImlhdCI6MTY2MjE5NDUwNiwiZXhwIjoxNjYyNTU0NTA2fQ.g2JikgKnOhNXORamUZkmlbH2nMvnvB2wgqykuk24WcE'
  //   };
  //   var url =
  //       Uri.parse('https://developer-connector-sami.herokuapp.com/api/posts');
  //   Response response = await get(url, headers: headers);
  //   if (response.statusCode != 200)
  //     throw Exception('http.get error: statusCode= ${response.statusCode}');
  //   print(response.body);
  //   log(response.body.toString());
  // }

  createPost(String addpost) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjFhNzdiOTcyZDQwMWVkOGRmMDI2MzdkIn0sImlhdCI6MTY2MjE5NDUwNiwiZXhwIjoxNjYyNTU0NTA2fQ.g2JikgKnOhNXORamUZkmlbH2nMvnvB2wgqykuk24WcE'
    };
    var url =
        Uri.parse('https://developer-connector-sami.herokuapp.com/api/posts');
    Response response =
        await post(url, headers: headers, body: {"text": addpost});
    if (response.statusCode != 200)
      throw Exception('http.get error: statusCode= ${response.statusCode}');
    print(response.body);
    log(response.body.toString());
  }
}
