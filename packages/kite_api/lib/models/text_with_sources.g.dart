// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_with_sources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextWithSources _$TextWithSourcesFromJson(Map<String, dynamic> json) =>
    TextWithSources(
      json['text'] as String,
      (json['sources'] as List<dynamic>)
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TextWithSourcesToJson(TextWithSources instance) =>
    <String, dynamic>{
      'text': instance.text,
      'sources': instance.sources,
    };
