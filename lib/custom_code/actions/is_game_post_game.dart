// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> isGamePostGame(String gameId) async {
  const int maxRetries = 3;
  const int delayMs = 300;

  for (int attempt = 0; attempt < maxRetries; attempt++) {
    try {
      final gameDoc = await FirebaseFirestore.instance
          .collection('games')
          .doc(gameId)
          .get();

      if (!gameDoc.exists) return false;

      final gameStatus = gameDoc.data()?['gameStatus'] ?? '';

      if (gameStatus == 'postGame') {
        return true;
      }
    } catch (e) {
      print('Error checking gameStatus (attempt $attempt): $e');
    }

    await Future.delayed(Duration(milliseconds: delayMs));
  }

  return false;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
