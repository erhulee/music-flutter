import 'package:flutter/material.dart';
import 'package:notions_todo/audio/audio_manager.dart';
import 'package:notions_todo/modal/Song.dart';
import 'package:provider/provider.dart';

class CandidateItem extends StatelessWidget {
  Song _song;
  bool isActive;
  CandidateItem(this._song, this.isActive);
  @override
  Widget build(BuildContext context) {
    AudioManager manager = Provider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: InkWell(
          onTap: () {
            manager.activeCandidate(_song.id);
          },
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _song.name + "-" + _song.artist,
                  style: TextStyle(
                      color: isActive ? Colors.red : Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                flex: 1,
              ),
              GestureDetector(
                onTap: () {
                  manager.removeCandidate(_song.id);
                },
                child: Icon(
                  Icons.delete_outline,
                  size: 20,
                  color: Colors.grey[100],
                ),
              )
            ],
          ),
        ));
  }
}

class CandidateList extends StatelessWidget {
  const CandidateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AudioManager manager = Provider.of<AudioManager>(context);
    List<Song> list = manager.candidateList;

    Widget content = Container();
    if (list.length == 0) {
      content = Text("快选择一些歌曲试听吧~");
    } else {
      content = Container(
        child: ListView.separated(
            itemCount: list.length,
            separatorBuilder: ((context, index) {
              return Divider(
                color: Colors.grey[400],
              );
            }),
            itemBuilder: ((context, index) {
              return CandidateItem(
                  list[index], manager.activeId == list[index].id);
            })),
      );
    }
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        color: Colors.grey[800],
        height: 300,
        // color: Colors.transparent,
        child: content);
  }
}
