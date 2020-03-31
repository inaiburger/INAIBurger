import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'card_screen.dart';
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
      {'page': NewsScreen(), 'title': 'News'},
      {'page': CardScreen(), 'title': 'Card'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        color: Colors.brown,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.receipt, size: 30, color: Colors.white),
          Icon(Icons.credit_card, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          _selectPage(index);
        },
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
          color: Colors.black,
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
                text: 'Contacts',
              ),
              _createDrawerItem(
                icon: Icons.settings,
                text: 'Settings',
              ),
              Divider(
                color: Colors.white,
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
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain, image: AssetImage('assets/burger.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("inai Burger",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }
}
