import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:visionfm/data/colors.dart';
import 'package:visionfm/data/screens.dart';
import 'package:visionfm/models/app_model.dart';
import 'package:visionfm/widgets/custom_drawer_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(builder: (context, child, model) {
      return SafeArea(
        child: Scaffold(
          body: SwipeDetector(
            onSwipeRight: () {
              model.toggleDrawer();
            },
            onSwipeLeft: () {
              model.toggleDrawer();
            },
            child: FoldableSidebarBuilder(
              drawerBackgroundColor: primary,
              drawer: CustomDrawerWidget(
                closeDrawer: () {
                  model.closeDrawer();
                },
              ),
              screenContents: PageView(
                pageSnapping: true,
                children: Screens.pages,
                controller: model.pageController,
                physics: NeverScrollableScrollPhysics(),
              ),
              status: model.drawerStatus,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.headset_sharp,
                ),
                label: 'Live',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.radio),
                label: 'Stations',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.rss_feed),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_collection),
                label: 'Videos',
              ),
            ],
            currentIndex: model.selectedPageIndex,
            onTap: model.changePage,
            type: BottomNavigationBarType.fixed,
            backgroundColor: primary,
            selectedItemColor: Colors.grey[400],
            unselectedItemColor: visionWhite,
          ),
        ),
      );
    });
  }
}
