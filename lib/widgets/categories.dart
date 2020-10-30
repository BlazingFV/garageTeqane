import 'package:flutter/material.dart';
import 'package:heragtqnee/provider/products.dart';
import 'package:provider/provider.dart';
import 'item.dart';
import 'package:fluttericon/mfg_labs_icons.dart';

class Categories extends StatefulWidget {
  bool showFavourite;
  final String category;
  Categories({this.showFavourite, this.category});
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool _gridView = true;

  String dropVal1 = 'السعر';

  void dropChange(String value) {
    setState(() {
      dropVal1 = value;
    });
  }

  Widget headerBuild() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 16,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _gridView = !_gridView;
              });
            },
            icon: !_gridView
                ? Icon(
                    MfgLabs.th_thumb,
                    color: Colors.blueAccent,
                  )
                : Icon(
                    Icons.format_list_bulleted,
                    color: Colors.blueAccent,
                  ),
          ),
          Expanded(child: Text('')),
          Container(
            height: MediaQuery.of(context).size.height * 0.045,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: DropdownButton(
                isDense: true,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                ),
                hint: Text('الترتيب حسب'),
                onChanged: dropChange,
                value: dropVal1,
                items: <String>[
                  'السعر',
                  'من الاقدم الي الاحدث',
                  'من الاحدث الي الاقدم'
                ]
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                          ),
                          value: value,
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false);
    final productsFavourite =
        widget.showFavourite ? products.favourite : products.iteams;
    return ListView(children: [
      headerBuild(),
      GridView.builder(
        scrollDirection: Axis.vertical,
        //reverse: true,
        primary:false,
        shrinkWrap: true,
        itemCount: productsFavourite.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: productsFavourite[i],
          child: products.iteams.length <= 0
              ? Text(
                  'لا توجد منتجات في المفضلة',
                  style: TextStyle(color: Colors.black),
                )
              : productsFavourite[i].category == widget.category
                  ? Flex(direction: Axis.vertical, children: [
                      Expanded(
                        flex: 5,
                        child: Item(
                          image: productsFavourite[i].image,
                          price: productsFavourite[i].price,
                          sale: productsFavourite[i].sale,
                          title: productsFavourite[i].title,
                          desc: productsFavourite[i].desc,
                          id: productsFavourite[i].id,
                          staticCategory: widget.category,
                          category: productsFavourite[i].category,
                          isFavourite: productsFavourite[i].isFavourite,
                          gridView: _gridView,
                        ),
                      ),
                    ])
                  : Flex(direction: Axis.vertical, children: [
                      Expanded(
                        flex: 5,
                        child: Item(
                          image: productsFavourite[i].image,
                          price: productsFavourite[i].price,
                          sale: productsFavourite[i].sale,
                          title: productsFavourite[i].title,
                          desc: productsFavourite[i].desc,
                          id: productsFavourite[i].id,
                          staticCategory: widget.category,
                          category: productsFavourite[i].category,
                          isFavourite: productsFavourite[i].isFavourite,
                          gridView: _gridView,
                        ),
                      ),
                    ])  
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: _gridView ? 0.66 : 1.5,
            crossAxisCount: _gridView ? 2 : 1,
            crossAxisSpacing: 1,
            ),
      ),
    ]);
  }
}
