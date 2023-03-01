import 'package:flutter/material.dart';
import 'package:notions_todo/api/search.dart';
import 'package:notions_todo/audio/View.dart';
import 'package:notions_todo/components/song-item.dart';
import 'package:notions_todo/components/song-list.dart';
import 'package:notions_todo/modal/Song.dart';
import 'package:notions_todo/pages/home/components/header_bar.dart';
import 'package:notions_todo/pages/home/components/search_input.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import '../../components/audio_tool.dart';

class Home extends StatefulWidget {
  final String title;
  const Home({super.key, required this.title});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<Song> songList = [];
  Dio dio = Dio();

  // Future _getSongList() async {
  //   List response = await getSongList("fas");
  //   // print(response);
  //   // print(songs);
  //   setState(() {
  //     songList = response.map((song) {
  //       return new Song("", song['artists'][0]['name'], song['name']);
  //     }).toList();
  //   });
  // }

  @override
  void initState() {
    super.initState();

    // _getSongList();
  }

  // Create a key
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _key,
      backgroundColor: Color.fromARGB(255, 27, 27, 27),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
              child: HeaderBar()),
          Expanded(
            child: SongList(songList),
            flex: 1,
          ),
          AudioTool(),
        ],
      ),
    ));
  }
}
