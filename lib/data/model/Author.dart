import 'package:json_annotation/json_annotation.dart';

part 'Author.g.dart';

@JsonSerializable()
class Author{

  String login;
  String avatar_url;

  Author(this.login, this.avatar_url);

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);


}