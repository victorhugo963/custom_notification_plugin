import 'package:custom_notification_plugin/custom_notification_plugin.dart';
import 'package:custom_notification_plugin/custom_notification_plugin_method_channel.dart';
import 'package:custom_notification_plugin/custom_notification_plugin_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCustomNotificationPluginPlatform
    with MockPlatformInterfaceMixin
    implements CustomNotificationPluginPlatform {
  @override
  Future<String?> showCustomNotification() => Future.value('42');
}

void main() {
  final CustomNotificationPluginPlatform initialPlatform =
      CustomNotificationPluginPlatform.instance;

  test('$MethodChannelCustomNotificationPlugin is the default instance', () {
    expect(
        initialPlatform, isInstanceOf<MethodChannelCustomNotificationPlugin>());
  });

  test('showCustomNotification', () async {
    CustomNotificationPlugin customNotificationPlugin =
        CustomNotificationPlugin();
    MockCustomNotificationPluginPlatform fakePlatform =
        MockCustomNotificationPluginPlatform();
    CustomNotificationPluginPlatform.instance = fakePlatform;

    expect(await customNotificationPlugin.showCustomNotification(), '42');
  });
}
