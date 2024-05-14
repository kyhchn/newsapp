import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newsapp/app/core/theme/typography.dart';
import 'package:newsapp/app/core/utils/utils.dart';

import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Detail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.article.title,
                    style: TypographyStyles.h2
                        .copyWith(color: Colors.grey.shade900),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(controller.article.description ?? "",
                      style: TypographyStyles.b2
                          .copyWith(color: Colors.grey.shade600)),
                  commonTile("author", controller.article.author ?? "N/A"),
                  commonTile(
                      "publikasi", formatDate(controller.article.publishedAt)),
                  Text(controller.article.content ?? "",
                      style: TypographyStyles.b2
                          .copyWith(color: Colors.grey.shade600)),
                ],
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Container commonTile(String title, String value,
    {Widget suffix = const SizedBox(), bool isCentered = false}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 8),
    child: Row(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width * 0.4,
          child: Text(
            title,
            style: TypographyStyles.b2.semibold(color: Colors.grey.shade700),
          ),
        ),
        Expanded(
            child: Text(value,
                style:
                    TypographyStyles.b2.copyWith(color: Colors.grey.shade700))),
        suffix
      ],
    ),
  );
}
