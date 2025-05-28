import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice/api/basic_api/basic_api_home_item.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_practice/api/basic_api/model/basic_api_user_model.dart';

class BasicApiHomePage extends StatefulWidget {
  const BasicApiHomePage({super.key});

  @override
  State<BasicApiHomePage> createState() => _BasicApiHomePageState();
}

class _BasicApiHomePageState extends State<BasicApiHomePage> {
  List<BasicApiUserModel> getPostList = [];

  Future<List<BasicApiUserModel>> getPostApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        getPostList.add(BasicApiUserModel.fromJson(i));
      }
      return getPostList;
    } else {
      return getPostList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BASIC API",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text("Loading...."));
                } else {
                  return ListView.builder(
                      itemCount: getPostList.length,
                      itemBuilder:(context, index){
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(child: Text(getPostList[index].id.toString())),
                            title: Text(getPostList[index].title.toString()),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BasicApiHomeItem(
                                    title: getPostList[index].title ?? '',
                                    body: getPostList[index].body ?? '',
                                  ),
                                ),
                              );
                            },
                            //subtitle: Text(getPostList[index].body.toString()),
                          ),
                        );
                      }
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
