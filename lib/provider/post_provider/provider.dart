import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Post {
  final String title;
  final String content;
  final String fileUrl;
  final String date;
  final String author;
  final List<String> categories;

  Post(this.title, this.content, this.fileUrl, this.date, this.author, this.categories);
}

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];
  bool _isLoading = false;
  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;


  Future<void> fetchPosts() async {

    final url = Uri.parse('https://news.switchtv.ke/wp-json/wp/v2/posts?_embed');

    try {
      _isLoading = true;
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        List<Post> fetchedPosts = [];

        for (var item in jsonData) {
          String title = item['title']['rendered'];
          String date = item['date'];
          String author = item["_embedded"]["author"][0]["name"];
          String content = item['content']['rendered'];
          List<String> categoryIds = [];

          if (item['categories'] != null && item['categories'] is List) {
            for (var categoryId in item['categories']) {
              categoryIds.add(categoryId.toString());
            }
          }

          List<String> categories = [];
          for (var categoryId in categoryIds) {
            final category = await fetchCategory(int.parse(categoryId));
            if (category != null) {
              final categoryName = category['name'];
              categories.add(categoryName);
            }
          }

          if (item['_embedded'] != null && item['_embedded']['wp:featuredmedia'] != null) {
            List<dynamic> featuredMedia = item['_embedded']['wp:featuredmedia'];
            for (var media in featuredMedia) {
              String fileUrl = media['source_url'];
              fetchedPosts.add(Post(title, content, fileUrl, date, author, categories));
            }
          } else {
            fetchedPosts.add(Post(title, content, 'nnn', date, author, categories));
          }
        }

        _posts = fetchedPosts;
        _isLoading = false;
        print(_posts);
        notifyListeners();
      } else {
        print('Failed to fetch data. Error code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching posts: $error');
    }
  }

  Future<Map<String, dynamic>?> fetchCategory(int categoryId) async {
    final url = Uri.parse('https://news.switchtv.ke/wp-json/wp/v2/categories/$categoryId');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final category = jsonDecode(response.body);
        return category;
      } else {
        print('Failed to fetch category. Category ID: $categoryId, Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching category: $error');
    }

    return null;
  }
}
