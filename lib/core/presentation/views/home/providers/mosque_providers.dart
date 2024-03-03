import 'package:geo_attendance/core/di/locator.dart';
import 'package:geo_attendance/core/domain/entities/places/places_entity.dart';
import 'package:geo_attendance/core/domain/repositories/places_repository.dart';
import 'package:geo_attendance/core/utils/data_state.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mosque_providers.g.dart';

@riverpod
Future<DataState<List<PlacesEntity>>> nearestMosque(
    NearestMosqueRef ref) async {
  final PlacesRepository placesRepository = locator<PlacesRepository>();
  final response = await placesRepository.getNearMosque(
      currentLocation:
          const LatLng(0, 0)); //TODO: replace this with actual location
  return response;
}
