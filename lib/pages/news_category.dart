import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:visionfm/classess/category_class.dart';
import 'package:visionfm/models/app_model.dart';
import 'package:visionfm/widgets/news_card.dart';

class NewsCategoryPage extends StatelessWidget {
  final CategoryClass category;
  NewsCategoryPage({this.category});
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              category.name,
              style: TextStyle(
                letterSpacing: 2,
                fontFamily: 'Merienda One',
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            FutureBuilder<dynamic>(
              future: model.getCategoryNews(category.id),
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

  _buildGridView(topNews) {
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
