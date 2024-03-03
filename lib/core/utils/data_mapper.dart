import 'package:geo_attendance/core/data/network/retrofit/response_model/places_response/get/get_places_response/get_places_response.dart';
import 'package:geo_attendance/core/domain/entities/places/places_entity.dart';

// class DataMapper {
//   extension PlacesEntity on GetPlacesResponse {
//   PlacesEntity capitalizeFirstLetter() {
//     // if (isEmpty) {
//     //   return this;
//     // }
//     // return '${this[0].toUpperCase()}${substring(1)}';
//   }
// }

extension PlacesParsing on GetPlacesResponse {
  List<PlacesEntity> toPlacesEntities() => (features?.map((it) {
            final item = it.properties;
            final categories =
                item?.categories?.map((e) => e.toString()).toList();
            return PlacesEntity(
                name: item?.name ?? "",
                country: item?.country ?? "",
                region: item?.region ?? "",
                state: item?.state ?? "",
                county: item?.county ?? "",
                city: item?.city ?? "",
                lon: item?.lon ?? 0.0,
                lat: item?.lat ?? 0.0,
                addressLine1: item?.addressLine1 ?? "",
                addressLine2: item?.addressLine2 ?? "",
                categories: categories ?? []);
          }) ??
          [])
      .toList();
}
