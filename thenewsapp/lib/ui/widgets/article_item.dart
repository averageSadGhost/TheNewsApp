import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thenewsapp/ui/size_config.dart';
import 'package:thenewsapp/ui/screens/webview_screen.dart';

Widget buildArticleItem(article, context) {
  SizeConfig().init(context);
  String imgUrl = article["urlToImage"] == null
      ? "https://cdn5-ss12.sharpschool.com/UserFiles/Servers/Server_1023780/Image/News.jpg"
      : "${article["urlToImage"]}";

  return InkWell(
    onTap: () {
      Get.to(WebViewScreen(url: article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: SizeConfig.orientation == Orientation.portrait
                ? SizeConfig.screenWidth * 0.240
                : SizeConfig.screenWidth * 0.320,
            height: SizeConfig.orientation == Orientation.portrait
                ? SizeConfig.screenHeight * 0.160
                : SizeConfig.screenHeight * 0.320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${article["title"]}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${article["publishedAt"]}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
