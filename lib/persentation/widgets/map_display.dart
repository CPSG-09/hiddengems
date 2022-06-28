import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapDisplay extends StatefulWidget {
  final double latitude;
  final double longitude;
  const MapDisplay({
    required this.latitude,
    required this.longitude,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MapDisplayState createState() => _MapDisplayState();
}

class _MapDisplayState extends State<MapDisplay> {
  late MapController mapController;
  late GeoPoint point;

  @override
  void initState() {
    point = GeoPoint(latitude: widget.latitude, longitude: widget.longitude);
    mapController = MapController(
      initPosition: point,
      initMapWithUserPosition: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      trackMyPosition: false,
      controller: mapController,
      initZoom: 16,
      onMapIsReady: (isReady) => mapController.addMarker(point),
    );
  }
}
