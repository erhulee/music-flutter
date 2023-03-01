import 'package:flutter/material.dart';

class TODOCard extends StatelessWidget {
  // const TODOCard({Key? key}) : super(key: key);
  List<String> list;
  TODOCard(this.list);

  @override
  Widget build(BuildContext context) {
    List<Widget> renderlist = [];
    list.forEach((info) => {renderlist.add(Text(info))});
    return Column(children: renderlist);
  }
}
