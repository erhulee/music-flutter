import 'package:flutter/material.dart';
import 'package:notions_todo/components/song-item.dart';
import 'package:notions_todo/modal/Song.dart';

class SongList extends StatelessWidget {
  List<Song> songlist;
  SongList(this.songlist);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
        child: ListView.separated(
          itemCount: songlist.length,
          separatorBuilder: ((context, index) => Container(
                height: 10,
                width: 10,
              )),
          itemBuilder: ((context, index) => Padding(
                padding: EdgeInsets.only(top: 0),
                child: SongItem(songlist[index]),
              )),
        )
        // ListView(shrinkWrap: true,  children: songListWidgts)
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.only(bottom: 20),
        //       child: Text(
        //         "我的最爱",
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontWeight: FontWeight.w600,
        //             fontSize: 16),
        //       ),
        //     ),

        //   ],
        // )
        );
  }
}
