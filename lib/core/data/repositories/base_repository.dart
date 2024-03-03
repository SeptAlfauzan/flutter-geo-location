import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:geo_attendance/core/utils/data_state.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';

abstract class BaseApiRepository {
  /// This method is responsible of handling the given `request`, in which
  /// it returns generic based `DataState`.
  ///
  /// Returns `DataSuccess` that holds the generic data `T` if the response
  /// is successfully recieved.
  ///
  /// Returns `DataFailed` that holds a `DioError` instance if any error occurs
  /// while sending the request or recieving the response.
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        throw DioException(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioException catch (error) {
      if (error.response != null) {
        final data = error.response?.data;
        if (data != null && data["message"] != null) {
          String message = data["message"];
          message = "${error.response?.statusCode} $message";
          return DataFailed(error.copyWith(message: message));
        }
      }
      return DataFailed(error);
    }
  }

  @protected
  Future<DataState<T>> postStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else if (httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data);
      } else {
        throw DioException(
          message: httpResponse.data.toString(),
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioException catch (error) {
      if (error.response != null) {
        final data = error.response?.data;
        if (data != null && data["message"] != null) {
          String message = data["message"];
          message = "${error.response?.statusCode} $message";
          return DataFailed(error.copyWith(message: message));
        }
      }
      return DataFailed(error);
    }
  }

  @protected
  Future<DataState<T>> patchStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else if (httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data);
      } else {
        throw DioException(
          message: httpResponse.data.toString(),
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioException catch (error) {
      if (error.response != null) {
        final data = error.response?.data;
        if (data != null && data["message"] != null) {
          String message = data["message"];
          message = "${error.response?.statusCode} $message";
          return DataFailed(error.copyWith(message: message));
        }
      }
      return DataFailed(error);
    }
  }

  @protected
  Future<DataState<T>> deleteStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else if (httpResponse.response.statusCode == HttpStatus.noContent) {
        return DataSuccess(httpResponse.data);
      } else {
        throw DioException(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioException catch (error) {
      if (error.response != null) {
        final data = error.response?.data;
        if (data != null && data["message"] != null) {
          String message = data["message"];
          message = "${error.response?.statusCode} $message";
          return DataFailed(error.copyWith(message: message));
        }
      }
      return DataFailed(error);
    }
  }
}
