import 'dart:developer';

import 'package:developer_app/models/Helper/dio_helper.dart';
import 'package:developer_app/view/widget/details_widget.dart';
import 'package:developer_app/view/widget/profile_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../provider/developer_provider.dart';
import '../../models/response/profile_responce.dart';

class ProfileDetails extends StatefulWidget {
  String id;
  ProfileDetails({required this.id});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final Color color = Color.fromARGB(255, 85, 0, 255);
  bool isLoding = true;
  ProfileResponce? profile;
  @override
  void initState() {
    DeveloperDioHelper.developerDioHelper.getUserById(widget.id).then((val) {
      setState(() {
        profile = DeveloperDioHelper.developerDioHelper.user;
        isLoding = false;
      });
    });
    setState(() {});
    // TODO: implement initState
    super.initState();
    print(widget.id);
    setState(() {});
  }

  Future<void> _launchUrl(String url) async {
    print(url);
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Profile Details'),
        centerTitle: true,
      ),
      body: Consumer<DeveloperProvider>(
        builder: (context, provider, x) {
          return SingleChildScrollView(
            child: isLoding
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: color.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            // topLeft: Radius.circular(100),
                            // topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          color: color,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                                width: 120,
                                height: 120,
                                child: Image.asset("assets/images/avatar.png")),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              profile?.user!.name ?? '',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              profile!.status ?? '',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              profile!.location ?? '',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _launchUrl(
                                          profile!.social!.twitter.toString());
                                    },
                                    child: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Image.asset(
                                          'assets/icons/twitter.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _launchUrl(
                                          profile!.social!.youtube.toString());
                                    },
                                    child: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Image.asset(
                                          'assets/icons/youtube.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _launchUrl(
                                          profile!.social!.facebook.toString());
                                    },
                                    child: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Image.asset(
                                          'assets/icons/facebook.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _launchUrl(profile!.social!.instagram
                                          .toString());
                                    },
                                    child: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Image.asset(
                                          'assets/icons/instagram.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _launchUrl(
                                          profile!.social!.linkedin.toString());
                                    },
                                    child: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Image.asset(
                                          'assets/icons/linkedin.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              // border: Border.all(
                              //     color: Colors.green, width: 2.0, style: BorderStyle.solid),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            padding: EdgeInsets.all(20),
                            margin:
                                EdgeInsets.only(top: 20, right: 20, left: 20),
                            child: Column(
                              children: [
                                Text(
                                  '${profile!.user!.name ?? ''} \'s Bio',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  profile!.bio ?? '',
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              // border: Border.all(
                              //     color: Colors.green, width: 2.0, style: BorderStyle.solid),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            padding: EdgeInsets.all(20),
                            margin:
                                EdgeInsets.only(top: 20, right: 20, left: 20),
                            child: Column(
                              children: [
                                Text(
                                  'Skill Set',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: profile!.skills!.length,
                                            itemBuilder: ((context, index) {
                                              return Row(
                                                children: [
                                                  Icon(Icons.verified),
                                                  Text(
                                                    profile!.skills![index],
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              );
                                            }),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              // border: Border.all(
                              //     color: Colors.green, width: 2.0, style: BorderStyle.solid),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            padding: EdgeInsets.all(20),
                            margin:
                                EdgeInsets.only(top: 20, right: 20, left: 20),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Education',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: profile!.education!.length,
                                  itemBuilder: ((context, index) {
                                    return Column(
                                      children: [
                                        Text(
                                          profile!.education![index].school ??
                                              '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'From :  ${profile!.education![index].from ?? ''}',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'to :  ${profile!.education![index].to ?? 'Now'}',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'Degree : ${profile!.education![index].degree ?? ''}',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'Field Of Study : ${profile!.education![index].fieldofstudy ?? ''}',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'Description : ${profile!.education![index].description ?? ''}',
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              // border: Border.all(
                              //     color: Colors.green, width: 2.0, style: BorderStyle.solid),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            padding: EdgeInsets.all(20),
                            margin:
                                EdgeInsets.only(top: 20, right: 20, left: 20),
                            child: Column(
                              children: [
                                Text(
                                  'Experience',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: profile!.experience!.length,
                                  itemBuilder: ((context, index) {
                                    return Column(
                                      children: [
                                        Text(
                                          profile!.experience![index].title ??
                                              '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'company : ${profile!.experience![index].company ?? ''}',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'location : ${profile!.experience![index].location ?? ''}',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'From :  ${profile!.experience![index].from ?? ''}',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'To :  ${profile!.experience![index].to ?? 'Now'}',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'Description : ${profile!.experience![index].description ?? ''}',
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
