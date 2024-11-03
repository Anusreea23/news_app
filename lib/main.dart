import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/controller/search_screen_controller.dart';

import 'package:news_app/view/main_page/main_page.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  var box = await Hive.openBox("newsBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => SearchScreenController(),
      ),
      ChangeNotifierProvider(
        create: (context) => NewsController(),
      ),
    ], child: MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()));
  }
}
