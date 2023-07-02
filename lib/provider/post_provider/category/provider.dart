import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class CategoryProvider with ChangeNotifier {
  List<String> _categories = [];
  List<String> get categories => _categories;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    _isLoading = true; // Set isLoading to true before fetching categories
    notifyListeners();

    final url = Uri.parse('https://news.switchtv.ke/wp-json/wp/v2/categories');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final categories = jsonDecode(response.body);

        for (var category in categories) {
          final categoryName = category['name'];
          _categories.add(categoryName);
        }

        _isLoading = false; // Set isLoading to false after fetching categories
        notifyListeners();
      } else {
        print('Failed to fetch categories. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching categories: $error');
    }
  }
}

