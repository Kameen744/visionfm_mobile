import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:visionfm/data/colors.dart';
import 'package:visionfm/data/stations_data.dart';
import 'package:visionfm/models/app_model.dart';
import 'package:visionfm/models/station_model.dart';
import 'package:visionfm/routes/extra.dart';
import 'package:visionfm/widgets/circular_soft_button.dart';

class StationsPage extends StatefulWidget {
  @override
  _StationsPageState createState() => _StationsPageState();
}

class _StationsPageState extends State<StationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            ScopedModelDescendant<AppModel>(builder: (context, child, model) {
          return Container(
            color: visionBackground,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      child: CircularSoftButton(
                        radius: 20,
                        color: primary,
                        icon: TextButton(
                          style: Extra.buttonStyle(),
                          child: Icon(
                            Icons.arrow_back,
                            color: visionWhite,
                            size: 25,
                          ),
                          onPressed: () {
                            model.pageBack();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 25,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: visionBackground,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: visionWhite,
                                offset: Offset(0, 2),
                                blurRadius: 30,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: Stations.list.length,
                            itemBuilder: (BuildContext context, int stIndex) {
                              Station station = Stations.list[stIndex];
                              return Column(
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: model.isSeclected(stIndex)
                                            ? primary
                                            : visionBackground,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            flex: 10,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Vision ${station.location}',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: model.isSeclected(
                                                              stIndex)
                                                          ? visionWhite
                                                          : primary,
                                                      fontFamily:
                                                          'Merienda One',
                                                      letterSpacing: 2,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    station.frequency,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: model.isSeclected(
                                                              stIndex)
                                                          ? visionWhite
                                                          : primary,
                                                      fontFamily:
                                                          'Merienda One',
                                                      letterSpacing: 2,
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.only(
                                                      right: 50),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: FaIcon(
                                                model.isSeclected(stIndex)
                                                    ? FontAwesomeIcons.pause
                                                    : FontAwesomeIcons.play,
                                                color:
                                                    model.isSeclected(stIndex)
                                                        ? visionWhite
                                                        : primary,
                                                size: 18,
                                              )),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      model.changeStation(stIndex);
                                    },
                                  ),
                                  Divider(
                                    height: 2,
                                    color: visionGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
