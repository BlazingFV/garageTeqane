import 'package:flutter/material.dart';
import 'package:heragtqnee/provider/products.dart';
import 'package:provider/provider.dart';

import 'categories.dart';
import 'item.dart';

class Home extends StatefulWidget {
  bool showFavourite;
  Home({this.showFavourite});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget searchWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: Colors.blueAccent[700],
      ),
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextFormField(
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'ابحث في حراج تقني',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false);
    final productsFavourite =
        widget.showFavourite ? products.favourite : products.iteams;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
            child: AppBar(
              backgroundColor: Colors.white,
              flexibleSpace: searchWidget(),
              bottom: TabBar(
                indicatorColor: Colors.blueAccent[700],
                labelColor: Colors.black,
                labelStyle: TextStyle(color: Colors.black),
                isScrollable: true,
                tabs: [
                  Center(child: Text("الكل")),
                  Center(child: Text("حراج السيارات")),
                  Center(child: Text("حراج العقار")),
                  Center(child: Text("المزادات")),
                  Center(child: Text("الأثاث")),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          body: SafeArea(
            child: TabBarView(children: [
              Categories(
                showFavourite: widget.showFavourite,
                category: 'الكل',
              ),
              Categories(
                showFavourite: widget.showFavourite,
                category: "حراج السيارات",
              ),
              Categories(
                showFavourite: widget.showFavourite,
                category: "حراج العقار",
              ),
              Categories(
                showFavourite: widget.showFavourite,
                category: "المزادات",
              ),
              Categories(
                showFavourite: widget.showFavourite,
                category: "الأثاث",
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
