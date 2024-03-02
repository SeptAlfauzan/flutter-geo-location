import 'package:geo_attendance/core/data/network/retrofit/request/places_rest_client.dart';
import 'package:geo_attendance/core/domain/repositories/places_repository.dart';
import 'package:latlong2/latlong.dart';

class PlacesRepositoryImpl implements PlacesRepository {
  @override
  PlacesRestClient placesRestClient;

  PlacesRepositoryImpl({required this.placesRestClient});

  @override
  Future<void> getNearMosque({required LatLng currentLocation}) {
    // TODO: implement getNearMosque
    throw UnimplementedError();
  }
}
