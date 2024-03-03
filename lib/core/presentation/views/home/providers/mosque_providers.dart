import 'dart:async';

import 'package:fimber/fimber.dart';
import 'package:geo_attendance/core/di/locator.dart';
import 'package:geo_attendance/core/domain/entities/places/places_entity.dart';
import 'package:geo_attendance/core/domain/repositories/places_repository.dart';
import 'package:geo_attendance/core/utils/data_state.dart';
import 'package:geo_attendance/core/utils/geo_locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mosque_providers.g.dart';

@riverpod
Future<DataState<List<PlacesEntity>>> nearestMosque(
    NearestMosqueRef ref) async {
  final PlacesRepository placesRepository = locator<PlacesRepository>();
  final currentLocation = await determinePosition();
  final response = await placesRepository.getNearMosque(
    currentLocation:
        LatLng(currentLocation.latitude, currentLocation.longitude),
  );
  return response;
}

@riverpod
Future<DataState<List<PlacesEntity>>> streamNearestMosque(
    StreamNearestMosqueRef ref) async {
  final PlacesRepository placesRepository = locator<PlacesRepository>();
  late LatLng currentLatLng;
  final currentLocation = ref.watch(streamPositionProvider).value;
  Fimber.d(currentLocation.toString());

  if (currentLocation != null) {
    currentLatLng = LatLng(currentLocation.latitude, currentLocation.longitude);
  } else {
    final currentLocation = await determinePosition();
    currentLatLng = LatLng(currentLocation.latitude, currentLocation.longitude);
  }

  final response =
      await placesRepository.getNearMosque(currentLocation: currentLatLng);
  Fimber.d(response.data?.length.toString() ?? "-");
  return response;
}

@riverpod
Stream<Position?> streamPosition(StreamPositionRef ref) {
  final streamController = StreamController<Position?>();

  getStreamPositionSubscription(
    onUpdatePosition: (p0) async {
      if (p0 != null) streamController.add(p0);
    },
  );
  return streamController.stream;
}
