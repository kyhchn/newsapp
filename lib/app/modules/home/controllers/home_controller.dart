import 'package:get/get.dart';
import 'package:newsapp/app/data/models/articles.dart';
import 'package:newsapp/app/data/services/article_service.dart';

class HomeController extends GetxController {
  RxList<Article> articles = <Article>[].obs;
  final isLoading = false.obs;

  final articleService = Get.find<ArticleService>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchArticle();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchArticle() async {
    isLoading(true);
    final result = await articleService.getAllArticle();

    if (result != null) {
      articles.assignAll(result);
      articles.refresh();
    }

    isLoading(false);
  }
}
