class Song {
  final int id;
  final String name;
  // final String? album;
  String from = "网易云";
  final String artist;

  String albumPost;
  // final Uri? artistAvatar;
  // final Duration? duration;
  // final String? from;

  // Song({
  //   this.id,
  //   this.name,
  //   this.album,
  //   this.artist,
  //   this.artistAvatar,
  //   this.duration,
  //   this.from,
  // });
  get playUrl {
    switch (this.from) {
      case "网易云":
        return "https://music.163.com/song/media/outer/url?id=${this.id}.mp3";
    }
  }

  Song(
      this.id,
      this.name,
      // this.album,
      this.artist,
      this.albumPost
      // this.artistAvatar,
      // this.duration,
      // this.from,
      );

  Song.empty()
      : id = -1,
        name = "",
        artist = "",
        albumPost = "";

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
  // Song.fromJson(Map<String, dynamic> json)
  //     : name = json['name'],
  //       email = json['email'];

  // Map<String, dynamic> toJson() => <String, dynamic>{
  //       'name': name,
  //       'email': email,
  //     };
}
