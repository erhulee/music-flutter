import 'package:flutter/material.dart';

import 'package:notions_todo/components/song-list.dart';
import 'package:notions_todo/pages/search/components/search_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryItem extends StatelessWidget {
  String _content;
  SearchHistoryItem(this._content);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _content,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class SearchHistoryList extends StatelessWidget {
  List<String> _list = [];
  SearchHistoryList(this._list);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: 200,
      child: ListView.separated(
          separatorBuilder: ((context, index) {
            return Divider(
              color: Colors.grey,
            );
          }),
          itemCount: _list.length,
          itemBuilder: ((context, index) {
            return SearchHistoryItem(_list[index]);
          })),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<String> reseach_history = [];
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initResearchHistory();
  }

  Future initResearchHistory() async {
    prefs = await SharedPreferences.getInstance();
    List<String>? list = prefs.getStringList("search_list");
    setState(() {
      if (list != null) {
        reseach_history = list.toList();
      }
    });
  }

  Future addHistory(String content) async {
    if (content.trim().isEmpty) return;
    List<String> newList = [content, ...reseach_history];
    await prefs.setStringList("search", newList);
    setState(() {
      reseach_history = newList;
    });
  }

  void goBack() {
    Navigator.pop(context);
  }

  Future goResult(String content) async {
    await addHistory(content);
    Navigator.pushNamed(context, "/search_result",
        arguments: {"keyword": content});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Color.fromARGB(255, 27, 27, 27),
      body: SafeArea(
          child: Column(
        children: [
          SearchBar(goResult, goBack),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "历史搜索",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SearchHistoryList(reseach_history)
        ],
      )),
    );
  }
}
