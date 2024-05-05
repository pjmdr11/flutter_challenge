class AppException implements Exception {
  final String? code;
  final String? message;
  final String? details;
  final int? statusCode;

  AppException({this.statusCode, this.code, this.message, this.details});

  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details, {super.statusCode})
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details, {super.statusCode})
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details, {super.statusCode})
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details, {super.statusCode})
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details, {super.statusCode})
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}
