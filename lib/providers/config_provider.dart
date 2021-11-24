import 'package:flutter_riverpod/flutter_riverpod.dart';

class Config extends StateNotifier<dynamic> {
  Config() : super([
    {"description": "A-Z", "characters": "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "active": true},
    {"description": "a-z", "characters": "abcdefghijklmnopqrstuvwxyz", "active": true},
    {"description": "0-9", "characters": "0123456789", "active": true},
    {"description": "!@&", "characters": "!@#%&", "active": true},
  ]);

  void toggleConfig(int index) {
    state[index]["active"] = !state[index]["active"];
  }
}