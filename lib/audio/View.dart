import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  // const Test({ Key? key }) : super(key: key);
  Future onPress() async {
    final player = AudioPlayer(); // Create a player
    final duration = await player.setUrl(// Load a URL
        'http://music.163.com/song/media/outer/url?id=468176711.mp3');
    await player.play();
    // Stop and free resources
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text("播放"),
        onPressed: onPress,
      ),
    );
  }
}
