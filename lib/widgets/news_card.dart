import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visionfm/classess/time_ago_format.dart';
import 'package:visionfm/data/colors.dart';
import 'package:visionfm/pages/news_read.dart';

class NewsCard {
  // news main card ----------------------------------------------
  static Widget mainCard({context, news, cardWidth}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewsReadPage(news: news)));
      },
      child: Container(
        width: cardWidth,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: visionWhite,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          boxShadow: [
            BoxShadow(
              color: visionGrey,
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(1.0, 1.0),
            ),
          ],
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    topLeft: Radius.circular(5.0),
                  ),
                  image: DecorationImage(
                    image: news.image != ''
                        ? NetworkImage(news.imagesm)
                        : AssetImage('images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
              child: Text(
                news.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  color: primary,
                  height: 1.3,
                  fontSize: 15.0,
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  width: 180,
                  height: 1,
                  color: visionGrey.withOpacity(0.3),
                ),
                Container(
                  width: 30,
                  height: 3.0,
                  color: primary,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      news.catname,
                      style: TextStyle(
                        color: visionDark,
                        fontSize: 9,
                      ),
                    ),
                    Text(
                      TimeAgoFormat.format(date: DateTime.parse(news.time)),
                      style: TextStyle(
                        color: visionDark,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // news sliders ---------------------------------------------------------
  static Widget slidersCard({context, news}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewsReadPage(news: news)));
      },
      child: Container(
        padding:
            EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: news.image == ''
                      ? AssetImage('images/logo.png')
                      : NetworkImage(news.imagemd),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.1, 0.9],
                  colors: [
                    Colors.black.withOpacity(0.9),
                    visionWhite.withOpacity(0.0),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30.0,
              child: Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                width: 250,
                child: Column(
                  children: [
                    Text(
                      news.title,
                      style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: visionWhite,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  news.catname,
                  style: TextStyle(
                    color: visionBackground,
                    fontSize: 9.0,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: Text(
                TimeAgoFormat.format(date: DateTime.parse(news.time)),
                style: TextStyle(
                  color: visionBackground,
                  fontSize: 9.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
