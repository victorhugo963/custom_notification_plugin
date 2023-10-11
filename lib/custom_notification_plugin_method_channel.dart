import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'custom_notification_plugin_platform_interface.dart';

/// An implementation of [CustomNotificationPluginPlatform] that uses method channels.
class MethodChannelCustomNotificationPlugin
    extends CustomNotificationPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('custom_notification_plugin');

  @override
  Future<String?> showCustomNotification() async {
    final version =
        await methodChannel.invokeMethod<String>('showCustomNotification');
    return version;
  }
}
