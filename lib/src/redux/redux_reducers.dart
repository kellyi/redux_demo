import './redux_actions.dart';

int counterReducer(int state, dynamic action) {
  switch (action) {
    case ReduxActions.Increment:
      return state + 1;
    case ReduxActions.Double:
      return state * 2;
    default:
      return state;
  }
}
