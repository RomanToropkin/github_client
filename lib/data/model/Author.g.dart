// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
    json['login'] as String,
    json['avatar_url'] as String,
  );
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatar_url,
    };
