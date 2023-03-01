import 'package:flutter/material.dart';
import 'package:notions_todo/api/netease.dart';
import 'package:notions_todo/api/search.dart';
import 'package:notions_todo/components/song-list.dart';
import 'package:notions_todo/modal/Song.dart';
import 'package:notions_todo/pages/search/components/search_bar.dart';

import '../../components/audio_tool.dart';

class ResultListPage extends StatefulWidget {
  const ResultListPage({Key? key}) : super(key: key);

  @override
  _ResultListPageState createState() => _ResultListPageState();
}

class _ResultListPageState extends State<ResultListPage> {
  List<Song> _list = [];
  String _keyword = "";
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  Future _getSongList(String keyword) async {
    List<Song> response = await NetEase.search(keyword);
    // print(response);
    // print(response);
    // print(songs);
    setState(() {
      _list = response;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dynamic obj = ModalRoute.of(context)?.settings.arguments;
    if (obj != null && obj["keyword"] != null) {
      String keyword = obj['keyword'];
      if (keyword != _keyword) {
        setState(() {
          _keyword = keyword;
        });
        _getSongList(keyword);
      }
    }
  }

  onSearchTap() {
    Navigator.pushNamed(context, "/search");
  }

  void goBack() {
    Navigator.pop(context);
  }

  Future goResult(String content) async {
    // await addHistory(content);
    Navigator.pushNamed(context, "/search_result",
        arguments: {"keyword": content});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Color(0x1B1B25),
      body: Column(
        children: [
          GestureDetector(
            child: SearchBar(goResult, goBack),
            onTap: onSearchTap,
          ),
          Expanded(
            child: SongList(_list),
            flex: 1,
          ),
          AudioTool()
        ],
      ),
    );
  }
}
