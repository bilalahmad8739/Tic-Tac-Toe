import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/services.dart';

class CounterProvider extends ChangeNotifier {
  bool oturn = true;
  var resultdecleration = '';
  int fillBoxes = 0;
  var xValue = 0;
  var oValue = 0;
  bool winnerfound = false;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

  call(BuildContext context, index) {
    Services.ontapped(context, index);
    notifyListeners();
  }

  reset(BuildContext context) {
    Services.resetGame(context);
    notifyListeners();
  }
}
