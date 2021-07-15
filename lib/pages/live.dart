import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:visionfm/data/colors.dart';
import 'package:visionfm/models/app_model.dart';
import 'package:visionfm/routes/extra.dart';
import 'package:visionfm/widgets/circular_soft_button.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            ScopedModelDescendant<AppModel>(builder: (context, child, model) {
          return Container(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: visionBackground,
                    ),
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage('images/play_bg.gif'),
                    //     fit: BoxFit.fitWidth,
                    //   ),
                    // ),
                    child: Column(
                      children: [
                        // Navbar buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircularSoftButton(
                              radius: model.drawerStatus == FSBStatus.FSB_OPEN
                                  ? 15
                                  : 20,
                              color: primary,
                              icon: TextButton(
                                style: Extra.buttonStyle(),
                                child: Icon(
                                  model.drawerStatus == FSBStatus.FSB_OPEN
                                      ? Icons.close
                                      : Icons.menu,
                                  color: visionWhite,
                                  size: model.drawerStatus == FSBStatus.FSB_OPEN
                                      ? 15
                                      : 20,
                                ),
                                onPressed: () {
                                  model.toggleDrawer(page: 'home');
                                },
                              ),
                            ),
                            CircularSoftButton(
                              radius: 20,
                              color: primary,
                              icon: TextButton(
                                style: Extra.buttonStyle(),
                                child: Icon(
                                  Icons.radio,
                                  color: visionWhite,
                                  size: 20,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                        // Album Art
                        Expanded(
                          flex: 4,
                          child: Stack(
                            fit: StackFit.passthrough,
                            children: [
                              Visibility(
                                visible: model.playing ? true : false,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.all(20),
                                  child: Image(
                                    image: AssetImage('images/eq1.gif'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: model.playing ? 0.9 : 1,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.all(20),
                                  child: Image(
                                    image: AssetImage(
                                        'images/icons/vmsOrange.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  decoration: Extra.albumBoxDecoration(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Station frequency
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              model.nowplaying,
                              style: TextStyle(
                                color: primary,
                                fontSize: 25,
                                fontFamily: 'Merienda One',
                              ),
                            ),
                          ),
                        ),
                        // Slider
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: SliderTheme(
                              data: SliderThemeData(
                                trackHeight: 5,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 5),
                              ),
                              child: Slider(
                                value: model.volume,
                                activeColor: primary,
                                inactiveColor: visionGrey,
                                onChanged: (value) {
                                  model.setVolume(value);
                                },
                                min: 0.0,
                                max: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 10,
                              ),
                              child: CircularSoftButton(
                                radius: 25,
                                icon: TextButton(
                                  style: Extra.buttonStyle(),
                                  child: Icon(
                                    Icons.skip_previous,
                                    color: visionWhite,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    model.prevStation();
                                  },
                                ),
                                color: primary,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 40,
                                horizontal: 25,
                              ),
                              child: CircularSoftButton(
                                radius: 40,
                                icon: TextButton(
                                  style: Extra.buttonStyle(),
                                  child: Icon(
                                    model.playing
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color:
                                        model.playing ? primary : visionWhite,
                                    size: 50,
                                  ),
                                  onPressed: () {
                                    model.playAndPause();
                                  },
                                ),
                                color:
                                    model.playing ? visionBackground : primary,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 10,
                              ),
                              child: CircularSoftButton(
                                radius: 25,
                                icon: TextButton(
                                  style: Extra.buttonStyle(),
                                  child: Icon(
                                    Icons.skip_next,
                                    color: visionWhite,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    model.nextStation();
                                  },
                                ),
                                color: primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
