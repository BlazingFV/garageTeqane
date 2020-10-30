// import 'package:flutter/material.dart';
// import 'package:fluttericon/mfg_labs_icons.dart';
// import 'package:heragtqnee/screens/product_detail.dart';
// class Favourite extends StatefulWidget {
//   @override
//   _FavouriteState createState() => _FavouriteState();
// }
// class _FavouriteState extends State<Favourite> {
//   bool _gridView = true;
//   List elements = [
//     {
//       'id': '1',
//       'images': 'images/3.jpg',
//       'title': 'العنوان الخاص يكتب هنا باختصار لاظهار الاعلان',
//       'price': 7.85000,
//       'sale': false,
//     },
//     {
//       'id': '1',
//       'images': 'images/3.jpg',
//       'title': 'العنوان الخاص يكتب هنا باختصار لاظهار الاعلان',
//       'price': 5.80000,
//       'sale': true,
//     },
//     {
//       'id': '1',
//       'images': 'images/3.jpg',
//       'title': 'العنوان الخاص يكتب هنا باختصار لاظهار الاعلان',
//       'price': 7.85000,
//       'sale': true,
//     },
//     {
//       'id': '0',
//       'images': 'images/3.jpg',
//       'title': 'العنوان الخاص يكتب هنا باختصار لاظهار الاعلان',
//       'price': 5.80000,
//       'sale': false,
//     },
//     {
//       'id': '1',
//       'images': 'images/3.jpg',
//       'title': 'العنوان الخاص يكتب هنا باختصار لاظهار الاعلان',
//       'price': 7.85000,
//       'sale': true,
//     },
//     {
//       'id': '0',
//       'images': 'images/3.jpg',
//       'title': 'العنوان الخاص يكتب هنا باختصار لاظهار الاعلان',
//       'price': 7.85000,
//       'sale': true,
//     },
//     {
//       'id': '0',
//       'images': 'images/3.jpg',
//       'title': 'العنوان الخاص يكتب هنا باختصار لاظهار الاعلان',
//       'price': 7.85000,
//       'sale': false,
//     },
//     {
//       'id': '1',
//       'images': 'images/3.jpg',
//       'title': 'العنوان الخاص يكتب هنا باختصار لاظهار الاعلان',
//       'price': 7.85000,
//       'sale': false,
//     },
//     {
//       'id': '0',
//       'images': 'images/3.jpg',
//       'title': 'العنوان الخاص يكتب هنا باختصار لاظهار الاعلان',
//       'price': 7.850,
//       'sale': true,
//     },
//   ];
//   String dropVal1 = 'السعر';
//   void dropChange(String value) {
//     setState(() {
//       dropVal1 = value;
//     });
//   }
//   Widget headerBuild() {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 16.0,
//         top: 16,
//       ),
//       child: Row(
//         children: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 _gridView = !_gridView;
//               });
//             },
//             icon: !_gridView
//                 ? Icon(
//                     MfgLabs.th_thumb,
//                     color: Colors.blueAccent,
//                   )
//                 : Icon(
//                     Icons.format_list_bulleted,
//                     color: Colors.blueAccent,
//                   ),
//           ),
//           Expanded(child: Text('')),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.045,
//             width: MediaQuery.of(context).size.width * 0.45,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.grey,
//                 width: 1,
//               ),
//               shape: BoxShape.rectangle,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(right: 8.0),
//               child: DropdownButton(
//                 isDense: true,
//                 icon: Icon(
//                   Icons.keyboard_arrow_down,
//                 ),
//                 hint: Text('الترتيب حسب'),
//                 onChanged: dropChange,
//                 value: dropVal1,
//                 items: <String>[
//                   'السعر',
//                   'من الاقدم الي الاحدث',
//                   'من الاحدث الي الاقدم'
//                 ]
//                     .map((value) => DropdownMenuItem(
//                           child: Text(
//                             value,
//                           ),
//                           value: value,
//                         ))
//                     .toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Column(children: [
//         headerBuild(),
//         GridView.builder(
//           primary: false,
//           shrinkWrap: true,
//           itemCount: elements.length,
//           itemBuilder: (context, i) => SingleProduct(
//             prodDesc: elements[i]['title'],
//             prodId: elements[i]['id'],
//             prodimage: elements[i]['images'],
//             prodname: elements[i]['title'],
//             price:elements[i]['price'] ,
//             gridView: _gridView,
//           ),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: _gridView ? 2 : 1,
//               childAspectRatio: _gridView ? 0.6 : 1.3),
//         ),
//       ]),
//     );
//   }
// }
// class SingleProduct extends StatelessWidget {
//   final String prodId;
//   final String prodname;
//   final String prodimage;
//   final String prodDesc;
//   final bool gridView;
//   final double price;
//   SingleProduct(
//       {this.prodId,
//       this.prodDesc,
//       this.prodimage,
//       this.prodname,
//       this.gridView,
//       this.price});
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => ProductDetail(
//                   prodName: prodname,
//                   proddesc: prodDesc,
//                   prodid: prodId,
//                   price: price,
//                   prodimage: prodimage,
//                 )));
//       },
//       child: Container(
//         margin: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5), color: Colors.white),
//         padding: EdgeInsets.all(10),
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 width: gridView
//                     ? MediaQuery.of(context).size.width / 2
//                     : MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height / 4,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image: AssetImage(prodimage),
//                       )),
//                 ),
//               ),
//               Expanded(
//                 child: Text(
//                   prodname,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.favorite_border,
//                     color: Colors.red,
//                   ),
//                   Expanded(
//                     child: Text(''),
//                   ),
//                   Text(prodId),
//                   Icon(Icons.star_border, color: Colors.yellow),
//                 ],
//               ),
//             ]),
//       ),
//     );
//   }
// }