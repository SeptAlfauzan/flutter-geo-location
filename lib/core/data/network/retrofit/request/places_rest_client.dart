import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:geo_attendance/core/data/network/retrofit/response_model/location/location_response/location_response.dart';
import 'package:geo_attendance/core/utils/constanta.dart';

part 'places_rest_client.g.dart';

@RestApi(baseUrl: placesApiBaseUrl)
abstract class PlacesRestClient {
  factory PlacesRestClient(Dio dio, {String baseUrl}) = _PlacesRestClient;
  @GET('/places')
  Future<HttpResponse<LocationResponse>> getPlaces(
    @Query('categories') String category,
    @Query('filter') String filter,
    @Query('limit') int limit,
    @Query('apiKey') String apiKey,
  );
}
