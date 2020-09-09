import 'package:github_client/data/model/Author.dart';
import 'package:json_annotation/json_annotation.dart';

part 'RepoInfo.g.dart';

@JsonSerializable()
class RepoInfo{

  String html_url;
  String language;
  String commits_url;
  int forks;
  int open_issues;
  int watchers;
  int stargazers_count;

  Author author;
  Map<String, dynamic> commit;

  RepoInfo(this.html_url, this.language, this.commits_url, this.forks,
      this.open_issues, this.watchers, this.stargazers_count, this.author,
      this.commit);

  factory RepoInfo.fromJson(Map<String, dynamic> json) => _$RepoInfoFromJson(json);

  @override
  String toString() {
    return 'RepoInfo{html_url: $html_url, language: $language, commits_url: $commits_url, forks: $forks, open_issues: $open_issues, watchers: $watchers, stargazers_count: $stargazers_count}';
  }


}