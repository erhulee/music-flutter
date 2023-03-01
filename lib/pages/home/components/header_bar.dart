import 'package:flutter/material.dart';
import 'package:notions_todo/components/circle_icon_button.dart';
import 'package:notions_todo/pages/search/index.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            Text(
              "WelCome Back!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "Hi 林俊杰",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        Row(
          children: [
            CircleIconButton(Icons.search, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            }, 50),
            Padding(
                padding: EdgeInsets.only(left: 15),
                child: CircleIconButton(Icons.notifications, () {}, 50)),
          ],
        )
      ]),
    );
  }
}
