import 'package:flutter/material.dart';
import 'package:travelapp/ui/explore_page.dart';
import 'package:travelapp/ui/home_page.dart';
import 'package:travelapp/ui/profil_page.dart';
import 'package:travelapp/ui/tours_page.dart';

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
    ToursPage(),
    ExplorePage(),
    ProfilPage()
  ];

  //Navbar Item
  final _bottomNavbarItem = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("Home")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center),
        title: Text("Tours")
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
