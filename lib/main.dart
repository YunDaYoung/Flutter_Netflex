import 'package:flutter/material.dart';
import 'package:netflex_flutter/screen/home_screen.dart';
import 'package:netflex_flutter/widget/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'netflex',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white),
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                HomeScreen(),
                Container(
                    child: const Center(
                  child: Text('search'),
                )),
                Container(
                    child: const Center(
                  child: Text('save'),
                )),
                Container(
                    child: const Center(
                  child: Text('more'),
                ))
              ],
            ),
            bottomNavigationBar: Bottom(),
          )),
    );
  }
}
