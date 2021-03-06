import 'package:flutter/material.dart';
import 'package:travelapp/ui/dashboard_page.dart';
import 'package:travelapp/ui/explore_page.dart';
import 'package:travelapp/ui/home_page.dart';
import 'package:travelapp/ui/profil_page.dart';
import 'package:travelapp/ui/tours_page.dart';

const String homeRoute = '/homePage';
const String toursRoute = '/toursPage';
const String explorRoute = '/explorePage';
const String profilRoute = '/profilPage';
const String dasbordRoute = '/profilPage';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name){
      case dasbordRoute:
        return MaterialPageRoute(builder: (_) => DashboardPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case toursRoute:
        return MaterialPageRoute(builder: (_) => ToursPage());
      case explorRoute :
        return MaterialPageRoute(builder: (_) => ExplorePage());
      case profilRoute :
        return MaterialPageRoute(builder: (_) => ProfilPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}