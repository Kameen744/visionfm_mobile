import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:visionfm/data/colors.dart';
import 'package:visionfm/pages/home.dart';

import 'data/themes.dart';
import 'models/app_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp(model: AppModel()));
  });
}

class MyApp extends StatelessWidget {
  final AppModel model;
  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.themeList[model.selectedThemeIndex],
        home: SplashScreen(
          seconds: 5,
          navigateAfterSeconds: HomePage(),
          title: Text(
            'Vision FM Radio',
            style: TextStyle(
              color: primary,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Merienda One',
            ),
          ),
          image: Image.asset('images/icons/vmsOrange.png'),
          backgroundColor: visionBackground,
          styleTextUnderTheLoader: TextStyle(),
          photoSize: 100.0,
          onClick: () => print("Loading..."),
          loaderColor: primary,
        ),
      ),
      // MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   theme: Themes.themeList[model.selectedThemeIndex],
      //   onGenerateRoute: Routers.onGenerateRoute,
      //   initialRoute: homePageRoute,
      // ),
    );
  }
}
