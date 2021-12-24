// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors, empty_catches, unused_local_variable, avoid_print, unused_field, prefer_final_fields, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/detail.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _post = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Flutter Berita")),
      body: ListView.builder(
          itemCount: _post.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                color: Colors.grey[200],
                height: 100,
                width: 100,
                child: _post[index]['urlToImage'] != null
                    ? Image.network(
                        _post[index]['urlToImage'],
                        fit: BoxFit.cover,
                      )
                    : Center(),
              ),
              title: Text(
                '${_post[index]['title']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                '${_post[index]['description']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => Detail(
                      url: _post[index]['url'],
                      title: _post[index]['title'],
                      content: _post[index]['content'],
                      publishedAt: _post[index]['publishedAt'],
                      author: _post[index]['author'],
                      urlToImage: _post[index]['urlToImage'],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=id&apiKey=3181ff1b54de4820ad4c0243c8462edf"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _post = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
