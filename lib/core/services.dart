import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/core/utils/utils.dart';
import 'package:tic_tac_toe/provider/provider.dart';

class Services {
  static ontapped(BuildContext ctx, index) {
    final provider = Provider.of<CounterProvider>(ctx, listen: false);
    {
      if (!provider.winnerfound && provider.displayXO[index] == '') {
        if (provider.oturn) {
          provider.displayXO[index] = 'O';
          provider.fillBoxes++;
        } else {
          provider.displayXO[index] = 'X';
          provider.fillBoxes++;
        }
        provider.oturn = !provider.oturn;
        checkwinner(ctx);
        // NotificationListener;
      }
    }
    ;
  }

  static checkwinner(BuildContext ctx) {
    final provider = Provider.of<CounterProvider>(ctx, listen: false);
    // first row
    if (provider.displayXO[0] == provider.displayXO[1] &&
        provider.displayXO[0] == provider.displayXO[2] &&
        provider.displayXO[0] != '') {
      provider.resultdecleration = 'player  ${provider.displayXO[0]}wins';
      updatedscore(ctx, provider.displayXO[0]);
    }
    //second row
    if (provider.displayXO[3] == provider.displayXO[4] &&
        provider.displayXO[3] == provider.displayXO[5] &&
        provider.displayXO[3] != '') {
      provider.resultdecleration = 'player   ${provider.displayXO[3]} wins';
      updatedscore(ctx, provider.displayXO[3]);
    }
    // third row
    if (provider.displayXO[6] == provider.displayXO[7] &&
        provider.displayXO[6] == provider.displayXO[8] &&
        provider.displayXO[6] != '') {
      provider.resultdecleration = 'player ${provider.displayXO[6]} wins';
      updatedscore(ctx, provider.displayXO[6]);
    }
    //first column
    if (provider.displayXO[0] == provider.displayXO[3] &&
        provider.displayXO[0] == provider.displayXO[6] &&
        provider.displayXO[0] != '') {
      provider.resultdecleration = 'player ${provider.displayXO[0]} wins';
      updatedscore(ctx, provider.displayXO[0]);
    }
    //second column
    if (provider.displayXO[1] == provider.displayXO[4] &&
        provider.displayXO[1] == provider.displayXO[5] &&
        provider.displayXO[1] != '') {
      provider.resultdecleration = 'player ${provider.displayXO[1]} wins';
      updatedscore(ctx, provider.displayXO[1]);
    }
    //third column
    if (provider.displayXO[2] == provider.displayXO[5] &&
        provider.displayXO[2] == provider.displayXO[8] &&
        provider.displayXO[2] != '') {
      provider.resultdecleration = 'player ${provider.displayXO[2]} wins';
      updatedscore(ctx, provider.displayXO[2]);
    }
    //first diagle
    if (provider.displayXO[0] == provider.displayXO[4] &&
        provider.displayXO[0] == provider.displayXO[8] &&
        provider.displayXO[0] != '') {
      provider.resultdecleration = 'player ${provider.displayXO[0]} wins';
      updatedscore(ctx, provider.displayXO[0]);
    }
    //second diagle
    if (provider.displayXO[6] == provider.displayXO[4] &&
        provider.displayXO[6] == provider.displayXO[2] &&
        provider.displayXO[6] != '') {
      provider.resultdecleration = 'player ${provider.displayXO[6]} wins';
      updatedscore(ctx, provider.displayXO[6]);
    }
    if (provider.winnerfound && provider.fillBoxes == 9) {
      provider.resultdecleration = 'No body Win';
    }
    // NotificationListener;
  }

  static updatedscore(BuildContext ctx, String winner) {
    final provider = Provider.of<CounterProvider>(ctx, listen: false);
    if (winner == 'O') {
      provider.oValue++;
    } else if (winner == 'X') {
      provider.xValue++;
    }
    provider.winnerfound = true;
    Utils.showCustomDialog(ctx,
        'The match is over, and Player $winner won the match!', () {}, winner);
    // NotificationListener;
  }

  static resetGame(BuildContext ctx) {
    final provider = Provider.of<CounterProvider>(ctx, listen: false);
    provider.oturn = true;
    provider.resultdecleration = '';
    provider.fillBoxes = 0;
    provider.winnerfound = false;
    provider.displayXO = ['', '', '', '', '', '', '', '', ''];
    NotificationListener;
  }
}
