import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geo_attendance/core/data/network/retrofit/request/places_rest_client.dart';
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
    try {
      final response = await getStateOf(
          request: () => placesRestClient.getPlaces(
              category: "religion.place_of_worship",
              filter:
                  "circle:${currentLocation.longitude},${currentLocation.latitude},5000",
              bias:
                  "proximity:${currentLocation.longitude},${currentLocation.latitude}",
              limit: 20,
              apiKey: dotenv.env['PLACES_API_KEY'] ?? "-"));
      Fimber.d("response: $response");

      if (response is DataSuccess) {
        return DataSuccess(response.data?.toPlacesEntities() ?? []);
      } else if (response is DataFailed) {
        Fimber.d("response: ${response.error?.message ?? "-"}");
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
