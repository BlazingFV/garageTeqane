import 'package:flutter/cupertino.dart';
import 'package:heragtqnee/provider/product.dart';
import 'package:heragtqnee/widgets/categories.dart';

class Products with ChangeNotifier {
  List<Product> _iteams = [
    Product(
      id: '1',
      image: 'images/5.jpg',
      price: 500.566,
      isFavourite: false,
      sale: true,
      category: 'حراج السيارات',
      title: 'مية سلام علي سلامكو ياللي المصلحة اصلها تمامكو',
      desc:
          'جدعنتي انا خلاص لغيتها عشان في ناس استغلتها والي فاكر قلبي طيب كل سنة وهو طيب',
    ),
    Product(
      id: '2',
      image: 'images/6.jpg',
      price: 800.63,
      isFavourite: false,
      category: 'حراج العقار',
      sale: false,
      title: 'تعبنا وشقينا ومحدش خيره علينا',
      desc:
          'احنا اصحاب بجد واخرك معانا حاره سد ولو هاتمشيها عافيه هنتعارك ومش هانمشيها ود',
    ),
    Product(
      id: '3',
      image: 'images/7.jpeg',
      price: 900.56,
      sale: false,
      category: 'المزادات',
      isFavourite: false,
      title: 'لو انت شايل مني اعمل صونار وطمني',
      desc: 'بكره تروح يا ناكر خيري و تشوف زماني من زمن زمن غيري',
    ),
    Product(
      id: '4',
      image: 'images/8.jpg',
      price: 1000.39,
      sale: true,
      category: 'الاثاث',
      isFavourite: false,
      title: 'متحلمش مش هتعرف تجيب عجلتها',
      desc:
          'الحلوة من اليابان صاحبها راجل غلبان.. النزاهة بتاعتنا بس الظروف منعتنا',
    ),
    Product(
      id: '5',
      image: 'images/9.jpg',
      price: 1925.1,
      sale: true,
       category: 'المزادات',
      isFavourite: false,
      title: 'تركب هدلعك تنزل هدفعك',
      desc: 'رميت همومي في البحر طلع السمك يُلطم',
    ),
    Product(
      id: '6',
      image: 'images/10.jpg',
      price: 52063.2,
      sale: false,
          category: 'حراج العقار',
      isFavourite: true,
      title: 'ما تبحلقش كده يا لوح، دي جت بطلوع الروووح',
      desc: ' طلبت من ربنا إدانى .. وعين الناس مش سيبانى',
    ),
    Product(
      id: '7',
      image: 'images/11.jpg',
      price: 125.3,
      sale: true,
      category: 'حراج السيارات',
      isFavourite: true,
      title: 'متقولش دى بكام دى جايه بدهب المدام',
      desc: ' ريحها فى الغيارات ودلعها فى المطبات وخد بالك من الملفات',
    ),
  ];
  List<Product> get iteams {
    return [..._iteams];
  }

  List<Product> get favourite {
    return _iteams.where((element) => element.isFavourite).toList();
  }



}
