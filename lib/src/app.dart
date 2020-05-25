import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import './redux/redux_store.dart';
import './screens/counter_screen.dart';
import './screens/map_screen.dart';

class AppRoutes {
  static const home = "/";
  static const flutter_map = "/flutter_map";
}

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
        navigatorKey: NavigatorHolder.navigatorKey,
        onGenerateRoute: routes,
      ),
    );
  }

  Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) {
            return CounterScreen();
          },
        );
      case AppRoutes.flutter_map:
        return MaterialPageRoute(
          builder: (context) {
            return MapScreen();
          },
        );
    }
  }
}
