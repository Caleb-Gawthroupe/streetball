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
import 'dart:math';

Future<void> calculateAndPushExpectedResult(
  String gameId,
) async {
  try {
    final gameRef = FirebaseFirestore.instance.collection('games').doc(gameId);
    final gameSnapshot = await gameRef.get();
    final gameData = gameSnapshot.data();

    if (gameData == null) return;

    List<dynamic> allPlayerUIDs = gameData['players'] ?? [];

    // Fetch all player documents
    final playerDocs = await Future.wait(
      allPlayerUIDs.map((uid) =>
          FirebaseFirestore.instance.collection('users').doc(uid).get()),
    );

    // Separate players into teams based on their 'team' field
    final team1Docs =
        playerDocs.where((doc) => doc.data()?['team'] == 1).toList();
    final team2Docs =
        playerDocs.where((doc) => doc.data()?['team'] == 2).toList();

    // Sum Elo ratings for each team
    int team1Rating = team1Docs.fold(0, (sum, doc) {
      final data = doc.data();
      final rank = data?['rank'] ?? 1000;
      return sum + (rank is int ? rank : int.tryParse(rank.toString()) ?? 1000);
    });

    int team2Rating = team2Docs.fold(0, (sum, doc) {
      final data = doc.data();
      final rank = data?['rank'] ?? 1000;
      return sum + (rank is int ? rank : int.tryParse(rank.toString()) ?? 1000);
    });

    // Calculate expected score for Team 1
    double expectedTeam1 = 1 / (1 + pow(10, (team2Rating - team1Rating) / 400));

    // Push to Firestore
    await gameRef.update({
      'expectedResultTeam1': expectedTeam1,
    });
  } catch (e) {
    print('Error in calculateAndPushExpectedResult: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
