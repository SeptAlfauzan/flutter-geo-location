import 'package:dio/dio.dart';
import 'package:geo_attendance/core/data/network/retrofit/response_model/places_response/get/get_places_response/get_places_response.dart';
import 'package:retrofit/retrofit.dart';

import 'package:geo_attendance/core/utils/constanta.dart';

part 'places_rest_client.g.dart';

@RestApi(baseUrl: placesApiBaseUrl)
abstract class PlacesRestClient {
  factory PlacesRestClient(Dio dio, {String baseUrl}) = _PlacesRestClient;
  @GET('/places')
  Future<HttpResponse<GetPlacesResponse>> getPlaces({
    @Query('categories') required String category,
    @Query('filter') required String filter,
    @Query('bias') required String bias,
    @Query('limit') required int limit,
    @Query('apiKey') required String apiKey,
  });
}
