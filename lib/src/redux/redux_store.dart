import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux_thunk/redux_thunk.dart';
import './redux_reducers.dart';

class ReduxStore {
  static final _instance =
      Store<int>(counterReducer, initialState: 0, middleware: [
    thunkMiddleware,
    NavigationMiddleware<int>(),
    LoggingMiddleware.printer(),
  ]);

  static Store get store => _instance;
}
