import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pushnotifications_controller.g.dart';

@riverpod
class PushNotificationsController extends _$PushNotificationsController {
  bool getPushNotificationsStatusFromSharedPrefs() {
    return true;
  }
  
  void toggle() {
    // Todo: confirm or do other things
    state = !state;
  }

  @override
  bool build() => getPushNotificationsStatusFromSharedPrefs();
}
