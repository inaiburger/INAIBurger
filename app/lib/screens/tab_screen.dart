import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inaiburger/screens/contacts_screen.dart';
import 'package:inaiburger/screens/custom_constructor.dart';
import 'constrictor_menu_screen.dart';
import 'cart_screen.dart';
import 'news_screen.dart';
import 'map_screen.dart';
import 'dashboard_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': DashboardScreen(), 'title': 'InaiBurger'},
      {'page': ConstructorMenu(), 'title': 'Burger Constructor'},
      {'page': NewsScreen(), 'title': 'News'},
      {'page': MapScreen(), 'title': 'Map'},
      {'page': CartScreen(), 'title': 'Cart'},
    ];
    super.initState();
  }

  _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(163, 8, 11, 1),
        centerTitle: true,
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(163, 8, 11, 1),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectPageIndex,
        selectedItemColor: Colors.amberAccent,
        selectedFontSize: 15,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          _selectPage(index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.widgets,
              size: 30,
            ),
            title: Text(
              'Constructor',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              size: 30,
            ),
            title: Text('News', style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              size: 30,
            ),
            title: Text('Map', style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            title: Text('Cart', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _createHeader(),
              _createDrawerItem(
                icon: Icons.account_circle,
                text: 'Account',
              ),
              _createDrawerItem(
                icon: Icons.contacts,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ContactScreen()),
                  );
                },
                text: 'Contacts',
              ),
              _createDrawerItem(
                  icon: Icons.settings,
                  text: 'Settings',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CustomConstructor()));
                  }),
              Divider(
                color: Colors.black,
              ),
              _createDrawerItem(
                  icon: Icons.bug_report, text: 'Report an issue'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _createHeader() {
    return Container(
      // color: Color.fromRGBO(163, 8, 11, 1),
      child: DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: Row(children: <Widget>[
            Container(
              width: 40,
              height: 40,
              child: Image.asset('assets/images/logo.jpg'),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'InaiBurger',
              style: TextStyle(fontSize: 30),
            )
          ])),
    );
  }
}
