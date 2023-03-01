import 'package:flutter/material.dart';
import 'package:notions_todo/components/circle_icon_button.dart';
import 'package:just_audio/just_audio.dart';
import 'package:notions_todo/components/tag.dart';
import 'package:notions_todo/modal/Song.dart';
import 'package:provider/provider.dart';

import '../audio/audio_manager.dart';

//  dfdsffinal duration =
// await player.setUrl(    'https://foo.com/bar.mp3');
//// Schemes: (https: | file: | asset: )
// player.play();                                  // 播放（不等待结束）
// await player.play();                            // 播放（等待结束）
// await player.pause();                           // 暂停（保持准备播放）
// await player.seek(Duration(second: 10));        // 跳到第 10 秒的位置
// await player.setSpeed(2.0);                     // 2倍加速播放
// await player.setVolume(0.5);                    // 音量降半
// await player.stop();                            // 停止并释放资源

class SongItem extends StatefulWidget {
  Song song;
  SongItem(this.song);
  // final player = AudioPlayer(); // 创建播放器
  // final String post;

  @override
  _SongItemState createState() => _SongItemState();
}

class _SongItemState extends State<SongItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.player.setUrl(widget.playurl);
  }

  @override
  Widget build(BuildContext context) {
    final AudioManager manager = Provider.of<AudioManager>(context);
    void onTap() {
      manager.addCandidateWithActive(widget.song);
    }

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Tag(content: "网易云"),
                        ),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          widget.song.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Text(widget.song.artist,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14))
                  ],
                ),
              ),
              flex: 1),
          IconButton(
              padding: EdgeInsets.only(left: 20),
              onPressed: () {
                // print(widget.id);
                // widget.player.play();
              },
              icon: Icon(Icons.more_vert_outlined,
                  color: Color.fromARGB(255, 255, 255, 255)))
        ],
      ),
    );
  }
}
