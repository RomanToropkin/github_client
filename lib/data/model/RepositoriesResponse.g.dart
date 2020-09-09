// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RepositoriesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoriesResponse _$RepositoriesResponseFromJson(Map<String, dynamic> json) {
  return RepositoriesResponse(
    json['name'] as String,
    json['full_name'] as String,
    json['description'] as String,
    json['language'] as String,
    json['forks'] as int,
    json['stargazers_count'] as int,
    json['owner'] == null
        ? null
        : Owner.fromJson(json['owner'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RepositoriesResponseToJson(
        RepositoriesResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'full_name': instance.full_name,
      'description': instance.description,
      'language': instance.language,
      'forks': instance.forks,
      'stargazers_count': instance.stargazers_count,
      'owner': instance.owner,
    };
