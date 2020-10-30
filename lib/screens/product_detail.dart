import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetail extends StatefulWidget {
  final String prodName;
  final String prodid;
  final String prodimage;
  final double price;
  final String proddesc;
  bool isFavourite;
  ProductDetail({
    this.prodName,
    this.proddesc,
    this.prodid,
    this.prodimage,
    this.price,
    this.isFavourite,
  });

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int total = 0;
  double totalprice = 0;

  Widget buttonBuild() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 1,
              color: Colors.grey[100],
              offset: Offset(0, 1),
              spreadRadius: 1),
        ], color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
        child: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              total += 1;
              totalprice += widget.price;
            });
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          '$total',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 1,
              color: Colors.grey[100],
              offset: Offset(0, 1),
              spreadRadius: 1),
        ], color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
        child: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.minus,
            color: Colors.white,
          ),
          onPressed: () {
            if (total <= 0) {
              return;
            } else {
              setState(() {
                total -= 1;
                totalprice -= widget.price;
              });
            }
          },
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.prodName,
                  style: TextStyle(backgroundColor: Colors.black38),
                ),
                background: Image.asset(
                  widget.prodimage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    buttonBuild(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: widget.isFavourite?Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 25,
                      ):Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        widget.prodName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        widget.proddesc,
                        style: TextStyle(color: Colors.grey,fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 50, right: 30),
        child: Row(
          children: [
            Text(
              '${totalprice.toStringAsFixed(2)}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(" "),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        color: Colors.grey[100],
                        offset: Offset(0, 1),
                        spreadRadius: 1),
                  ],
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(40)),
              child: Text(
                "اضافة الي السلة",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              Icons.shopping_basket,
              color: Colors.white,
            )
          ],
        ),
        height: 75.0,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  color: Colors.grey[100],
                  offset: Offset(0, 3),
                  spreadRadius: 4),
            ],
            //color: Colors.red[300],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.blueAccent,
                  Colors.blueAccent[200],
                  Colors.blueAccent[200],
                  Colors.blueAccent,
                ]),
            borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}
