import 'package:http/http.dart' as http;

enum ExceptionType {
  connectionTimeout,
  sendTimeout,
  receiveTimeout,
  badCertificate,
  badResponse,
  cancel,
  connectionError,
  unknown,
}

class ApiClientException implements Exception {
  const ApiClientException({
    this.code,
    this.message,
    this.type,
    this.response,
  });

  final String? code;
  final String? message;
  final ExceptionType? type;
  final http.Response? response;

  ApiClientException copyWith({
    String? code,
    String? message,
    ExceptionType? type,
    http.Response? response,
  }) {
    return ApiClientException(
      code: code ?? this.code,
      message: message ?? this.message,
      type: type ?? this.type,
      response: response ?? this.response,
    );
  }

  List<Object?> get props => [code, message, type, response];
}
