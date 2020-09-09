import 'dart:convert';
import 'dart:io';

import 'package:github_client/data/config.dart';
import 'package:github_client/data/model/RepoInfo.dart';
import 'package:github_client/data/model/RepositoriesResponse.dart';
import 'package:http/http.dart' as http;

class Network {
  Network._internal();

  static final Network _singleton = Network._internal();

  factory Network() {
    return _singleton;
  }

  Future<List<RepositoriesResponse>> getRepositories() async {
    var response = await _getResponse('/orgs/github/repos?per_page=10');
    if (response != null) {
      try {
        var arr = json.decode(response.body);
        return (arr as List)
            ?.map((e) =>
        e == null ? null : RepositoriesResponse.fromJson(e as Map<String, dynamic>))
            ?.toList();
      } catch (ex) {
        print(ex);
        return null;
      }
    } else {
      return null;
    }
  }

  Future<RepoInfo> getRepoInfo(name) async{
    var response = await _getResponse('/repos/'+name);
    if (response != null) {
      try {
        var arr = json.decode(response.body);
        print(arr);
        return new RepoInfo.fromJson(arr);
      } catch (ex) {
        print(ex);
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> test() async {
    var url = '/repositories';
    var response = await http.get(
      API_ENTRY_POINT + url,
      headers: {HttpHeaders.authorizationHeader: TOKEN},
    );
    return json.encode(response.body);
  }

  _getResponse(url) async {
    var response = await http.get(API_ENTRY_POINT + url,
        headers: {HttpHeaders.authorizationHeader: TOKEN});
    return response;
  }
}
