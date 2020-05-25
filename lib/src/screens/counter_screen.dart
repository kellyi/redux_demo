import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import '../widgets/counter.dart';
import '../widgets/demo_buttons.dart';

class CounterScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return StoreConnector<int, VoidCallback>(
      converter: (store) {
        return () => store.dispatch(NavigateToAction.push(
              '/flutter_map',
              preNavigation: () =>
                  print('preNavigation action was run from counter!'),
              postNavigation: () =>
                  print('postNavigation action was run from counter!'),
            ));
      },
      builder: (context, onPressed) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Counter screen'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You have pushed the button this many times:'),
                Counter(),
                Divider(),
                RaisedButton(
                  onPressed: onPressed,
                  child: Text('Flutter Map'),
                ),
              ],
            ),
          ),
          floatingActionButton: DemoButtons(),
        );
      },
    );
  }
}
