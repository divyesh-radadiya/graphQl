import 'package:app_graphql/data/online_fetch.dart';
import 'package:app_graphql/data/online_list.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Online extends StatelessWidget {
  const Online({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Online Users",
            style: TextStyle(fontSize: 28),
          ),
        ),
        Subscription("fetchOnlineUsers", OnlineFetch.fetchUsers, builder: ({
          bool loading,
          dynamic payload,
          dynamic error,
        }) {
          if (payload != null) {
            return Expanded(
              child: ListView.builder(
                itemCount: onlineList.list.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(onlineList.list[index]),
                    ),
                  );
                },
              ),
            );
          } else {
            return Text("Fetching Online Users");
          }
        }),
      ],
    );
  }
}
