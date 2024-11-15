import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kite_api/feed_category.dart';
import 'package:kite_api/kite_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class CategoryClient extends Mock implements http.Client {}
class CategoryResponse extends Mock implements http.Response {}

void main() {
  group('Unit Tests', (){
    test('Deserializes world category', () async {
      final client = CategoryClient();
      final kiteApi = KiteApiClient.withClient(client);

      registerFallbackValue(Uri());

      final response = CategoryResponse();
      when(() => response.body).thenReturn(File('test/fixtures/world_response.json').readAsStringSync());
      when(() => client.get(any())).thenAnswer((_) async => response);

      final cat = await kiteApi.getCategory(FeedCategory.world);
      expect(cat.read, 906);
    });

    test('Deserializes feed', () async {
      final client = CategoryClient();
      final kiteApi = KiteApiClient.withClient(client);

      registerFallbackValue(Uri());

      final response = CategoryResponse();
      when(() => response.body).thenReturn(File('test/fixtures/kite_feeds.json').readAsStringSync());
      when(() => client.get(any())).thenAnswer((_) async => response);

      final cat = await kiteApi.getCustomFeeds();
      expect(cat.first.name, 'Europe');
    });
  });

  group('Integration tests', (){
    test('Gets world category from api', () async {
      final kiteApi = KiteApiClient();
      final cat = await kiteApi.getCategory(FeedCategory.world);
      expect(cat.read, greaterThan(3));
    });

    test('Gets feeds from api', () async {
      final kiteApi = KiteApiClient();

      final feeds = await kiteApi.getCustomFeeds();
      expect(feeds.length, greaterThan(1));
      expect(feeds.first.title.length, greaterThan(2));
      expect(feeds.first.feeds.length, greaterThan(1));
    });

    test('Gets categories for all feeds', () async {
      final kiteApi = KiteApiClient();
      final feeds = await kiteApi.getAllFeeds();

      // Sanity check that it has more categories than those built in
      expect(feeds.length, greaterThan(FeedCategory.builtIn.length));

      await Future.forEach(feeds, (feed) async {
        try {
          final cat = await kiteApi.getCategory(feed);
          expect(cat.read, greaterThan(3));
          expect(cat.clusters.length, greaterThan(1)); // Tech
        } catch(NotFoundException) {
          print("${feed.name} category not found");
        }
      });
    });
  });
}
