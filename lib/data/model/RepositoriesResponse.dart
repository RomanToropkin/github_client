import 'package:github_client/data/model/RepoInfo.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Owner.dart';

part 'RepositoriesResponse.g.dart';

@JsonSerializable()
class RepositoriesResponse {
  String name;
  String full_name;
  String description;
  String language;
  int forks;
  int stargazers_count;
  Owner owner;


  RepositoriesResponse(this.name, this.full_name, this.description,
      this.language, this.forks, this.stargazers_count, this.owner);

  factory RepositoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$RepositoriesResponseFromJson(json);

  @override
  String toString() {
    return 'RepositoriesResponse{name: $name, full_name: $full_name, description: $description, language: $language, forks: $forks, stargazers_count: $stargazers_count, owner: $owner}';
  }


}
