import 'package:flutter/material.dart';
import 'package:visionfm/pages/home.dart';
import 'package:visionfm/pages/live.dart';
import 'package:visionfm/pages/news.dart';
import 'package:visionfm/pages/news_category.dart';
import 'package:visionfm/pages/news_read.dart';
import 'package:visionfm/pages/not_found.dart';
import 'package:visionfm/pages/stations.dart';
import 'package:visionfm/pages/videos.dart';
import 'package:visionfm/routes/route_constants.dart';

class Routers {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case livePageRoute:
        return MaterialPageRoute(builder: (_) => LivePage());
      case stationsPageRoute:
        return MaterialPageRoute(builder: (_) => StationsPage());
      case newsPageRoute:
        return MaterialPageRoute(builder: (_) => NewsPage());
      case newsCategoryPageRoute:
        return MaterialPageRoute(builder: (_) => NewsCategoryPage());
      case newsReadPageRoute:
        return MaterialPageRoute(builder: (_) => NewsReadPage());
      case videosPageRoute:
        return MaterialPageRoute(builder: (_) => VideosPage());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
