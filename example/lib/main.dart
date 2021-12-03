import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> resultList = [
    "穿搭冬季",
    "2021秋冬流行穿搭",
    "穿搭",
    "家常菜",
    "文案",
    "头像",
    "健身",
    "学习",
    "跟井柏然学花衬衫叠穿",
    "准备好圣诞礼物了吗",
    "哈利波特手游雪山来客攻略",
    "人间富贵花穿搭"
  ];

  int limitRowNumber = math.pow(2, 30);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: ExtendedWrap(
              key: UniqueKey(),
              limitRowNumber: limitRowNumber,
              runSpacing: 12,
              spacing: 12,
              alignment: WrapAlignment.start,
              children: resultList
                  .map((e) => Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xfff1f2f4),
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        child: Text(e,
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff505051))),
                      ))
                  .toList(),
            ),
          ),
          _buildButton(1),
          _buildButton(2),
          _buildButton(3),
          _buildButton(-1),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _buildButton(int limit) {
    String showTips;
    if (limit == -1) {
      limit = math.pow(2, 30);
      showTips = "显示全部";
    } else {
      showTips = "行数限制：$limit行";
    }
    return TextButton(
        onPressed: () {
          setState(() {
            limitRowNumber = limit;
          });
        },
        child: Text(showTips),
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            backgroundColor: MaterialStateProperty.all(Color(0xfff1f2f4))));
  }
}
