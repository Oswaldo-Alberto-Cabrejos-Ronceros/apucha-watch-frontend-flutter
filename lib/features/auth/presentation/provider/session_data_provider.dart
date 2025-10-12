import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionDataNotifier extends Notifier<Map<String, dynamic>?> {
  @override
  Map<String, String?> build() {
    return {};
  }

  void login(String token, String userId) {
    state = {'token': token, 'userId': userId};
  }

  void logout() {
    state = {};
  }

  void setDeviceId(int deviceId) {
    state = {...?state, 'deviceId': deviceId};
  }

  void cleanDeviceId() {
    if (state != null && state!.containsKey('deviceId')) {
      final newState = {...state!};
      newState.remove('deviceId');
      state = newState;
    }
  }
}

//provider global
final sessionDataProvider =
    NotifierProvider<SessionDataNotifier, Map<String, dynamic>?>(
      SessionDataNotifier.new,
    );
