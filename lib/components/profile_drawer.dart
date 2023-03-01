import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
            child: Image.asset(
          "images/dog.png",
          width: 40,
        )),
        Padding(padding: EdgeInsets.only(left: 10), child: Text("爱吃螺蛳粉的二虎"))
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final Icon icon;
  final String listName;
  final String total;

  ListItem(this.icon, this.listName, this.total);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Flex(
            direction: Axis.horizontal,
            children: [icon, Expanded(child: Text(listName)), Text(total)]));
  }
}

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: UserInfo()),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListItem(const Icon(Icons.add), "今天", "2"),
                  ListItem(const Icon(Icons.add), "今天", "2"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
