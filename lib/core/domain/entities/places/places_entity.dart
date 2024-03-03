class PlacesEntity {
  final String name;
  final String country;
  final String region;
  final String state;
  final String county;
  final String city;
  final double lon;
  final double lat;
  final String addressLine1;
  final String addressLine2;
  final List<String> categories;

  PlacesEntity({
    required this.name,
    required this.country,
    required this.region,
    required this.state,
    required this.county,
    required this.city,
    required this.lon,
    required this.lat,
    required this.addressLine1,
    required this.addressLine2,
    required this.categories,
  });
}
