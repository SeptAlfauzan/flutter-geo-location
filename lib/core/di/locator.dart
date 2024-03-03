import 'package:dio/dio.dart';
import 'package:geo_attendance/core/data/network/retrofit/request/places_rest_client.dart';
import 'package:geo_attendance/core/data/repositories/places_repository_impl.dart';
import 'package:geo_attendance/core/domain/repositories/places_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final dio = Dio(BaseOptions(contentType: 'application/json'));
  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<PlacesRestClient>(
    PlacesRestClient(locator<Dio>()),
  );
  locator.registerSingleton<PlacesRepository>(
    PlacesRepositoryImpl(placesRestClient: locator<PlacesRestClient>()),
  );
}
