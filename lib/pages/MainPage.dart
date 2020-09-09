import 'package:flutter/material.dart';
import 'package:github_client/bloc/RepositoriesBloC.dart';
import 'package:github_client/data/model/RepositoriesResponse.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  RepositoriesBLoC _bloc = RepositoriesBLoC();

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc.uploadData.add(null);

    return Scaffold(
        appBar: AppBar(
            title: Text('Репозитории'), backgroundColor: Colors.grey[700]),
        body: SafeArea(
          child: Container(
            color: Colors.black,
            child: StreamBuilder<List<RepositoriesResponse>>(
              initialData: List<RepositoriesResponse>(),
              stream: _bloc.repositories,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    padding: EdgeInsets.all(10),
                    itemBuilder: (context, i) {
                      return InkWell(
                          child: Card(
                        color: Color(0xff001039),
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        snapshot.data[i].full_name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        snapshot.data[i].language ?? '-',
                                        style:
                                        Theme.of(context).textTheme.headline4,
                                      ),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[700],
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Text(
                                    snapshot.data[i].description ?? '',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: new NetworkImage(snapshot
                                                  .data[i].owner.avatar_url))),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Text(
                                        snapshot.data[i].owner.login,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(left: 20, right: 20),
                                      child: Text(
                                        'Stars: ${snapshot.data[i].stargazers_count ?? '0'}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(left: 20, right: 20),
                                      child: Text(
                                        'Forks: ${snapshot.data[i].forks ?? '0'}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ));
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ));
  }
}
