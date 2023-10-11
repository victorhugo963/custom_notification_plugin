import 'custom_notification_plugin_platform_interface.dart';

class CustomNotificationPlugin {
  Future<String?> showCustomNotification() {
    return CustomNotificationPluginPlatform.instance.showCustomNotification();
  }
}
