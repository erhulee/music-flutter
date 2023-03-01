import 'package:flutter/material.dart';

class Settper extends StatefulWidget {
  const Settper({Key? key}) : super(key: key);

  @override
  _SettperState createState() => _SettperState();
}

class _SettperState extends State<Settper> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: LinearProgressIndicator(
            value: 0.7,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        ),
        Positioned(
            left: 0,
            top: 0,
            child: ClipOval(
              child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(color: Colors.black)),
            ))
      ],
    );
  }
}

class PlayerController extends StatelessWidget {
  const PlayerController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Settper(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.skip_previous,
                size: 50,
                color: Colors.blue,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Icon(
                  Icons.pause,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
              Icon(
                Icons.skip_next,
                size: 50,
                color: Colors.blue,
              )
            ]),
          ],
        ));
  }
}
