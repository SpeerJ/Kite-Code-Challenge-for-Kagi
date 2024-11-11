library kite_api;

import 'dart:convert';
import 'package:kite_api/models/custom_feed_category.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

import 'models/feed.dart';
import 'feed_category.dart';

/// Error code returned
class ApiException implements Exception {}
/// 404 not found
class NotFoundException implements ApiException {}


/// Handles categories as given by the kite api
class KiteApiClient {
  static const _baseUrl = 'kite.kagi.com';
  static const _githubUCBaseUrl = "raw.githubusercontent.com";
  final http.Client _httpClient;

  @visibleForTesting
  const KiteApiClient.withClient(this._httpClient);

  factory KiteApiClient() => KiteApiClient.withClient(http.Client());

  /// Returns the requested news category
  Future<Feed> getCategory(FeedCategory feed) async {
    final json = await _getResource(_baseUrl, "/${feed.name}.json");

    return Feed.fromJson(json);
  }

  /// Returns custom feed categories
  Future<Iterable<CustomFeedCategory>> getCustomFeeds() async {
    final json = await _getResource(_githubUCBaseUrl, "/kagisearch/kite-public/refs/heads/main/kite_feeds.json");

    return json.entries
        .map((entry) => CustomFeedCategory.fromJson({ entry.key.toLowerCase(): entry.value }));
  }

  /// This method gets all feeds including built_in and custom feeds from kagi_public
  Future<List<FeedCategory>> getAllFeeds() async {
    return [...FeedCategory.built_in, ...(await getCustomFeeds()).toList()];
  }

  Future<void> dispose() async {
    _httpClient.close();
  }

  Future<Map<String, dynamic>> _getResource<T>(String baseUrl, String path) async {
    final uri = Uri.https(baseUrl, path);
    final response = await _httpClient.get(uri);

    if (response.statusCode == 404) throw NotFoundException();

    if (response.statusCode != 200) throw ApiException();

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
