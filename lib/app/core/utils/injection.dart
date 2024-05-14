import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/data/constant/constant.dart';
import 'package:newsapp/app/data/services/article_service.dart';

void injection() async {
  Get.put(
    Dio(
      BaseOptions(
          baseUrl: "$baseUrl",
          contentType: 'application/json',
          responseType: ResponseType.json),
    ),
  );

  Get.put(ArticleService());
}
