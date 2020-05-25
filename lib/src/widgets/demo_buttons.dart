import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/redux_actions.dart';

class DemoButtons extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StoreConnector<int, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(ReduxActions.Increment);
            },
            builder: (context, onPressed) {
              return createButtonWithTooltip(
                icon: Icons.add,
                onPressed: onPressed,
                tooltip: 'Increment',
              );
            },
          ),
          Padding(padding: EdgeInsets.only(left: 20)),
          StoreConnector<int, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(doubleCounterAsync());
            },
            builder: (context, onPressed) {
              return createButtonWithTooltip(
                icon: Icons.trending_up,
                onPressed: onPressed,
                tooltip: 'Double async',
              );
            },
          ),
        ],
    );
  }

  Widget createButtonWithTooltip({icon, onPressed, tooltip}) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
      heroTag: null,
    );
  }
}
