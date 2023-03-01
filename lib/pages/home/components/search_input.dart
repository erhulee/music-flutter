import 'package:flutter/material.dart';
import 'package:notions_todo/utils/createMaterialColor.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: DecoratedBox(
                decoration:
                    BoxDecoration(color: Color.fromARGB(62, 187, 222, 251)),
                child: const TextField(
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        // fillColor: Colors.amber,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Colors.white)))));
  }
}
