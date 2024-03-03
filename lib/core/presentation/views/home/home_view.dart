import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_attendance/core/presentation/views/home/providers/mosque_providers.dart';
import 'package:geo_attendance/core/utils/geo_locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:vector_map_tiles/vector_map_tiles.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key, required this.title});
  final String title;

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView>
    with TickerProviderStateMixin {
  final zoomLevel = 16.0;
  late final _animatedMapController = AnimatedMapController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
  LatLng _myLocation = const LatLng(0, 0);
  List<LatLng> _locationsTrack = [];
  // ignore: unused_field
  late StreamSubscription<Position> _positionStream;

  @override
  void initState() {
    super.initState();
    setMyLocation();
    _positionStream =
        getStreamPositionSubscription(onUpdatePosition: (position) {
      // print(position == null
      //     ? 'Unknown'
      //     : '${position.latitude.toString()}, ${position.longitude.toString()}');

      if (position != null) {
        updateMyLocation(position);
      }
    });
  }

  void setMyLocation() async {
    final currentLocation = await determinePosition();
    setState(() {
      _myLocation = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    _animatedMapController.animateTo(dest: _myLocation, zoom: zoomLevel);
  }

  void updateMyLocation(Position position) {
    final newLocation = LatLng(position.latitude, position.longitude);
    setState(() {
      _myLocation = newLocation;
      _locationsTrack = [..._locationsTrack, newLocation];
    });
    _animatedMapController.animateTo(dest: _myLocation, zoom: zoomLevel);
  }

  @override
  Widget build(BuildContext context) {
    final nearestMosque = ref.watch(streamNearestMosqueProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Stack(children: [
        FlutterMap(
          mapController: _animatedMapController.mapController,
          options: MapOptions(
            initialCenter: const LatLng(51.5, -0.09),
            initialZoom: zoomLevel,
            cameraConstraint: CameraConstraint.contain(
              bounds: LatLngBounds(
                const LatLng(-90, -180),
                const LatLng(90, 180),
              ),
            ),
          ),
          children: [
            TileLayer(
              urlTemplate:
                  // 'https://api.maptiler.com/maps/streets-v2/{z}/{x}/{y}@2x.png?key=${dotenv.env['MAP_API_KEY']}'
                  'https://api.maptiler.com/maps/streets-v2/256/{z}/{x}/{y}.png?key=${dotenv.env['MAP_API_KEY']}',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            const CircleLayer(
              circles: [
                //um location
                CircleMarker(
                  point: LatLng(-7.958810, 112.615422),
                  radius: 80,
                  color: Color.fromRGBO(46, 39, 245, 0.2),
                  useRadiusInMeter: true,
                ),
                CircleMarker(
                  point: LatLng(-7.97794, 112.638),
                  radius: 80,
                  color: Color.fromRGBO(46, 39, 245, 0.2),
                  useRadiusInMeter: true,
                ),
              ],
            ),
            PolylineLayer(
              polylines: [
                Polyline(
                    strokeWidth: 4.0,
                    points: _locationsTrack,
                    color: Colors.cyan,
                    borderColor: Colors.blueGrey),
              ],
            ),
            switch (nearestMosque) {
              AsyncData(:final value) => MarkerLayer(
                  markers: [
                    Marker(
                      point: _myLocation,
                      width: 24,
                      height: 24,
                      child: Image.asset('assets/icons/placeholder.png'),
                    ),
                    ...(value.data
                            ?.map(
                              (it) => Marker(
                                point: LatLng(it.lat, it.lon),
                                width: 24,
                                height: 24,
                                child: Column(
                                  children: [
                                    Image.asset('assets/icons/placeholder.png'),
                                    Text(it.name)
                                  ],
                                ),
                              ),
                            )
                            .toList() ??
                        [])
                  ],
                ),
              AsyncError(:final error) => Text('error: $error'),
              _ => const Text('loading'),
            },
            const RichAttributionWidget(
              popupInitialDisplayDuration: Duration(seconds: 5),
              animationConfig: ScaleRAWA(),
              showFlutterMapAttribution: false,
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  // onTap: () async => launchUrl(
                  //   Uri.parse('https://openstreetmap.org/copyright'),
                  // ),
                ),
                TextSourceAttribution(
                  'This attribution is the same throughout this app, except '
                  'where otherwise specified',
                  prependCopyright: false,
                ),
              ],
            ),
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animatedMapController.animateTo(
              dest: const LatLng(-7.958810, 112.615422), zoom: zoomLevel);
        },
        tooltip: 'My Location',
        child: const Icon(Icons.my_location),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  VectorTileProvider _tileProvider() => NetworkVectorTileProvider(
      urlTemplate:
          'https://tiles.example.com/openmaptiles/{z}/{x}/{y}.pbf?api_key=${dotenv.env['MAP_API_KEY']}',
      maximumZoom: 14);
}
