// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:hiddengems/data/device_repository.dart';
import 'package:hiddengems/persentation/widgets/top_bar.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late MapController mapController;

  Future<MapController> getPosition() async {
    final position = await DeviceRepository.determinePosition();
    return MapController(
      initPosition:
          GeoPoint(latitude: position.latitude, longitude: position.longitude),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(titleText: 'titleText'),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                print((await showSimplePickerLocation(
                  context: context,
                  textCancelPicker: 'Batal',
                  initZoom: 16,
                ))
                    .toString());
              },
              child: const Text('fafa')),
          Ink(
            width: 200,
            height: 200,
            child: FutureBuilder(
              future: getPosition(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final controller = snapshot.data as MapController;
                  final point = controller.initPosition as GeoPoint;
                  return OSMFlutter(
                    isPicker: false,
                    onLocationChanged: (geoPoint) => print('fafa'),
                    staticPoints: [
                      StaticPositionGeoPoint(
                          'id',
                          MarkerIcon(
                            assetMarker: AssetMarker(
                                image: const AssetImage(
                                    'assets/images/pointer.png')),
                          ),
                          [point])
                    ],
                    controller: controller,
                    trackMyPosition: false,
                    initZoom: 15,
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
