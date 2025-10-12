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

  void setDeviceId(String deviceId) {
    state = {...?state, 'deviceId': deviceId};
  }

  //provider global
  final sessionDataProvider =
      NotifierProvider<SessionDataNotifier, Map<String, dynamic>?>(
        SessionDataNotifier.new,
      );
}
