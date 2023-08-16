import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class LocalState {
  ValueNotifier<bool> switchValueNotifier;
  ValueNotifier<bool> decisionBtnNotifier;

  LocalState()
      : switchValueNotifier = ValueNotifier<bool>(true),
        decisionBtnNotifier = ValueNotifier<bool>(false);
}
