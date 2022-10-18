import 'package:flutter/material.dart';
import 'package:onekgp_app/ui/modules/travel/add_post.dart';
import 'package:onekgp_app/ui/modules/travel/travel_feed.dart';

class RouteServices {
  static const home = "home";
  static const travel_add = "travelAdd";
  static const login = "login";

  static Route<dynamic> routeHandler(RouteSettings settings) {
    switch (settings.name) {
      case RouteServices.home:
        return MaterialPageRoute(builder: (context) => const TravelFeed());

      case RouteServices.travel_add:
        return MaterialPageRoute(builder: (context) => const AddTravelPost());

      default:
        return MaterialPageRoute(builder: (context) => const TravelFeed());
    }
  }
}
