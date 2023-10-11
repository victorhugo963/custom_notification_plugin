import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'custom_notification_plugin_method_channel.dart';

abstract class CustomNotificationPluginPlatform extends PlatformInterface {
  /// Constructs a CustomNotificationPluginPlatform.
  CustomNotificationPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static CustomNotificationPluginPlatform _instance =
      MethodChannelCustomNotificationPlugin();

  /// The default instance of [CustomNotificationPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelCustomNotificationPlugin].
  static CustomNotificationPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CustomNotificationPluginPlatform] when
  /// they register themselves.
  static set instance(CustomNotificationPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> showCustomNotification() {
    throw UnimplementedError(
        'showCustomNotification() has not been implemented.');
  }
}
