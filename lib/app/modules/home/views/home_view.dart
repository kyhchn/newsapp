import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newsapp/app/core/theme/colors.dart';
import 'package:newsapp/app/core/theme/typography.dart';
import 'package:newsapp/app/data/models/articles.dart';
import 'package:newsapp/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Nusantara Recruitment'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () => controller.articles.isNotEmpty && controller.isLoading.isFalse
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      final article = controller.articles[index];
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              side:
                                  const BorderSide(color: CustomColor.primary),
                              borderRadius: BorderRadius.circular(12)),
                          title: Text(
                            article.title,
                            style: TypographyStyles.h4,
                          ),
                          subtitle: Text(article.description!),
                          onTap: () =>
                              Get.toNamed(Routes.ARTICLE, arguments: article),
                        ),
                      );
                    },
                    itemCount: controller.articles.length,
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(CustomColor.primary),
                  )),
          ),
        ));
  }
}
