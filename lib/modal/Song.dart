class Song {
  final int? id;
  final String? name;
  // final String? album;

  final String? artist;
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

  Song(
    this.id,
    this.name,
    // this.album,
    this.artist,
    // this.artistAvatar,
    // this.duration,
    // this.from,
  );

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
