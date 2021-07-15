import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:visionfm/classess/news_class.dart';
import 'package:visionfm/data/colors.dart';
import 'package:visionfm/models/app_model.dart';
import 'package:visionfm/widgets/news_card.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              model.newsLanguage == "English"
                  ? 'Vision News'
                  : 'Labaran Vision',
              style: TextStyle(
                letterSpacing: 2,
                fontFamily: 'Merienda One',
              ),
            ),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  model.drawerStatus == FSBStatus.FSB_OPEN
                      ? Icons.close
                      : Icons.menu,
                ),
                onPressed: () {
                  model.toggleDrawer(page: 'news');
                },
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.home_outlined),
              onPressed: () => model.pageBack(),
            ),
          ],
        ),
        body: ListView(
          children: [
            FutureBuilder<dynamic>(
              future: model.getHeadLines(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return _buildHeadSlider(snapshot.data, context);
                } else {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Text(
                model.newsLanguage == "English" ? 'News' : 'Labarai',
                style: TextStyle(
                  color: primary,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Merienda One',
                  fontSize: 25,
                ),
              ),
            ),
            FutureBuilder<dynamic>(
              future: model.getTopNews(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return _buildGridView(snapshot.data);
                } else {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _buildHeadSlider(List<NewsClass> headline, context) {
    return Container(
      child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: false,
            viewportFraction: 0.9,
            height: 200,
          ),
          items: getSliders(headline, context)),
    );
  }

  List<Widget> getSliders(List<NewsClass> newsList, context) {
    return newsList
        .map(
          (news) => NewsCard.slidersCard(context: context, news: news),
        )
        .toList();
  }

  Widget _buildGridView(List<NewsClass> topNews) {
    return GridView.builder(
      itemCount: topNews.length,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return NewsCard.mainCard(
            context: context, news: topNews[index], cardWidth: 220.0);
      },
    );
  }
}
