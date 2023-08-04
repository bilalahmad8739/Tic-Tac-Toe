import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac_toe/provider/provider.dart';

class Utils {
  static showCustomDialog(BuildContext context, String message,
      VoidCallback onpress, String player) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<CounterProvider>(
          builder: (context, value, child) {
            return AlertDialog(
              title: const Text(
                'Game Over',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Text(message),
              actions: [
                Center(
                  child: Text(
                    'Congratlion to $player  player',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    onpress;
                    Navigator.pop(context);
                    value.reset(context);
                  },
                  child: const Text('Reset'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
