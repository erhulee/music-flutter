import 'package:flutter/material.dart';

typedef VoidCallback = void Function();
typedef SearchCallback = Future Function(String content);

class SearchBar extends StatelessWidget {
  final SearchCallback onSearch;
  final VoidCallback onBack;
  SearchBar(this.onSearch, this.onBack);
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                onBack();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          Expanded(
            child: Container(
              height: 35,

              // width: 250,
              child: TextField(
                controller: controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      // Border.all(color: Colors.white, width: 20),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                String text = controller.text;
                onSearch(text);
              },
              child: Text(
                "搜索",
                style: TextStyle(fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
