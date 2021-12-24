// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final url;
  final title;
  final content;
  final publishedAt;
  final author;
  final urlToImage;

  Detail(
      {this.url,
      this.title,
      this.content,
      this.publishedAt,
      this.author,
      this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: 
          [Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              urlToImage != null
                  ? Image.network(urlToImage)
                  : Container(
                      height: 350,
                      color: Colors.grey[200],
                    ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$title',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$publishedAt',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 5),
                    Text('$content'),
                    Divider(),
                    Text('Author : $author'),
                    Text('$url'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
