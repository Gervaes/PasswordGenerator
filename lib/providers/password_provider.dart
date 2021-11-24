import 'dart:math';

import 'package:riverpod/riverpod.dart';

class Password extends StateNotifier<String> {
  Password() : super("");

  void updatePassword(List<dynamic> config) {
    String seed = config.fold("", (seedCharacters, configItem) => configItem.active ? '$seedCharacters$configItem' : seedCharacters);
    var r = Random();
    state = List.generate(seed.length, (index) => seed[r.nextInt(seed.length)]).join();
  }
}