import 'dart:developer';

import 'package:developer_app/models/Helper/http_helper.dart';
import 'package:developer_app/models/Helper/http_helper.dart';
import 'package:developer_app/models/response/post_response.dart';

import 'package:developer_app/models/router.dart';
import 'package:developer_app/view/screens/Profiles.dart';
import 'package:developer_app/view/screens/posts.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../models/Helper/dio_helper.dart';
import '../models/response/profile_responce.dart';

class DeveloperProvider extends ChangeNotifier {
  nullValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Required field";
    }
  }

  String? validatorEmail(String v) {
    if (!isEmail(v)) {
      return 'Email error';
    }
  }

  String? validatorName(String v) {
    if (v.length < 3) {
      return 'The name must contain at least 3 characters.';
    }
  }

  String? validatorPassword(String v) {
    if (v.length < 6) {
      return 'Password must be at least 6 characters';
    }
  }

  GlobalKey<FormState> loginKey = GlobalKey();
  GlobalKey<FormState> SignUpKey = GlobalKey();
  TextEditingController LoginemailController = TextEditingController();
  TextEditingController LoginpasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  DeveloperProvider() {
    getAllProfile();
    notifyListeners();
  }

  List<ProfileResponce> profile = [];
  List<ProfileResponce> users = [];
  // List<PostsResponse> posts = [];

  getAllProfile() async {
    profile = await DeveloperDioHelper.developerDioHelper.getAllProfile();
    notifyListeners();
  }

  getUser(String id) async {
    users = await DeveloperDioHelper.developerDioHelper.getProfileUser(id);
    notifyListeners();
  }

  RegisterUser(String name, String email, String password) async {
    if (SignUpKey.currentState!.validate()) {
      await DeveloperDioHelper.developerDioHelper
          .regester(name, email, password);

      notifyListeners();
    }
  }

  // reg(String name, String email, String password) async {
  //   if (SignUpKey.currentState!.validate()) {
  //     await DeveloperhttpHelper.developerhttpHelper
  //         .regester2(name, email, password);
  //     notifyListeners();
  //   }
  // }

  login(String email, String password) async {
    if (loginKey.currentState!.validate()) {
      dynamic token = await DeveloperDioHelper.developerDioHelper
          .Login(email, password)
          .then((value) {
        if (value) {
          AppRouter.NavigateWithReplacemtnToWidget(Profiles());
        }
      });

      notifyListeners();
    }
  }

  // getAllPosts() async {
  //   posts = await DeveloperhttpHelper.developerhttpHelper.getAllPosts();
  //   notifyListeners();
  // }

  // addNewPost(String addpost) async {
  //   posts = await DeveloperhttpHelper.developerhttpHelper.createPost(addpost);

  //   notifyListeners();
  // }
}
