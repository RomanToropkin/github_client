import 'dart:async';
import 'package:github_client/data/model/RepoInfo.dart';
import 'package:rxdart/rxdart.dart';

import 'package:github_client/data/model/RepositoriesResponse.dart';
import 'package:github_client/data/network/Network.dart';

class RepositoriesBLoC{

  Network _network = Network();

  List<RepositoriesResponse> _repositoriesData;

  BehaviorSubject<List<RepositoriesResponse>> _repositoriesSubject =
    BehaviorSubject.seeded(null);

  StreamController _actionRepositories = StreamController();

  StreamSink get uploadData => _actionRepositories.sink;

  Observable<List<RepositoriesResponse>> get repositories =>
      _repositoriesSubject.stream;

  RepositoriesBLoC(){

    _actionRepositories.stream.listen(_getData);

  }

  dispose(){
    _actionRepositories.close();
    _repositoriesSubject.close();
  }

  _getData(data) async {
    _repositoriesData = await _network.getRepositories();
    _repositoriesSubject.sink.add(_repositoriesData);
  }

}