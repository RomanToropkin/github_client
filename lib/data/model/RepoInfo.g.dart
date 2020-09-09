// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RepoInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoInfo _$RepoInfoFromJson(Map<String, dynamic> json) {
  return RepoInfo(
    json['html_url'] as String,
    json['language'] as String,
    json['commits_url'] as String,
    json['forks'] as int,
    json['open_issues'] as int,
    json['watchers'] as int,
    json['stargazers_count'] as int,
    json['author'] == null
        ? null
        : Author.fromJson(json['author'] as Map<String, dynamic>),
    json['commit'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$RepoInfoToJson(RepoInfo instance) => <String, dynamic>{
      'html_url': instance.html_url,
      'language': instance.language,
      'commits_url': instance.commits_url,
      'forks': instance.forks,
      'open_issues': instance.open_issues,
      'watchers': instance.watchers,
      'stargazers_count': instance.stargazers_count,
      'author': instance.author,
      'commit': instance.commit,
    };
