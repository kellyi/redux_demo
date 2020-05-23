import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './redux/redux_store.dart';
import './widgets/counter.dart';
import './widgets/demo_buttons.dart';

class App extends StatelessWidget {
  final Store<int> store = ReduxStore.store;
  final String title;

  App({Key key, this.title}) : super(key: key);

  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You have pushed the button this many times:'),
                Counter(),
              ],
            ),
          ),
          floatingActionButton: DemoButtons(),
        ),
      ),
    );
  }
}
