import 'package:geo_attendance/core/data/network/retrofit/request/places_rest_client.dart';
import 'package:latlong2/latlong.dart';

abstract class PlacesRepository {
  late PlacesRestClient placesRestClient;
  Future<void> getNearMosque({required LatLng currentLocation});
}
