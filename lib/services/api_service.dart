import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newst_app/core/model/news_model.dart';

class ApiService {
  final apiKey = "bb45e8a6ee184dfba05547a577d026d2";
  final country = "us";
  final category = "technology";
  Future<List<NewsArticleModel>> fetchAllArticles() async {
    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=${country}&category=${category}&apiKey=${apiKey}",

      // 'https://newsapi.org/v2/everything?q=tesla&from=2025-05-02&sortBy=publishedAt&apiKey=bb45e8a6ee184dfba05547a577d026d2',
    );
    final response = await http.get(url);
    // print("🔹 كود الاستجابة: ${response.statusCode}");
    // print("🔹 محتوى الاستجابة: ${response.body.substring(0, 200)}..."); // طباعة أول 200 حرف فقط لتجنب النص الطويل
    // print("🔹 رؤوس الاستجابة: ${response.headers}");
    // print("🔹 رابط الطلب: ${response.request?.url}");
    // print("🔹 سبب الاستجابة: ${response.reasonPhrase}");

    if (response.statusCode == 200) {
      //data داخلها الملف كامل على شكل: Map<String,Dynamic>
      //data ={
      //  "status": "ok",
      //  "articles": [
      //    {
      //      "source": {
      //        "name": "teslamotors"
      //                },
      //      "title": "Tesla to unveil new electric car in 2025",
      //      "description": "Tesla is set to unveil a new electric car in 2025",
      //    }
      //              ]
      //}
      final data = json.decode(response.body);

      // articles داخلها List<Map<String,Dynamic>>
      //articlesJson=[
      //{},
      //{}
      //]
      final List articlesJson = data['articles'];
      return articlesJson
          .map((article) => NewsArticleModel.fromJson(article))
          .toList();
      //article >> عبارة عن Map
      // تقوم بأخذ كل مقال وتحويله إلى كائن NewsArticleModel.
      // List<NewsArticleModel>
    } else {
      throw Exception("فشل في تحميل الاخبار !!${response.statusCode}");
    }
  }
}
