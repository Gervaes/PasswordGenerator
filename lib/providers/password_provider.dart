import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

class Password extends StateNotifier<String> {
  Password() : super("");

  void updatePassword(List<dynamic> config) {
    String seed = config.fold("", (seedCharacters, configItem) => configItem["active"] ? '$seedCharacters${configItem["characters"]}' : seedCharacters);
    var r = Random();
    
    state = List.generate(12, (index) => seed[r.nextInt(seed.length)]).join();
  }
}