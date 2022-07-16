import 'package:flutter/material.dart';
import 'package:http/http.dart' as HTTP;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:convert';
import 'package:shimmer/shimmer.dart';

import 'package:suitmedia_test_app/common/my_typography.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);
  static const routePath = "/thirdPage";

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List userList = [];
  RefreshController refreshController = RefreshController();
  int page = 1;
  bool isLoading = true;

  @override
  void initState() {
    getUsers(page.toString()).then((value) {
      setState(() {
        isLoading = false;
        page += 1;
      });
    });

    super.initState();
  }

  Future<void> refresh() async {
    setState(() {
      page = 1;
      userList.clear();
    });

    await getUsers(page.toString());
    refreshController.refreshCompleted();
    setState(() {
      page += 1;
    });
  }

  void moreUser() {
    try {
      getUsers(page.toString()).then((value) {
        setState(() {});
        refreshController.loadComplete();
      });
      page += 1;
    } catch (e) {
      refreshController.loadFailed();
    }
  }

  Future<void> getUsers(String pageNums) async {
    try {
      final url = "https://reqres.in/api/users?page=$pageNums";
      Uri uriUrl = Uri.parse(url);

      var res = await HTTP.get(uriUrl);
      var data = jsonDecode(res.body)["data"];
      setState(() {
        userList.addAll(data);
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            color: Color(0xff554AF0),
            iconSize: 18,
            onPressed: () {
              Navigator.pop(context, "");
            },
          ),
          title: Text(
            "Third Screen",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: (isLoading)
            ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const SizedBox(height: 80),
                    );
                  },
                ),
              )
            : SmartRefresher(
                enablePullUp: true,
                controller: refreshController,
                onRefresh: refresh,
                onLoading: moreUser,
                child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(
                              context,
                              userList[index]["first_name"] +
                                  " " +
                                  userList[index]["last_name"]);
                        },
                        child: ListTile(
                          title: Text(
                            userList[index]["first_name"] +
                                " " +
                                userList[index]["last_name"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(userList[index]["email"]),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(userList[index]["avatar"]),
                          ),
                        ),
                      );
                    }),
              ));
  }
}
