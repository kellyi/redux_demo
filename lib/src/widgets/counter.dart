import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/redux_store.dart';

class Counter extends StatelessWidget {
  final Store<int> store = ReduxStore.store;

  Widget build(BuildContext context) {
    return StoreConnector<int, String>(
      converter: (store) => store.state.toString(),
      builder: (context, count) {
        return Text(
          count,
          style: Theme.of(context).textTheme.display1,
        );
      },
    );
  }
}
