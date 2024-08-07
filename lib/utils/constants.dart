import 'package:flutter/cupertino.dart';

class Constants{
  static void clearFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}