/// Some elements within the API are empty strings when a null element or empty list would be more idiomatic
/// This class contains fixes for these
class EmptyStringFix  {
  static toList<T>(dynamic json) {
    if (json is String && json.isEmpty) {
      return <T>[];
    }

    if (json is List) return json.cast<T>().toList();

    throw ArgumentError('Expected a List or an empty string');
  }

  static toStringList(dynamic json) => toList<String>(json);
}