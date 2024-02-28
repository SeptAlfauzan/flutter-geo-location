import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:geo_attendance/core/utils/geo_locator.dart';
import 'package:latlong2/latlong.dart';
import 'package:vector_map_tiles/vector_map_tiles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});
  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final animatedMapController = AnimatedMapController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
  LatLng _myLocation = const LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    setMyLocation();
  }

  void setMyLocation() async {
    final currentLocation = await determinePosition();
    setState(() {
      _myLocation = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    animatedMapController.animateTo(dest: _myLocation, zoom: 14);
  }

  @override
  Widget build(BuildContext context) {
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
          mapController: animatedMapController.mapController,
          options: MapOptions(
            initialCenter: const LatLng(51.5, -0.09),
            initialZoom: 18,
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
                  'https://api.maptiler.com/maps/streets-v2/{z}/{x}/{y}@2x.png?key=${dotenv.env['MAP_API_KEY']}',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            const CircleLayer(
              circles: [
                CircleMarker(
                  point: LatLng(-7.958810, 112.615422),
                  radius: 80,
                  color: Color.fromRGBO(46, 39, 245, 0.2),
                  useRadiusInMeter: true,
                ),
              ],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: _myLocation,
                  width: 80,
                  height: 80,
                  child: const FlutterLogo(),
                ),
              ],
            ),
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
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animatedMapController.animateTo(
              dest: const LatLng(-7.958810, 112.615422), zoom: 18);
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
