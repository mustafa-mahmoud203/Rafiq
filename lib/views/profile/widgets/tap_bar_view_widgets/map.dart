import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rafiq/core/themes/theme.dart';

class Maps extends StatelessWidget {
  Maps({Key? key}) : super(key: key);

  List<Widget> maps = [
    AutoSizeText(
      'No maps yet 12',
      style: ThemeOfProject.ligthTheme.textTheme.headline4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return const GoogleMap(
        initialCameraPosition: CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
    ));
  }
}
