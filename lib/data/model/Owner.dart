import 'package:json_annotation/json_annotation.dart';

part 'Owner.g.dart';

@JsonSerializable()
class Owner {
  String login;
  String avatar_url;

  Owner(this.login, this.avatar_url);

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  @override
  String toString() {
    return 'Owner{login: $login, avatar_url: $avatar_url}';
  }


}
