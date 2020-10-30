import 'package:flutter/material.dart';
import 'package:heragtqnee/provider/product.dart';
import 'package:heragtqnee/provider/products.dart';
import 'package:heragtqnee/screens/product_detail.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Item extends StatefulWidget {
  final String image;
  final String id;
  final String title;
  final String desc;
  final double price;
  final bool sale;
  final bool gridView;
  final String category;
  final String staticCategory;
  bool isFavourite;

  Item(
      {this.image,
      this.price,
      this.sale,
      this.title,
      this.gridView,
      this.isFavourite,
      this.staticCategory,
      this.category,
      this.id,
      this.desc});
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("a7a=${widget.isFavourite}");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetail(
                  prodName: widget.title,
                  proddesc: widget.desc,
                  prodid: widget.id,
                  prodimage: widget.image,
                  price: widget.price,
                  isFavourite: widget.isFavourite,
                )));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 4,
        margin: EdgeInsets.only(
            top: 10,
            bottom: 10,
            right: widget.gridView ? 10 : 25,
            left: widget.gridView ? 10 : 25),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: widget.gridView
                      ? MediaQuery.of(context).size.width / 2
                      : MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        widget.image,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.isFavourite = !widget.isFavourite;
                                });

                                widget.isFavourite
                                    ? Fluttertoast.showToast(
                                        msg: "تم اضافة العنصر الي المفضلة",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0)
                                    : Fluttertoast.showToast(
                                        msg: "تم ازالة العنصر من المفضلة",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                              },
                              icon: Icon(widget.isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                              color: Colors.red,
                            ),
                            Expanded(
                              child: Text(''),
                            ),
                            Container(
                              constraints:
                                  BoxConstraints(maxWidth: 100, minWidth: 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueAccent,
                              ),
                              child: FittedBox(
                                child: Text(
                                  '${widget.price.toStringAsFixed(2)} ر.س',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (widget.sale)
              Positioned(
                child: Container(
                  color: Colors.red,
                  child: Center(
                      child: FittedBox(
                    child: Text(
                      'قابل\nللنقاش',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
                ),
                height: 50,
                left: 10,
              ),
          ],
        ),
      ),
    );
  }
}
