part of 'app_exception.dart';

class AppExceptionHandler {
  static void handleApiErrors(Object error) {
    AppException exception = AppException();

    final errorString = error.toString().toLowerCase();

    if (errorString.contains('connection error')) {
      exception = InternetSocketException('Unable to connect');
    } else if (error is AssertionError) {
      exception = AssertionException(error.message?.toString());
    } else if (error is AppException) {
      exception = error;
    } else if (error is SocketException) {
      exception = InternetSocketException(error.message);
    } else if (error is TimeoutException) {
      exception = ApiTimeOutException(error.message);
    } else if (error is PlatformException) {
      exception = PlatFormException(error.message);
    } else {
      exception = AppException();
    }
    throw exception;
  }
}
