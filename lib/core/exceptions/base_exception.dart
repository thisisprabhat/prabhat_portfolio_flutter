part of 'app_exception.dart';

///### A base exception class that can be used to create custom exceptions.
///* This class has been used to create custom exceptions that can be thrown
///* There are different exceptions created using this class and are kept in `app_exception.dart` file and has predefined assets, title and messages
/// #### This is default parameters for AppException:
/// ```
/// AppException({
///   this.message = 'Something went wrong.',
///   this.title = 'Oops!',
///   this.assetPath = Assets.lottieSomethingWentWrong,
/// });
/// ```
/// * `AppException.fromObject(e)` method is used to convert any object to AppException
/// * We can pass custom error msg as `AppException.fromObject(e, 'Custom Message')`
class AppException implements Exception {
  ///* This title is optional but will be display in the UI if given
  final String? title;

  ///* This message will be display in the UI
  final String? message;

  ///### We can have any assets type in assetPath:
  /// * svg
  /// * png, jpeg, gif
  /// * lottie
  /// * rive
  final String? assetPath;
  AppException({
    this.message = 'Something went wrong.',
    this.title = 'Oops!',
    this.assetPath = "Assets.lottieSomethingWentWrong",
  });

  ///### This method is used to convert any object to AppException
  static AppException fromObject(e, [String? message]) {
    return e is AppException
        ? e
        : AppException(message: message ?? e.toString());
  }

  ///### This override method is used to return the error message
  @override
  String toString() => message ?? '';

  ///### This method is used to print the error in the console
  get print {
    ColoredLog(
      '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~',
      name: runtimeType.toString(),
    );
    if (title != null) ColoredLog.red(title, name: 'title');
    if (message != null) ColoredLog.red(message, name: 'message');
    if (assetPath != null) ColoredLog.red(assetPath, name: 'errorAsset');
    ColoredLog('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  }

  ///### This method is used to print the AppExceptionType in the console
  get printError => ColoredLog.red(this, name: runtimeType.toString());
}
