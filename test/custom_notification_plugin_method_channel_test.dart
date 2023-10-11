import 'package:custom_notification_plugin/custom_notification_plugin_method_channel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelCustomNotificationPlugin platform =
      MethodChannelCustomNotificationPlugin();
  const MethodChannel channel = MethodChannel('custom_notification_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('showCustomNotification', () async {
    expect(await platform.showCustomNotification(), '42');
  });
}
