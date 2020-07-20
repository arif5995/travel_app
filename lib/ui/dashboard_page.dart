import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:travelapp/ui/city_page.dart';
import 'package:travelapp/ui/explore_page.dart';
import 'package:travelapp/ui/home_page.dart';
import 'package:travelapp/ui/profil_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  //Selected index page
  int selectedIndex = 0;

  //List screen page
  List<Widget> pageList = [
    HomePage(),
    CityPage(),
    ExplorePage(),
    ProfilPage()
  ];

  @override
  void initState() {
    super.initState();
    //_checkGps();
  }

  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Can't get gurrent location"),
              content:
              const Text('Please make sure you enable GPS and try again'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    final AndroidIntent intent = AndroidIntent(
                        action: 'android.settings.LOCATION_SOURCE_SETTINGS');

                    intent.launch();
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  //Navbar Item
  final _bottomNavbarItem = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("Home")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center),
        title: Text("Collections")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.search),
        title: Text("Explore")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        title: Text("Profil")
    ),
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomNavbarItem,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        backgroundColor: Colors.white,
        onTap: _onNavBarTapped,
      ),
    );
  }
}
