// 播放列表管理 & Audio 单例管理
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/Song.dart';

class AudioManager extends ChangeNotifier {
  final List<Song> candidateList = [];
  final _player = AudioPlayer();
  Song? activeSong;
  bool isPlaying = false;
  get activeId {
    return activeSong?.id ?? -1;
  }

  // AudioManager() {
  //   SharedPreferences.getInstance().then((prefs) {
  //     Object? list = prefs.get("listening_list");
  //   });
  // }
  addCadidate(Song song) {
    if (candidateList.where((element) => element.id == song.id).length == 0) {
      candidateList.add(song);
      notifyListeners();
    }
  }

  addCandidateWithActive(Song song) {
    addCadidate(song);
    activeCandidate(song.id);
  }

  removeCandidate(int id) {
    Song? item = candidateList.firstWhere((element) => element.id == id,
        orElse: () => Song.empty());
    if (item.id != -1) {
      candidateList.remove(item);
      notifyListeners();
    }
  }

  activeCandidate(int id) {
    Song? item = candidateList.firstWhere((element) => element.id == id,
        orElse: () => Song.empty());
    if (item.id != -1) {
      activeSong = item;
      _player.setUrl(item.playUrl);
      notifyListeners();
    }
  }

  play() {
    _player.play();
    isPlaying = true;
    notifyListeners();
  }

  pause() {
    _player.pause();
    isPlaying = false;
    notifyListeners();
  }
}
