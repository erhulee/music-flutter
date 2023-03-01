import 'package:flutter/material.dart';
import 'package:notions_todo/audio/audio_manager.dart';
import 'package:notions_todo/components/doto_card.dart';
import 'package:notions_todo/components/profile_drawer.dart';
import 'package:notions_todo/pages/home/index.dart';
import 'package:notions_todo/pages/record/index.dart';
import 'package:notions_todo/pages/result_list/index.dart';
import 'package:notions_todo/pages/search/index.dart';
import 'package:notions_todo/utils/createMaterialColor.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AudioManager(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: TextTheme(
              bodyText2: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(234, 211, 212, 215)),
            ),
            primarySwatch:
                createMaterialColor(Color.fromARGB(255, 246, 246, 246)),
          ),
          routes: {
            "/": ((context) => Home(title: " ")),
            "/search_result": (context) => ResultListPage(),
            "/search": (context) => SearchPage()
          },
        ));
  }
}
