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

Future<void> checkVotes(String gameId, bool isHost) async {
  if (!isHost) return;

  try {
    // Step 1: Query all users in the game
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('currentGameID', isEqualTo: gameId)
        .get();

    // Step 2: Extract votes from users
    final votes = querySnapshot.docs
        .map((doc) => doc.data()['vote']?.toString().trim() ?? '')
        .toList();

    // Step 3: If any vote is empty, exit early
    if (votes.any((v) => v.isEmpty)) return;

    // Step 4: Count "agree" votes
    final agreeCount = votes.where((v) => v.toLowerCase() == 'agree').length;

    // Step 5: Decide majority
    final majorityAgree = agreeCount > votes.length / 2;

    // Step 6: Update game status
    final gameRef = FirebaseFirestore.instance.collection('games').doc(gameId);

    if (majorityAgree) {
      await gameRef.update({'gameStatus': 'postGame'});
    } else {
      await gameRef.update({'gameStatus': 'inGame'});

      // Reset all votes
      for (final doc in querySnapshot.docs) {
        await doc.reference.update({'vote': ''});
      }
    }
  } catch (e) {
    print('checkVotes error: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
