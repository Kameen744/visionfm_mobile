import 'package:dio/dio.dart';
import 'package:visionfm/classess/video_class.dart';

class ChannelRepository {
  String _mainUrl = 'https://www.googleapis.com/youtube/v3';
  Dio _dio = Dio();

  _getUrl(String type) {
    if (type == 'vision') {
      return '$_mainUrl/search?part=snippet&channelId=UCuzCz0un-HUVsI5vgZ8F6IQ&maxResults=30&order=date&type=video&key=AIzaSyByuegFa-Ks1ZzFYpc416EDeH82Wh9ouLI';
    } else {
      return '$_mainUrl/search?part=snippet&channelId=UCm6XLjzqlQyA95wQiRlNinA&maxResults=30&order=date&type=video&key=AIzaSyBnzHFmE5udy7Zt-sTexQkV54dBZGyoAPM';
    }
  }

  Future<List<Video>> _getResource(String url) async {
    try {
      final response = await _dio.get(url);
      List _videos = response.data['items'];
      return _videos.map((video) => Video.fromJson(video)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Video>> getVideos() async {
    String _url = _getUrl('farinwata');
    return await _getResource(_url);
  }

  Future<List<Video>> getVisionVideos() async {
    String _url = _getUrl('vision');
    return await _getResource(_url);
  }
}
