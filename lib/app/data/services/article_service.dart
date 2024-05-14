import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/core/utils/utils.dart';
import 'package:newsapp/app/data/models/articles.dart';

class ArticleService {
  final dio = Get.find<Dio>();

  Future<List<Article>?> getAllArticle() async {
    try {
      final response =
          await dio.get(pathNameBuilder('/top-headlines?country=us'));

      final articles = Articles.fromJson(response.data);

      if (articles.status == 'ok') {
        return articles.articles;
      }
    } on DioException catch (e) {
      Get.snackbar('Error', e.response?.data['message']!,
          snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }
}
