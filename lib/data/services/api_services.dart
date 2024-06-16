import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inshorts_clone/common/constants.dart';
import 'package:inshorts_clone/data/model/article_model.dart';

class ApiServices {
  static Future<Map<String, dynamic>> getArticles() async {
    try {
      List<Articles> articles = [];

      final response = await http.get(Uri.parse(everything));

      var data = jsonDecode(response.body);

      articles = Articles().listFromJson(data['articles']);

      return {
        'error' : false,
        'statusCode': response.statusCode,
        'data': articles,
      };
    } catch (e) {
      return {
        'error' : true,
        'errorMsg': e.toString(),
      };
    }
  }
}
