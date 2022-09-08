import 'dart:developer';

import 'package:developer_app/models/response/post_response.dart';
import 'package:developer_app/models/router.dart';
import 'package:developer_app/models/response/UserAuthResponse.dart';
import 'package:developer_app/view/screens/Profiles.dart';
import 'package:developer_app/view/screens/sign_in_screen.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/screens/posts.dart';
import '../response/profile_responce.dart';

class DeveloperDioHelper {
  DeveloperDioHelper._();
  static DeveloperDioHelper developerDioHelper = DeveloperDioHelper._();
  Dio dio = Dio();
  ProfileResponce? user;
  postResponse? post;

  Future<List<ProfileResponce>> getAllProfile() async {
    var response = await dio
        .get('https://developer-connector-sami.herokuapp.com/api/profile');
    List<dynamic> profilesList = response.data;
    List<ProfileResponce> profiles = profilesList
        .map((e) => ProfileResponce.fromJson(e as Map<String, dynamic>))
        .toList();
    //  log(response.data.toString());
    return profiles;
  }

  Future<List<ProfileResponce>> getProfileUser(String id) async {
    var response = await dio.get(
        'https://developer-connector-sami.herokuapp.com/api/profile/user/$id');

    if (response.statusCode != 200)
      throw Exception('http.get error: statusCode= ${response.statusCode}');
    log(response.data.toString());
    return response.data;
  }

  Future<bool> regester(String name, String email, String password) async {
    var response = await dio.post(
        'https://developer-connector-sami.herokuapp.com/api/users',
        data: {"name": name, "email": email, "password": password});

    if (response.statusCode != 201) {
      return false;
      //    throw Exception('dio.get error: statusCode= ${response.statusCode}');

    } else {
      dynamic token = response.data['token'];
      updateToken(token);
      log(response.data.toString());
      AppRouter.NavigateWithReplacemtnToWidget(Profiles());
      getUserAuth();
      return true;
    }

    // if (token != null) {

    // }

    // return response.data;
  }

  // String token = '';
  Future<bool> Login(String email, String password) async {
    var response = await dio.post(
        'https://developer-connector-sami.herokuapp.com/api/auth',
        data: {"email": email, "password": password});

    if (response.statusCode != 200) {
      return false;
      throw Exception('dio.get error: statusCode= ${response.statusCode}');
    } else {
      log(response.data.toString());
      updateToken(response.data['token']);
      getUserAuth();
      // token = response.data.toString();

      return true;
    }
    // dynamic token = response.data;
    // if (token != null) {
    //   AppRouter.NavigateWithReplacemtnToWidget(Profiles());
    // }
  }

  updateToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    log(token.toString());
  }

  checkUser(isLogin) async {
    print(isLogin);
    // User? user;
    print("isLogin");
    if (isLogin) {
      AppRouter.NavigateWithReplacemtnToWidget(Profiles());
    } else {
      AppRouter.NavigateWithReplacemtnToWidget(SignInSecreen());
    }
  }

  signout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  getUserAuth() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    dynamic token = pref.get("token");
    var response = await dio.get(
      'https://developer-connector-sami.herokuapp.com/api/auth',
      options: Options(headers: {
        'Authorization': token,
      }),
    );
    UserAuth user = UserAuth.fromJson(response.data);
    log(user.toJson().toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', user.name!);
    prefs.setString('id', user.sId ?? '');
    prefs.setString('email', user.email!);
    prefs.setString('date', user.date.toString());
  }

  Future<bool> getUserById(String id) async {
    var response = await dio.get(
      'https://developer-connector-sami.herokuapp.com/api/profile/user/$id',
    );
    if (response.statusCode != 200) {
      return false;
    } else {
      user = ProfileResponce.fromJson(response.data);
      // post = post_response.fromJson(response.data);
      return true;
    }
  }

  Future<List<postResponse>> getAllPosts() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    dynamic token = pref.get("token");
    var response = await dio.get(
      'https://developer-connector-sami.herokuapp.com/api/posts',
      options: Options(headers: {
        'Authorization': token,
      }),
    );
    log(response.data.toString());
    if (response.statusCode != 200) {
      return null!;
    } else {
      List<dynamic> _data = response.data;
      List<postResponse> _postResponse =
          _data.map((e) => postResponse.fromJson(e)).toList();
      // post = postResponse.fromJson(response.data);
      return _postResponse;
    }
  }

  createPost(String text) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    dynamic token = pref.get("token");
    var response = await dio
        .post('https://developer-connector-sami.herokuapp.com/api/posts',
            options: Options(headers: {
              'Authorization': token,
            }),
            data: {"text": text});
    if (response.statusCode != 201)
      throw Exception('http.get error: statusCode= ${response.statusCode}');
    print(response.data);
    log(response.data.toString());
  }
}
