
import 'dart:async';

import 'package:flutter/services.dart';

class IosToFlutter {
  static const MethodChannel _channel = MethodChannel('ios_to_flutter');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
