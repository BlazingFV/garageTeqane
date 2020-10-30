import 'package:flutter/material.dart';
import 'package:heragtqnee/provider/product.dart';
import 'package:heragtqnee/provider/products.dart';
import 'package:heragtqnee/screens/tab_bar.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Product()),
        ChangeNotifierProvider.value(value: Products()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
        title: 'حراج تقني',
      ),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new TabScreen(),
      imageBackground: AssetImage('images/1.jpg'),
    );
  }
}
