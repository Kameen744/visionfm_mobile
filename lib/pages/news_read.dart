import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:social_share/social_share.dart';
import 'package:visionfm/classess/news_class.dart';
import 'package:visionfm/data/colors.dart';
import 'package:visionfm/routes/extra.dart';
import 'package:visionfm/widgets/circular_soft_button.dart';

class NewsReadPage extends StatelessWidget {
  final NewsClass news;
  NewsReadPage({this.news});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: visionBackground,
      appBar: AppBar(
        title: Center(
          child: Text(
            news.catname,
            style: TextStyle(
              letterSpacing: 2,
              fontFamily: 'Merienda One',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 325,
              decoration: BoxDecoration(
                color: primary,
                image: DecorationImage(
                  image: NetworkImage(news.image),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: visionBackground,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 50.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularSoftButton(
                                radius: 23,
                                color: twitter,
                                icon: TextButton(
                                  style: Extra.buttonStyle(),
                                  child: FaIcon(
                                    FontAwesomeIcons.twitter,
                                    color: visionWhite,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    SocialShare.shareTwitter(
                                      news.title,
                                      hashtags: ["Vision News"],
                                      url: news.url,
                                      trailingText: "\n ${news.catname}",
                                    ).then((data) {
                                      print(data);
                                    });
                                  },
                                ),
                              ),
                              CircularSoftButton(
                                radius: 23,
                                color: whatsapp,
                                icon: TextButton(
                                  style: Extra.buttonStyle(),
                                  child: FaIcon(
                                    FontAwesomeIcons.whatsapp,
                                    color: visionWhite,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    SocialShare.shareWhatsapp(
                                      "${news.title} \n ${news.url}",
                                    ).then((data) {
                                      print(data);
                                    });
                                  },
                                ),
                              ),
                              CircularSoftButton(
                                radius: 23,
                                color: facebook,
                                icon: TextButton(
                                  style: Extra.buttonStyle(),
                                  child: FaIcon(
                                    FontAwesomeIcons.facebook,
                                    color: visionWhite,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    await Share.share(news.url);
                                  },
                                ),
                              ),
                              CircularSoftButton(
                                radius: 23,
                                color: primary,
                                icon: TextButton(
                                  style: Extra.buttonStyle(),
                                  child: FaIcon(
                                    FontAwesomeIcons.envelope,
                                    color: visionWhite,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    SocialShare.shareSms(
                                      news.title,
                                      url: "\n ${news.url}",
                                      trailingText: "\n ${news.catname}",
                                    ).then((data) {
                                      print(data);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: primary),
                        Html(
                          data: news.detailsread,
                          style: {
                            'p': Style(
                                color: Colors.black,
                                fontSize: FontSize(18),
                                // fontFamily: 'Source Sans Pro',
                                letterSpacing: 1.3,
                                wordSpacing: 2,
                                lineHeight: LineHeight.number(1.2)),
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
