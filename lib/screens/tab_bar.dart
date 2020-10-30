import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../widgets/home.dart';
import '../widgets/profile.dart';
import '../widgets/favouite.dart';
import '../widgets/message.dart';
import '../widgets/notifiactions.dart';
import '../drawer/mydrawer.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  GlobalKey<ScaffoldState> _keyDrawer = GlobalKey<ScaffoldState>();

  int _selectedpage = 2;
  List<Map<String, Object>> pages;
  @override
  void initState() {
    super.initState();
    pages = [
      {
        'page': Profile(),
      },
      {
        'page': Home(
          showFavourite: true,
        ),
      },
      {
        'page': Home(showFavourite: false),
      },
      {
        'page': Notifaions(),
      },
      {
        'page': Message(),
      },
    ];
  }

  void selectedpage(int index) {
    setState(() {
      _selectedpage = index;
    });
  }

  Widget tabBar() {
    return Card(
      child: TabBar(
        isScrollable: true,
        labelStyle: TextStyle(fontSize: 16),
        labelColor: Colors.black,
        tabs: [
          Tab(
            text: 'الكل',
          ),
          Tab(
            text: 'حراج السيارات',
          ),
          Tab(
            text: 'حراج العقار',
          ),
          Tab(
            text: 'المزادات',
          ),
          Tab(
            text: 'الأثاث',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _keyDrawer,
        drawer: Mydrawrer(),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            onPressed: () {
              _keyDrawer.currentState.openDrawer();
            },
            icon: Icon(FontAwesome5.align_right),
          ),
          title: Center(
              child: Text(
            'حراج تقني',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: pages[_selectedpage]['page'],
        bottomNavigationBar: ConvexAppBar(
          elevation: 10,
          activeColor: Colors.blueAccent,
          color: Colors.grey,
          initialActiveIndex: _selectedpage,
          backgroundColor: Colors.white,
          onTap: selectedpage,
          items: [
            TabItem(
              title: 'بروفايل',
              icon: Icon(
                Icons.person_outline,
              ),
            ),
            TabItem(
              title: 'المفضلة',
              icon: Icon(
                Icons.star_border,
              ),
            ),
            TabItem(
              title: 'حراج',
              icon: Icon(Icons.home_outlined),
            ),
            TabItem(
              title: 'الاشعارات',
              icon: Icon(Icons.notification_important_outlined),
            ),
            TabItem(
              title: 'الرسائل',
              icon: Icon(Icons.message),
            ),
          ],
        ),
      ),
    );
  }
}
