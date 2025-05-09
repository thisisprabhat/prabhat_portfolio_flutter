import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int durationInMS;
  Timer? _timer;

  Debouncer({required this.durationInMS});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: durationInMS), action);
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  bool get isActive => _timer?.isActive ?? false;
}
