import 'package:flutter/cupertino.dart';
import 'package:visionfm/pages/live.dart';
import 'package:visionfm/pages/news.dart';
import 'package:visionfm/pages/news_read.dart';
import 'package:visionfm/pages/stations.dart';
import 'package:visionfm/pages/videos.dart';

class Screens {
  static final List<Widget> pages = [
    LivePage(),
    StationsPage(),
    NewsPage(),
    VideosPage(),
    NewsReadPage()
  ];
}
