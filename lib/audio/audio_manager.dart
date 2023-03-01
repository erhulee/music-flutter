// 播放列表管理 & Audio 单例管理
import '../modal/Song.dart';

class AudioManager {
  final List<Song> cadidateList = [];

  addCadidate(Song song) {
    cadidateList.add(song);
  }
}
