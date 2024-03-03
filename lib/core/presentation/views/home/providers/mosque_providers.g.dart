// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mosque_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nearestMosqueHash() => r'a5f4d1ce6e53fd40cac1a095e10010ebb8b9f161';

/// See also [nearestMosque].
@ProviderFor(nearestMosque)
final nearestMosqueProvider =
    AutoDisposeFutureProvider<DataState<List<PlacesEntity>>>.internal(
  nearestMosque,
  name: r'nearestMosqueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nearestMosqueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NearestMosqueRef
    = AutoDisposeFutureProviderRef<DataState<List<PlacesEntity>>>;
String _$streamNearestMosqueHash() =>
    r'faae2323b88c8308f45f94811956d69462ae3363';

/// See also [streamNearestMosque].
@ProviderFor(streamNearestMosque)
final streamNearestMosqueProvider =
    AutoDisposeFutureProvider<DataState<List<PlacesEntity>>>.internal(
  streamNearestMosque,
  name: r'streamNearestMosqueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$streamNearestMosqueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StreamNearestMosqueRef
    = AutoDisposeFutureProviderRef<DataState<List<PlacesEntity>>>;
String _$streamPositionHash() => r'a66b85261e3e3ec4b821d44164b5b8ace1ab7e35';

/// See also [streamPosition].
@ProviderFor(streamPosition)
final streamPositionProvider = AutoDisposeStreamProvider<Position?>.internal(
  streamPosition,
  name: r'streamPositionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$streamPositionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StreamPositionRef = AutoDisposeStreamProviderRef<Position?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
