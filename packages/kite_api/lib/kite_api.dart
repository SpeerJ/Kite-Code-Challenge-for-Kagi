library kite_api;

import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:mocktail/mocktail.dart';

import 'package:http/http.dart' as http;

import 'enums/category.dart';
import 'models/category_model.dart';

class CategoryResponse extends Mock implements http.Client {}

/// Handles categories as given by the kite api
class KiteApiClient {
  static const _baseUrl = 'kite.kagi.com';
  final http.Client _httpClient;

  @visibleForTesting
  const KiteApiClient.withClient(this._httpClient);

  factory KiteApiClient() => KiteApiClient.withClient(http.Client());

  /// Returns the requested news category
  Future<CategoryModel> getCategory(Category category) async {
   final uri = Uri.https(_baseUrl, "/${category.name}.json");
   final response = await _httpClient.get(uri);
   final categoryJson = jsonDecode(response.body) as Map<String, dynamic>;

   return CategoryModel.fromJson(categoryJson);

  }

  Future<void> dispose() async {
    _httpClient.close();
  }
}
