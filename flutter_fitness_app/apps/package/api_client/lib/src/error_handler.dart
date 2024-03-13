import 'package:api_client/src/api_client_exception.dart';
import 'package:api_client/src/failure.dart';
import 'package:equatable/equatable.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  unknown,
}

class ErrorHandler implements Exception {
  ErrorHandler();

  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is ApiClientException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.unknown.getFailure();
    }
  }

  Failure _handleError(ApiClientException error) {
    switch (error.type) {
      case ExceptionType.badCertificate:
        return DataSource.unknown.getFailure();
      case ExceptionType.connectionError:
        return DataSource.noInternetConnection.getFailure();
      case ExceptionType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case ExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case ExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case ExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.badRequest:
            return DataSource.badRequest.getFailure();
          case ResponseCode.forbidden:
            return DataSource.forbidden.getFailure();
          case ResponseCode.unAuthorised:
            return DataSource.unAuthorised.getFailure();
          case ResponseCode.notFound:
            return DataSource.notFound.getFailure();
          case ResponseCode.internalServerError:
            return DataSource.internalServerError.getFailure();
          default:
            return DataSource.unknown.getFailure();
        }
      case ExceptionType.cancel:
        return DataSource.cancel.getFailure();
      case ExceptionType.unknown:
        return DataSource.unknown.getFailure();
      default:
        DataSource.unknown.getFailure();
    }
    return DataSource.unknown.getFailure();
  }

  List<Object?> get props => [failure];
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return const Failure(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContent:
        return const Failure(
          ResponseCode.noContent,
          ResponseMessage.noContent,
        );
      case DataSource.badRequest:
        return const Failure(
          ResponseCode.badRequest,
          ResponseMessage.badRequest,
        );
      case DataSource.forbidden:
        return const Failure(
          ResponseCode.forbidden,
          ResponseMessage.forbidden,
        );
      case DataSource.unAuthorised:
        return const Failure(
          ResponseCode.unAuthorised,
          ResponseMessage.unAuthorised,
        );
      case DataSource.notFound:
        return const Failure(
          ResponseCode.notFound,
          ResponseMessage.notFound,
        );
      case DataSource.internalServerError:
        return const Failure(
          ResponseCode.internalServerError,
          ResponseMessage.internalServerError,
        );
      case DataSource.connectTimeout:
        return const Failure(
          ResponseCode.connectTimeout,
          ResponseMessage.connectTimeout,
        );
      case DataSource.cancel:
        return const Failure(
          ResponseCode.cancel,
          ResponseMessage.cancel,
        );
      case DataSource.receiveTimeout:
        return const Failure(
          ResponseCode.receiveTimeout,
          ResponseMessage.receiveTimeout,
        );
      case DataSource.sendTimeout:
        return const Failure(
          ResponseCode.sendTimeout,
          ResponseMessage.sendTimeout,
        );
      case DataSource.cacheError:
        return const Failure(
          ResponseCode.cacheError,
          ResponseMessage.cacheError,
        );
      case DataSource.noInternetConnection:
        return const Failure(
          ResponseCode.noInternetConnection,
          ResponseMessage.noInternetConnection,
        );
      case DataSource.unknown:
        return const Failure(
          ResponseCode.unknown,
          ResponseMessage.unknown,
        );
      default:
        return const Failure(
          ResponseCode.unknown,
          ResponseMessage.unknown,
        );
    }
  }

  List<Object?> get props => [this];
}

class ResponseCode extends Equatable {
  //api status code
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unAuthorised = 401;
  static const int notFound = 404;
  static const int internalServerError = 500;

  // local status code
  static const int unknown = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;

  @override
  List<Object?> get props => [];
}

class ResponseMessage extends Equatable {
  // Api status codes
  static const String success = 'Success';
  static const String noContent = 'Success with no content';
  static const String badRequest = 'Bad request, try again later';
  static const String forbidden = 'Forbidden request, try again later';
  static const String unAuthorised = 'User is unauthorised, try again later';
  static const String notFound = 'URL is not found, try again later';
  static const String internalServerError =
      'Something went wrong, try again later';

  // local status code
  static const String unknown = 'Something went wrong, try again later';
  static const String connectTimeout = 'Timeout Error, try again later';
  static const String cancel = 'Request was cancelled, try again later';
  static const String receiveTimeout = 'Timeout Error, try again later';
  static const String sendTimeout = 'Timeout Error, try again later';
  static const String cacheError = 'Cache Error, try again later';
  static const String noInternetConnection =
      'Please check your internet connection';

  @override
  List<Object?> get props => [];
}

class ApiInternalStatus extends Equatable {
  static const int success = 0;
  static const int failure = 1;

  @override
  List<Object?> get props => [];
}
