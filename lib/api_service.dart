import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task/post_model.dart';

class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
