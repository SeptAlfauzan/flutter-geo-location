import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geo_attendance/core/data/network/retrofit/request/places_rest_client.dart';
import 'package:geo_attendance/core/data/network/retrofit/response_model/places_response/get/get_places_response/get_places_response.dart';
import 'package:geo_attendance/core/data/repositories/base_repository.dart';
import 'package:geo_attendance/core/domain/entities/places/places_entity.dart';
import 'package:geo_attendance/core/domain/repositories/places_repository.dart';
import 'package:geo_attendance/core/utils/data_mapper.dart';
import 'package:geo_attendance/core/utils/data_state.dart';
import 'package:latlong2/latlong.dart';

class PlacesRepositoryImpl extends BaseApiRepository
    implements PlacesRepository {
  @override
  PlacesRestClient placesRestClient;

  PlacesRepositoryImpl({required this.placesRestClient});

  @override
  Future<DataState<List<PlacesEntity>>> getNearMosque(
      {required LatLng currentLocation}) async {
    // TODO: implement getNearMosque
    try {
      final response = await getStateOf(
          request: () => placesRestClient.getPlaces(
              category: "religion.place_of_worship",
              filter: "circle:112.61778380196108,-7.96163125,5000",
              bias: "proximity:112.61778380196108,-7.96163125",
              limit: 20,
              apiKey: dotenv.env['MAP_API_KEY'] ?? "-"));
      Fimber.d("response: $response");
      print("responsenya dong $response");

      if (response is DataSuccess) {
        return DataSuccess(response.data?.toPlacesEntities() ?? []);
      } else if (response is DataFailed) {
        return DataFailed(response.error!);
      } else {
        return const DataNotSet();
      }
    } on DioException catch (error) {
      String errorMessage =
          error.response?.data?["message"] ?? error.toString();
      if (error.toString().contains("connection error")) {
        errorMessage = "Error during connection!";
      }
      return DataFailed(error.copyWith(message: errorMessage));
    } catch (e) {
      throw e; //TODO: replace with exception handler
    }
  }
}
