import 'package:flutter/material.dart';

import 'DemoPage.dart';
import 'TapBox.dart';
import 'TestAsync.dart';
import 'TestBox.dart';
import 'TestClip.dart';
import 'TestCupertino.dart';
import 'TestFlex.dart';
import 'TestGridView.dart';
import 'TestInheritedWidget.dart';
import 'TestProvider.dart';
import 'TestScrollController.dart';
import 'TestScrollable.dart';
import 'TestStateful.dart';
import 'TestTheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      home: CounterWidget(),
//    home :Text("Hello"),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: new ListView(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new FlatButton(
                onPressed: () => setState(() => ++_counter),
                child: Text('$_counter')),
            new FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      //Widget管理自身状态
                      MaterialPageRoute(builder: (context) => TapboxA()));
                  //父widget管理子widget的state
//                      MaterialPageRoute(builder: (context) => TapboxB()));
                  //混合管理
//                      MaterialPageRoute(builder: (context) => TapboxC()));
                },
                child: Text("TapBoxA测试")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      //Widget管理自身状态
//                      MaterialPageRoute(builder: (context) => TapboxA()));
                      //父widget管理子widget的state
                      MaterialPageRoute(builder: (context) => TapboxB()));
                  //混合管理
//                      MaterialPageRoute(builder: (context) => TapboxC()));
                },
                child: Text("TapBoxB测试")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      //Widget管理自身状态
//                      MaterialPageRoute(builder: (context) => TapboxA()));
                      //父widget管理子widget的state
//                      MaterialPageRoute(builder: (context) => TapboxB()));
                      //混合管理
                      MaterialPageRoute(builder: (context) => TapboxC()));
                },
                child: Text("TapBoxC测试")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CupertinoTestRoute()));
                },
                child: Text("Cupertino测试")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestFlex()));
                },
                child: Text("Flex测试")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DemoPage()));
                },
                child: Text("状态Widget测试")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestBox()));
                },
                child: Text("尺寸限制类容器")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestClip()));
                },
                child: Text("裁剪Clip")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TestScrollable()));
                },
                child: Text("可滚动组件")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestGridView()));
                },
                child: Text("测试GridView")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TestScrollController()));
                },
                child: Text("测试滑动事件")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InheritedWidgetTestRoute()));
                },
                child: Text("测试数据共享")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProviderRoute()));
                },
                child: Text("测试Provider")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThemeTestRoute()));
                },
                child: Text("测试Theme")),
            new FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestFuture()));
                },
                child: Text("测试Future")),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
