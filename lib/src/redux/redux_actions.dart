import 'dart:async';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;

enum ReduxActions { Increment, Double }

ThunkAction<int> doubleCounterAsync() {
  return (Store<int> store) async {
    final url = 'http://dummy.restapiexample.com/api/v1/employees';
    final response = await http.get(url);

    print('request status: ${response.statusCode}');
    print('request body: ${response.body}');

    store.dispatch(ReduxActions.Double);
  };
}
