import 'package:flutter/material.dart';
import 'package:heragtqnee/screens/register.dart';
import 'package:heragtqnee/widgets/home.dart';

class Mydrawrer extends StatefulWidget {
  @override
  _MydrawrerState createState() => _MydrawrerState();
}

class _MydrawrerState extends State<Mydrawrer> {
  Widget drawerIcon({String text, Function func, IconData icon}) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(children: <Widget>[
        InkWell(
          onTap: func,
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            leading: Icon(
              icon,
              color: Colors.blueAccent,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 15,
            left: 15,
          ),
          child: Divider(
            color: Colors.grey[500],
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Container(
      child: Drawer(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  'abouassi',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                accountEmail: Text('mohamedabouassi96@gmail.com',
                    style: TextStyle(color: Colors.grey)),
                currentAccountPicture: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/4.jpg'),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.grey[100]),
              ),
              drawerIcon(
                  text: 'الصفحه الرئيسيه',
                  func: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Home(
                              showFavourite: false,
                            )));
                  },
                  icon: Icons.home),
              Theme(
                data: theme,
                child: ExpansionTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.blueAccent,
                  ),
                  title: Text(
                    'حسابي',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  children: [
                    drawerIcon(
                        text: 'تغير الاعدادت الشخصيه',
                        func: () {},
                        icon: Icons.settings),
                    drawerIcon(
                        text: 'تغير كلمة المرور',
                        func: () {},
                        icon: Icons.settings),
                  ],
                ),
              ),
              Theme(
                data: theme,
                child: ExpansionTile(
                  leading: Icon(
                    Icons.category,
                    color: Colors.blueAccent,
                  ),
                  title: Text(
                    'الأقسام',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  children: [
                    drawerIcon(
                      text: 'الكل',
                      func: () {},
                      //  icon: Icons.settings,
                    ),
                    drawerIcon(
                      text: 'حراج السيارات',
                      func: () {},
                      // icon: Icons.settings,
                    ),
                    drawerIcon(
                      text: 'حراج العقارات',
                      func: () {},
                      //icon: Icons.settings,
                    ),
                    drawerIcon(
                      text: 'المزادات',
                      func: () {},
                      //icon: Icons.settings,
                    ),
                    drawerIcon(
                      text: 'الأثاث',
                      func: () {},
                      //icon: Icons.settings,
                    ),
                  ],
                ),
              ),
              drawerIcon(
                  text: 'مفضلاتي',
                  func: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Home(
                              showFavourite: true,
                            )));
                  },
                  icon: Icons.favorite),
              drawerIcon(text: 'من نحن', func: () {}, icon: Icons.message),
              drawerIcon(text: 'مركز الدعم', func: () {}, icon: Icons.call),
              drawerIcon(
                  text: 'تسجيل الخروج',
                  func: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  icon: Icons.logout),
            ],
          ),
        ),
      ),
    );
  }
}
