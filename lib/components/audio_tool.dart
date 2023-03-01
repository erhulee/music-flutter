import 'package:flutter/material.dart';
import 'package:notions_todo/audio/audio_manager.dart';
import 'package:notions_todo/components/candidate_list.dart';
import 'package:provider/provider.dart';

import '../modal/Song.dart';

class AudioTool extends StatelessWidget {
  const AudioTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AudioManager manager = Provider.of(context);
    Song song = manager.activeSong ?? Song.empty();
    return Container(
        height: 65,
        child: DecoratedBox(
            decoration: BoxDecoration(color: Color.fromARGB(146, 35, 35, 35)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      child: Image.network(
                        "https://book.flutterchina.club/assets/img/logo.png",
                        width: 50,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            song.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            song.artist,
                            style: TextStyle(
                                color: Color.fromARGB(122, 220, 220, 220)),
                          )
                        ],
                      ),
                      flex: 1),
                  if (manager.isPlaying)
                    IconButton(
                      onPressed: () {
                        manager.pause();
                      },
                      icon: Icon(
                        Icons.pause_circle_filled,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  if (!manager.isPlaying)
                    IconButton(
                      onPressed: () {
                        manager.play();
                      },
                      icon: Icon(
                        Icons.play_circle_filled,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => BottomSheet(
                              onClosing: () {},
                              builder: (context) => CandidateList()),
                          backgroundColor: Color.fromARGB(255, 255, 0, 0));
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
            )));
  }
}
