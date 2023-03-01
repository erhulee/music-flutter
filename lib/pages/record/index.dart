import 'package:flutter/material.dart';
import 'package:notions_todo/pages/record/components/player-controller.dart';
import 'package:notions_todo/pages/record/components/spin-record.dart';

class Record extends StatefulWidget {
  const Record({Key? key}) : super(key: key);

  @override
  _RecordState createState() => _RecordState();
}

class _RecordState extends State<Record> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Column(children: [Text("一样的月光"), Text("徐佳莹")]),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new),
      ),
      body: Column(
        children: [
          Container(padding: EdgeInsets.only(top: 40), child: SpinRecord()),
          Expanded(
              child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 10),
            child: PlayerController(),
          )),
        ],
      ),
    );
  }
}
