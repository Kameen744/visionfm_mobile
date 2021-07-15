import 'package:dio/dio.dart';
import 'package:visionfm/classess/category_class.dart';
import 'package:visionfm/classess/news_class.dart';

class NewsRepository {
  String baseUrl = 'https://visionfm.ng/api/v1';
  Dio _dio = Dio();

  _getResource(String url) async {
    try {
      final response = await _dio.get('$baseUrl/$url');
      return response.data;
    } on DioError {
      return [];
    }
  }

  Future<List<NewsClass>> getAllNews(String language) async {
    List _news = await _getResource('posts/$language');
    return _news.map((news) => NewsClass.fromJson(news)).toList();
  }

  Future<List<CategoryClass>> getCategory(String language) async {
    List _categories = await _getResource('category/$language');
    return _categories.map((cat) => CategoryClass.fromJson(cat)).toList();
  }

  Future<List<NewsClass>> getAllCategoryNews(int category) async {
    List _news = await _getResource('category/news/$category');
    return _news.map((news) => NewsClass.fromJson(news)).toList();
  }
}
