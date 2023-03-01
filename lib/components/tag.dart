import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  String content;
  Tag({this.content = ""});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
        decoration: BoxDecoration(color: Color.fromARGB(156, 237, 235, 253)),
        child: Text(
          content,
          style: TextStyle(color: Colors.black, fontSize: 11),
        ),
      ),
    );
  }
}
