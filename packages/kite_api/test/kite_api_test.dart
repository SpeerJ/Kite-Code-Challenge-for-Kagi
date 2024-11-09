import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:kite_api/kite_api.dart';
import 'package:kite_api/enums/category.dart';

class CategoryClient extends Mock implements http.Client {}
class CategoryResponse extends Mock implements http.Response {}

void main() {
  test('Deserializes world category', () async {
    final client = CategoryClient();
    final kiteApi = KiteApiClient.withClient(client);

    registerFallbackValue(Uri());

    final response = CategoryResponse();
    when(() => response.body).thenReturn(File('test/fixtures/world_response.json').readAsStringSync());
    when(() => client.get(any())).thenAnswer((_) async => response);

    final cat = await kiteApi.getCategory(Category.world);
    expect(cat.read, 906);
  });
}
