import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:visionfm/classess/time_ago_format.dart';
import 'package:visionfm/classess/video_class.dart';
import 'package:visionfm/data/colors.dart';
import 'package:visionfm/models/app_model.dart';
import 'package:visionfm/pages/video_player.dart';

class VideosPage extends StatefulWidget {
  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Videos',
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
                  model.toggleDrawer(page: 'video');
                },
              );
            },
          ),
        ),
        body: FutureBuilder<dynamic>(
          future: model.getVideoList(model.selectedVideoPage),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, index) {
                    return _buildVideos(snapshot.data[index], context);
                  });
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
      );
    });
  }

  _buildVideos(Video video, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayer(
              video: video,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 110.0,
        decoration: BoxDecoration(
          color: visionWhite,
          boxShadow: [
            BoxShadow(
              color: visionGrey,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Text(
                      video.title.length > 35
                          ? video.title.toUpperCase().substring(0, 35)
                          : video.title.toUpperCase(),
                      style: TextStyle(
                        color: primary,
                        fontSize: 18,
                        fontFamily: 'Source Sans Pro',
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      DateFormat('dd-MM-yyyy – kk:mm')
                          .format(DateTime.parse(video.publishedAt)),
                      style: TextStyle(
                        color: primary,
                        fontSize: 18,
                        fontFamily: 'Source Sans Pro',
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      TimeAgoFormat.format(
                          date: DateTime.parse(video.publishedAt)),
                      style: TextStyle(
                        color: primary,
                        fontSize: 12,
                        fontFamily: 'Source Sans Pro',
                        letterSpacing: 1.2,
                      ),
                      textAlign: TextAlign.end,
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
