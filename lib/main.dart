import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vector_map_tiles/vector_map_tiles.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geo Attendance',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const HomeView(title: 'Geo Attendance'),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});
  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final mapController = MapController();

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
          mapController: mapController,
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
            // VectorTileLayer(tileProviders: TileProviders(
            //         {'openmaptiles': _tileProvider() }), theme: Theme(data: data, child: child),),
            TileLayer(
              urlTemplate:
                  'https://api.maptiler.com/maps/streets-v2/{z}/{x}/{y}@2x.png?key=${dotenv.env['MAP_API_KEY']}',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
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
          mapController.move(const LatLng(-7.958810, 112.615422), 18);
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
