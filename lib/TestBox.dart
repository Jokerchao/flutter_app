import 'package:flutter/material.dart';
import 'dart:math' as math;

class TestBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestBoxWidget();
  }
}

class _TestBoxWidget extends State<TestBox>
    with SingleTickerProviderStateMixin {
//   Widget redBox =
//      new DecoratedBox(decoration: BoxDecoration(color: Colors.red));
  int _selectedIndex = 0;
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    //ConstrainedBox和SizedBox的createRenderObject()方法都返回的是一个RenderConstrainedBox对象

    Widget redBox = new DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(3.0),
        gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2.0, 2.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Center(
        child: Text("Login", style: TextStyle(color: Colors.white)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("测试Box"),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {})
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.dashboard,
              color: Colors.grey,
            ),
            onPressed: () {
              //通过Scaffold.of(context)可以获取父级最近的Scaffold 组件的State对象
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: new MyDrawer(),
//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.business), title: Text('Business')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.school), title: Text('School')),
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.blue,
//        onTap: _onItemTapped,
//      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home)),
            SizedBox(),
            IconButton(
              icon: Icon(Icons.business),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //悬浮按钮
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 5,
            ),
          );
        }).toList(),
      ),
//      bottomNavigationBar: BottomNavigationBar(),
//      body: Column(
//        children: <Widget>[
//          new Transform(
////        alignment: Alignment.topRight,
//            //Matrix4是一个4D矩阵，通过它可以执行各种矩阵操作，
//            transform: new Matrix4.skewY(0.3), //沿y轴倾斜0.3弧度
//            child: Padding(
//              padding: EdgeInsets.symmetric(vertical: 28, horizontal: 150),
//              child: SizedBox(
//                height: 40,
//                width: 80,
//                child: redBox,
//              ),
//            ),
//          ),
//          new Transform.translate(
////        alignment: Alignment.topRight,
//            //往上平移-20，往下平移100
//            offset: Offset(-20.0, 100.0),
//            child: Padding(
//              padding: EdgeInsets.symmetric(vertical: 28, horizontal: 150),
//              child: SizedBox(
//                height: 40,
//                width: 80,
//                child: redBox,
//              ),
//            ),
//          ),
//          new Transform.scale(
//            //控件放大1.5
//            scale: 1.5,
//            child: Padding(
//              padding: EdgeInsets.symmetric(vertical: 28, horizontal: 150),
//              child: SizedBox(
//                height: 40,
//                width: 80,
//                child: redBox,
//              ),
//            ),
//          ),
//          new Transform.rotate(
//            //控件放大1.5
//            angle: math.pi / 2,
//            child: Padding(
//              padding: EdgeInsets.symmetric(vertical: 28, horizontal: 150),
//              child: SizedBox(
//                height: 40,
//                width: 80,
//                child: redBox,
//              ),
//            ),
//          ),
//        ],
//      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
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
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
