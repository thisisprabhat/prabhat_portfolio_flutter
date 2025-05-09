import 'dart:async';

import 'package:colored_log/colored_log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:toastification/toastification.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:device_info_plus/device_info_plus.dart';

// Future<String> getDeviceId() async {
//   final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//   String deviceId = '';

//   if (Platform.isAndroid) {
//     final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
//     deviceId = androidInfo.id;
//   } else if (Platform.isIOS) {
//     final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
//     deviceId = iosInfo.identifierForVendor ?? '';
//   } else {
//     final info = await deviceInfoPlugin.deviceInfo;
//     deviceId = info.data['product']?.toString() ?? '';
//   }
//   ColoredLog.white(deviceId, name: 'DeviceId');

//   return deviceId;
// }

SizedBox sizedBoxHeight(double height) {
  return SizedBox(height: height);
}

SizedBox sizedBoxWidth(width) {
  return SizedBox(width: width);
}

double getHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

double getWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}

double getTop(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

double getMinSize(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  return size.width < size.height ? size.width : size.height;
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
  BuildContext context,
  String message, {
  int? duration,
  bool error = false,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: error ? Theme.of(context).colorScheme.error : null,
      content: Text(
        message,
        style: TextStyle(
          color: error ? Theme.of(context).colorScheme.onError : null,
        ),
      ),
      duration: Duration(seconds: duration ?? 3),
    ),
  );
}

// flutterToast(
//   var message, {
//   String? description,
//   int? time,
//   bool error = false,
//   bool warning = false,
//   bool success = false,
//   Function(ToastificationItem)? onTap,
//   Alignment? alignment,
// }) {
//   if (message is AppException) {
//     description ??= message.toString();
//     message = message.title;
//     error = true;
//   }

//   final color =
//       error
//           ? Colors.red
//           : success
//           ? Colors.green
//           : warning
//           ? Colors.yellow.shade700
//           : Colors.blue;

//   toastification.show(
//     title: Text(message?.toString() ?? '', style: TextStyle(color: color)),
//     // closeButtonShowType: CloseButtonShowType.always,
//     autoCloseDuration: Duration(seconds: time ?? 4),
//     style: ToastificationStyle.flat,
//     alignment: alignment ?? Alignment.bottomRight,
//     callbacks:
//         onTap == null
//             ? const ToastificationCallbacks()
//             : ToastificationCallbacks(onTap: onTap),
//     primaryColor: color,
//     borderSide: const BorderSide(color: Colors.grey, width: 0.4),
//     description:
//         description == null
//             ? null
//             : Text(description, style: TextStyle(color: color)),
//     progressBarTheme: ProgressIndicatorThemeData(color: color),
//     type:
//         error
//             ? ToastificationType.error
//             : success
//             ? ToastificationType.success
//             : warning
//             ? ToastificationType.warning
//             : ToastificationType.info,
//   );
// }

showToast(
  var message, {
  String? description,
  int? time,
  bool error = false,
  bool warning = false,
  bool success = false,
}) {
  return Fluttertoast.showToast(
    timeInSecForIosWeb: time ?? 3,
    msg: message.toString(),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor:
        error
            ? Colors.red
            : warning
            ? Colors.yellow.shade600
            : success
            ? Colors.green
            : Colors.grey.shade700,
    webBgColor:
        success
            ? "linear-gradient(to right, #0f6a11, #0fcc13)"
            : error
            ? "linear-gradient(to right, #7a0c0c, #c21c1c)"
            : "linear-gradient(to right, #091319, #164049)",
  );
}

void closeKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

List<TextInputFormatter> digitsInputFormatter({int? size}) {
  return [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(size ?? 10),
  ];
}

textInputFormatterMaxSize({int? size}) {
  return [LengthLimitingTextInputFormatter(size ?? 10)];
}

List<TextInputFormatter> inputLength(int? size) {
  return [LengthLimitingTextInputFormatter(size)];
}

OverlayEntry overlayLoader(context) {
  final loader = OverlayEntry(
    builder: (context) {
      return Container(
        color: Colors.black38,
        height: getHeight(context),
        width: getWidth(context),
        child: Center(
          child: SpinKitCircle(color: Theme.of(context).colorScheme.primary),
        ),
      );
    },
  );
  Overlay.of(context).insert(loader);
  return loader;
}

removeLoader(OverlayEntry? loader) {
  Timer(const Duration(milliseconds: 500), () {
    try {
      loader?.remove();
    } catch (e) {
      ColoredLog.red(e.toString());
    }
    loader = null;
  });
}

Container expandedDivider(color) {
  return Container(
    width: 22.0,
    margin: const EdgeInsets.only(top: 14),
    height: 2,
    color: color,
  );
}

Future<void> launchUrlString(String? url) async {
  try {
    await launchUrl(Uri.parse(url ?? ''));
    ColoredLog.cyan(url, name: 'Url');
  } catch (e) {
    ColoredLog.red(
      e,
      name: url == null || url == '' ? 'Launch Url Null' : "Launch Url error",
    );
  }
}
//! Navigation Methods ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

navigationPushReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

Future<T> navigationPush<T>(BuildContext context, Widget widget) async {
  T result = await Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => widget),
  );
  return result;
}

Future<T> navigationPushFullScreenDialog<T>(
  BuildContext context,
  Widget widget,
) async {
  return await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget, fullscreenDialog: true),
  );
}

navigationPushRemoveUntil(BuildContext context, Widget widget) async {
  return await Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );
}

void navigationPop<T>(BuildContext context, [T? result]) =>
    Navigator.pop(context, result);
