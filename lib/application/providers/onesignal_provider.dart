import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

import '../config.dart';

part 'onesignal_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> onesignal(OnesignalRef ref,
    {required BuildContext context}) async {
  bool requiresConsent = false;

  // only run this code when the platform is android
  if (Platform.isAndroid) {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setRequiresUserPrivacyConsent(requiresConsent);

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print('NOTIFICATION OPENED HANDLER CALLED WITH: $result');
    });

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      print('FOREGROUND HANDLER CALLED WITH: $event');

      /// Display Notification, send null to not display
      event.complete(null);
    });

    OneSignal.shared
        .setInAppMessageClickedHandler((OSInAppMessageAction action) {});

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges changes) {
      print("EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
    });

    OneSignal.shared
        .setSMSSubscriptionObserver((OSSMSSubscriptionStateChanges changes) {
      print("SMS SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setOnWillDisplayInAppMessageHandler((message) {
      print("ON WILL DISPLAY IN APP MESSAGE ${message.messageId}");
    });

    OneSignal.shared.setOnDidDisplayInAppMessageHandler((message) {
      print("ON DID DISPLAY IN APP MESSAGE ${message.messageId}");
    });

    OneSignal.shared.setOnWillDismissInAppMessageHandler((message) {
      print("ON WILL DISMISS IN APP MESSAGE ${message.messageId}");
    });

    OneSignal.shared.setOnDidDismissInAppMessageHandler((message) {
      print("ON DID DISMISS IN APP MESSAGE ${message.messageId}");
    });

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    await OneSignal.shared.setAppId(ref.watch(configProvider).oneSignalAppId);

    // iOS-only method to open launch URLs in Safari when set to false
    OneSignal.shared.setLaunchURLsInApp(false);

    requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();

    OneSignal.shared.disablePush(false);

    bool userProvidedPrivacyConsent =
        await OneSignal.shared.userProvidedPrivacyConsent();
    print("USER PROVIDED PRIVACY CONSENT: $userProvidedPrivacyConsent");

    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Push notifications is not supported in your device.')));
  }
}

@Riverpod(keepAlive: true)
Future<void> oneSignalController(OneSignalControllerRef ref) async {
  //
}
