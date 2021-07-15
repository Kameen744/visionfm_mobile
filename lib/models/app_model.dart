import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:visionfm/classess/category_class.dart';
import 'package:visionfm/classess/news_class.dart';
import 'package:visionfm/classess/video_class.dart';
import 'package:visionfm/data/colors.dart';
import 'package:visionfm/data/stations_data.dart';
import 'package:visionfm/data/themes.dart';
import 'package:visionfm/repositories/channel_repository.dart';
import 'package:visionfm/repositories/news_repository.dart';

class AppModel extends Model {
  //initialise
  AppModel() {
    // openPlayer(selectedStationIndex, false);
    getNews();
    getVideos();
  }
  // page navigation --------------------------------------------
  int selectedPageIndex = 0;
  final PageController pageController = PageController();
  void changePage(int pageIndex) {
    if (pageIndex == 2) {
      getCategories();
    }
    //change page
    pageController.jumpToPage(pageIndex);
    //change page index
    selectedPageIndex = pageIndex;
    //close drawer if its open
    if (drawerStatus == FSBStatus.FSB_OPEN) {
      drawerStatus = FSBStatus.FSB_CLOSE;
    }
    notifyListeners();
  }

  void pageBack() {
    int pageIndex = selectedThemeIndex > 0 ? selectedThemeIndex - 1 : 0;
    changePage(pageIndex);
  }

  // foldable side bar ------------------------------------------
  String drawerPage = 'home';
  FSBStatus drawerStatus;
  void toggleDrawer({page}) {
    drawerPage = page;
    notifyListeners();
    drawerStatus == FSBStatus.FSB_OPEN
        ? drawerStatus = FSBStatus.FSB_CLOSE
        : drawerStatus = FSBStatus.FSB_OPEN;
    notifyListeners();
  }

  void closeDrawer() {
    drawerStatus = FSBStatus.FSB_CLOSE;
    notifyListeners();
  }

  // theme data  ------------------------------------------------
  Themes themes = Themes();
  int selectedThemeIndex = 0;

  void changeTheme(int themeIndex) {
    selectedThemeIndex = themeIndex;
    notifyListeners();
  }

  // Circular soft button ---------------------------------------
  int circularButtonRadius = 10;
  Widget circularButtonIcon = Icon(Icons.close);
  Color circularIconColor = primary;

  // Player Controls --------------------------------------------
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  final _stations = Stations.list;
  int selectedStationIndex = 0;
  bool playing = false;
  double volume = 0.6;
  String nowplaying = 'Pause/Offline';

  void openPlayer(int pIndex, bool autoStart) async {
    try {
      await _assetsAudioPlayer
          .open(
        Audio.liveStream(
          _stations[pIndex].streamUrl,
          metas: Metas(
            id: _stations[pIndex].title,
            title: _stations[pIndex].title,
            artist:
                "${_stations[pIndex].frequency} ${_stations[pIndex].location}",
            album: _stations[pIndex].frequency,
            image: MetasImage.asset('images/logo.png'),
          ),
        ),
        showNotification: true,
        autoStart: autoStart,
      )
          .then((value) {
        if (_assetsAudioPlayer.isPlaying != null) {
          playing = true;
          nowplaying =
              '${_stations[pIndex].frequency} ${_stations[pIndex].location}';
          notifyListeners();
        } else {
          stopStreaming();
        }
      });
    } catch (e) {
      stopStreaming();
    }
  }

  void playAndPause() async {
    if (playing) {
      _assetsAudioPlayer.pause();
      playing = false;
      nowplaying = 'Paused';
      notifyListeners();
    } else {
      playing = true;
      nowplaying = 'Loading...';
      notifyListeners();
      openPlayer(selectedStationIndex, true);
    }
  }

  void changeStation(stIndex) {
    if (stIndex == selectedStationIndex && playing == true) {
      stopStreaming();
    } else {
      _assetsAudioPlayer.stop();
      selectedStationIndex = stIndex;
      nowplaying = 'Loading...';
      playing = false;
      notifyListeners();
      playAndPause();
      notifyListeners();
    }
  }

  void nextStation() {
    if (selectedStationIndex < _stations.length) {
      changeStation(selectedStationIndex + 1);
    }
  }

  void prevStation() {
    if (selectedStationIndex > 0) {
      changeStation(selectedStationIndex - 1);
    }
  }

  void stopStreaming() {
    _assetsAudioPlayer.stop();
    playing = false;
    nowplaying = 'Stopped / Offline';
    notifyListeners();
  }

  void setVolume(double vol) {
    _assetsAudioPlayer.setVolume(vol);
    volume = vol;
    notifyListeners();
  }

  bool isSeclected(int index) {
    if (selectedStationIndex == index && playing == true) {
      return true;
    } else {
      return false;
    }
  }

  //navbar items ---------------------------------------------
  List navNames = [
    ['Live', Icon(Icons.headset)],
    ['Stations', Icon(Icons.radio)],
    ['News', Icon(Icons.rss_feed)],
    ['Videos', Icon(Icons.video_collection)],
  ];

  getNavItems() {
    return navNames.map((nav) {
      return BottomNavigationBarItem(
        icon: nav[1],
        label: nav[0],
      );
    }).toList();
  }

  // News ----------------------------------------------------
  NewsRepository newsRepository = NewsRepository();
  List<NewsClass> allNews;
  List<NewsClass> headline;
  List<NewsClass> topNews;
  List<NewsClass> allCategoryNews;
  List<CategoryClass> categories;
  int selectedCategory = 0;
  String newsLanguage = 'English';
  bool loadingCategories = false;

  Future getNews([change]) async {
    if (allNews == null || allNews == [] || allNews.length < 5 || change) {
      allNews = await newsRepository.getAllNews(newsLanguage);
    }
    if (allNews != null && allNews != []) {
      headline = allNews.sublist(0, 5);
      topNews = allNews.sublist(6, 30);
    }
    notifyListeners();
  }

  Future checkNews() async {
    if (headline == null || headline == []) {
      await getNews();
    }
  }

  Future getHeadLines() async {
    await checkNews();
    return headline;
  }

  Future getTopNews() async {
    await checkNews();
    return topNews;
  }

  Future getCategories([change]) async {
    if (categories == null || change) {
      categories = await newsRepository.getCategory(newsLanguage);
    }
    notifyListeners();
  }

  Future getCategoryNews(int category) async {
    selectedCategory = category;
    allCategoryNews = await newsRepository.getAllCategoryNews(category);
    notifyListeners();
    return allCategoryNews;
  }

  void changeLanguage(String language) async {
    loadingCategories = true;
    notifyListeners();
    newsLanguage = language;
    await getNews(true);
    await getCategories(true);
    loadingCategories = false;
    changePage(2);
    notifyListeners();
  }

  // Videos ------------------------------------------------------------
  ChannelRepository channelRepository = ChannelRepository();
  List<Video> allVideos;
  List<Video> visionVideos;
  int selectedVideoPage = 0;

  List videoPages = [
    'Vision FM',
    'Farinwata TV',
  ];

  Future getVideos() async {
    if (allVideos == null || allVideos == [] || allVideos.length < 5) {
      visionVideos = await channelRepository.getVisionVideos();
      allVideos = await channelRepository.getVideos();
    }
  }

  Future<List<Video>> getVideoList(int index) async {
    getVideos();
    if (index == 0) {
      return visionVideos;
    } else {
      return allVideos;
    }
  }

  void changeVideoPage(index) {
    selectedVideoPage = index;
    notifyListeners();
  }
}
