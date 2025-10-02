// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> checkAllDownloadedAndSetLobby(String gameId, bool isHost) async {
  if (!isHost) return;

  try {
    // Step 1: Query all users in the game by currentGameID
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('currentGameID', isEqualTo: gameId)
        .get();

    // Step 2: Extract hasDownloadedNewRank values
    final downloads = querySnapshot.docs
        .map((doc) => doc.data()['hasDownloadedNewRank'] as bool?)
        .toList();

    // Step 3: If any user has not downloaded yet (null or false), exit early
    if (downloads.any((downloaded) => downloaded != true)) return;

    // Step 4: All have downloaded, update gameStatus to "lobby"
    final gameRef = FirebaseFirestore.instance.collection('games').doc(gameId);
    await gameRef.update({'gameStatus': 'lobby'});
  } catch (e) {
    print('checkAllDownloadedAndSetLobby error: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
