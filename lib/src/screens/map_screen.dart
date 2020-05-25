import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return StoreConnector<int, VoidCallback>(
      converter: (store) {
        return () => store.dispatch(NavigateToAction.pop(
              preNavigation: () =>
                  print('preNavigation action was run from map!'),
              postNavigation: () =>
                  print('postNavigation action was run from map!'),
            ));
      },
      builder: (context, onPressed) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Flutter map'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: onPressed,
            ),
          ),
          body: FlutterMap(
            options: MapOptions(
              center: LatLng(51.5, -0.09),
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(51.5, -0.09),
                    builder: (ctx) => Container(
                      child: FlutterLogo(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
