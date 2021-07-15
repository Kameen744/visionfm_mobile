import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visionfm/data/colors.dart';
import 'package:visionfm/models/app_model.dart';
import 'package:visionfm/pages/news_category.dart';
import 'package:visionfm/routes/extra.dart';
import 'package:visionfm/widgets/circular_soft_button.dart';

class CustomDrawerWidget extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawerWidget({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: ScopedModelDescendant<AppModel>(builder: (context, child, model) {
        return Container(
          color: visionWhite,
          width: mediaQuery.size.width * 0.60,
          height: mediaQuery.size.height,
          child: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  height: 200,
                  color: primary,
                  margin: EdgeInsets.only(bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "images/icons/vmsOrange.png",
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Vision FM Radio",
                        style: TextStyle(
                          color: visionWhite,
                          letterSpacing: 2,
                          fontFamily: 'Merienda One',
                        ),
                      ),
                    ],
                  )),
              model.loadingCategories ? LinearProgressIndicator() : SizedBox(),
              model.drawerPage == 'news'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextButton(
                            onPressed: () {
                              model.changeLanguage('English');
                            },
                            child: Text(
                              'English',
                              style: TextStyle(
                                color: visionWhite,
                                letterSpacing: 1.2,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              // primary: Colors.white,
                              backgroundColor: model.newsLanguage == 'English'
                                  ? primary
                                  : visionGrey,
                              onSurface: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextButton(
                            onPressed: () {
                              model.changeLanguage('Hausa');
                            },
                            child: Text(
                              'Hausa',
                              style: TextStyle(
                                color: visionWhite,
                                letterSpacing: 1.2,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              // primary: Colors.white,
                              backgroundColor: model.newsLanguage == 'Hausa'
                                  ? primary
                                  : visionGrey,
                              onSurface: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
              Column(
                children: getDrawerList(context, model),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(color: primary),
                    Center(
                      child: Text(
                        'Follow us',
                        style: TextStyle(
                          color: primary,
                          letterSpacing: 5,
                        ),
                      ),
                    ),
                    Divider(color: primary),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: CircularSoftButton(
                            radius: 18,
                            color: twitter,
                            icon: TextButton(
                              style: Extra.buttonStyle(),
                              child: FaIcon(
                                FontAwesomeIcons.twitter,
                                color: visionWhite,
                                size: 20,
                              ),
                              onPressed: () {
                                _launchSocial(
                                    'https://twitter.com/visionfmnigeria',
                                    'https://twitter.com/visionfmnigeria');
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: CircularSoftButton(
                            radius: 18,
                            color: facebook,
                            icon: TextButton(
                              style: Extra.buttonStyle(),
                              child: FaIcon(
                                FontAwesomeIcons.facebook,
                                color: visionWhite,
                                size: 20,
                              ),
                              onPressed: () {
                                _launchSocial(
                                    'https://www.facebook.com/VisionFMNigeria',
                                    'https://www.facebook.com/VisionFMNigeria');
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: CircularSoftButton(
                            radius: 18,
                            color: instagram,
                            icon: TextButton(
                              style: Extra.buttonStyle(),
                              child: FaIcon(
                                FontAwesomeIcons.instagram,
                                color: visionWhite,
                                size: 20,
                              ),
                              onPressed: () {
                                _launchSocial(
                                    'https://www.instagram.com/visionfmnigeria/',
                                    'https://www.instagram.com/visionfmnigeria/');
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: CircularSoftButton(
                            radius: 18,
                            color: youtube,
                            icon: TextButton(
                              style: Extra.buttonStyle(),
                              child: FaIcon(
                                FontAwesomeIcons.youtube,
                                color: visionWhite,
                                size: 18,
                              ),
                              onPressed: () {
                                _launchSocial(
                                    'https://www.youtube.com/channel/UCuzCz0un-HUVsI5vgZ8F6IQ',
                                    'https://www.youtube.com/channel/UCuzCz0un-HUVsI5vgZ8F6IQ');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: primary)
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  List<Widget> getDrawerList(context, AppModel model) {
    switch (model.drawerPage) {
      case ('home'):
        return buildHomeList(model);
        break;
      case ('video'):
        return buildVideoList(context, model);
        break;
      default:
        return buildCategories(context, model);
        break;
    }
  }

  List<Widget> buildHomeList(AppModel model) {
    return model.navNames
        .asMap()
        .map((i, name) => MapEntry(
            i,
            ListTile(
              onTap: () {
                model.changePage(i);
              },
              leading: name[1],
              title: Text(
                name[0],
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Sans Pro',
                ),
              ),
              trailing: Icon(Icons.arrow_right),
              selected: model.selectedPageIndex == i ? true : false,
              selectedTileColor: visionBackground,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            )))
        .values
        .toList();
  }

  List<Widget> buildCategories(context, AppModel model) {
    if (model.categories != null) {
      return model.categories.map((cat) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsCategoryPage(category: cat)),
            );
          },
          leading: FaIcon(FontAwesomeIcons.bars),
          title: Text(
            cat.name,
            style: TextStyle(
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontFamily: 'Source Sans Pro',
            ),
          ),
          trailing: Icon(Icons.arrow_right),
          selected: model.selectedCategory == cat.id ? true : false,
          selectedTileColor: visionBackground,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        );
      }).toList();
    } else {
      return [CircularProgressIndicator()];
    }
  }

  List<Widget> buildVideoList(context, AppModel model) {
    return model.videoPages
        .asMap()
        .map((i, page) => MapEntry(
            i,
            ListTile(
              onTap: () {
                model.changeVideoPage(i);
                model.changePage(3);
              },
              leading: FaIcon(FontAwesomeIcons.objectGroup),
              title: Text(
                page,
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Sans Pro',
                ),
              ),
              trailing: Icon(Icons.arrow_right),
              selected: model.selectedVideoPage == i ? true : false,
              selectedTileColor: visionBackground,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            )))
        .values
        .toList();
  }

  void _launchSocial(String url, String fallbackUrl) async {
    // Don't use canLaunch because of fbProtocolUrl (fb://)
    try {
      bool launched =
          await launch(url, forceSafariVC: false, forceWebView: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }
}
