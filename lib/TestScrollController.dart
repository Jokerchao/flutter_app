import 'package:flutter/material.dart';

class TestScrollController extends StatefulWidget {
  @override
  TestScrollerControllerState createState() {
    // TODO: implement createState
    return new TestScrollerControllerState();
  }
}

class TestScrollerControllerState extends State<TestScrollController> {
  ScrollController _scrollController = new ScrollController();
  bool _showToTopBtn = false;
  String _progress = "0%";

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      print(_scrollController.offset);
      if (_scrollController.offset < 1000 && _showToTopBtn) {
        setState(() {
          _showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 1000 && _showToTopBtn == false) {
        setState(() {
          _showToTopBtn = true;
        });
      }
    });
//    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge:${notification.metrics.extentAfter == 0}");
            return false;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                key: PageStorageKey(1),
                itemCount: 200,
                controller: _scrollController,
                itemExtent: 50,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("$index"));
                },
              ),
              CircleAvatar(
                backgroundColor: Colors.black54,
                radius: 30,
                child: Text(_progress),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: !_showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }
}
