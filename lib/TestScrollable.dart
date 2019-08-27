import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class TestScrollable extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return new _TestScrollableState();
//  }
  @override
  _TestScrollableState createState() => new _TestScrollableState();
}

class _TestScrollableState extends State<TestScrollable> {
  static const LoadingTag = "##loading##";
  var _words = <String>[LoadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    Widget divider1 = new Divider(color: Colors.blue);
    Widget divider2 = new Divider(color: Colors.green);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            ListTile(
              title: Text("商品列表"),
            ),
            Expanded(
//              height: MediaQuery.of(context).size.height-24-56-56,
              child: (Scrollbar(
                child: ListView.separated(
                  itemCount: _words.length,
//          itemExtent: 50,
                  separatorBuilder: (context, index) {
                    return index % 2 == 0 ? divider1 : divider2;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    if (_words[index] == LoadingTag) {
                      if (_words.length - 1 < 100) {
                        _retrieveData();
                        //加载时显示loading
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 24.0,
                            height: 24.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: new Text(
                            "没有更多内容了",
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }
                    }
                    return ListTile(
                      title: Text(_words[index]),
                    );
                  },
                ),
              )),
            )
          ],
        ));
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }
}
