import 'package:geo_attendance/core/data/network/retrofit/request/places_rest_client.dart';
import 'package:geo_attendance/core/domain/entities/places/places_entity.dart';
import 'package:geo_attendance/core/utils/data_state.dart';
import 'package:latlong2/latlong.dart';

abstract class PlacesRepository {
  late PlacesRestClient placesRestClient;
  Future<DataState<List<PlacesEntity>>> getNearMosque(
      {required LatLng currentLocation});
}
