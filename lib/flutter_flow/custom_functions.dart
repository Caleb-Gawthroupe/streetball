import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int getTeamAssignment(List<int> teams) {
  int team1Count = 0;
  int team2Count = 0;

  for (final team in teams) {
    if (team == 1)
      team1Count++;
    else if (team == 2) team2Count++;
  }

  return (team1Count <= team2Count) ? 1 : 2;
}

List<String> filterPlayersByTeam(
  List<String> players,
  int teamNumber,
) {
  return players.where((p) {
    final parsed = jsonDecode(p);
    return parsed['team'] == teamNumber;
  }).toList();
}

List<String> switchTeamInList(
  List<String> players,
  String uid,
) {
  List<String> updatedPlayers = [];

  for (var playerJson in players) {
    final player = jsonDecode(playerJson);

    if (player['uid'] == uid) {
      // Toggle team: 1 → 2, 2 → 1
      player['team'] = (player['team'] == 1) ? 2 : 1;
    }

    updatedPlayers.add(jsonEncode(player));
  }

  return updatedPlayers;
}

List<String> updateElo(
  List<String> playersList,
  int winningTeam,
  int kFactor,
) {
  // Step 1: Parse JSON into Map objects
  List<Map<String, dynamic>> parsedPlayers = playersList
      .map<Map<String, dynamic>>((p) => jsonDecode(p) as Map<String, dynamic>)
      .toList();

  // Step 2: Separate players into teams
  final team1 = parsedPlayers.where((p) => p['team'] == 1).toList();
  final team2 = parsedPlayers.where((p) => p['team'] == 2).toList();

  // Step 3: Calculate total rating for each team
  final team1Rating = team1.fold(0, (sum, p) => sum + (p['rating'] as int));
  final team2Rating = team2.fold(0, (sum, p) => sum + (p['rating'] as int));

  // Step 4: Calculate Elo expected result and deltas
  final expectedTeam1 =
      1 / (1 + math.pow(10, (team2Rating - team1Rating) / 400));
  final actualTeam1 = (winningTeam == 1) ? 1.0 : 0.0;
  final deltaTeam1 = (kFactor * (actualTeam1 - expectedTeam1)).round();
  final deltaTeam2 = -deltaTeam1;

  // Step 5: Update ratings and reset voting/ready status
  List<String> updatedPlayers = [];

  for (var player in parsedPlayers) {
    int rating = player['rating'];
    int team = player['team'];

    // Update rating
    int newRating = team == 1 ? rating + deltaTeam1 : rating + deltaTeam2;
    player['rating'] = newRating;

    // Reset voting and ready fields
    player['hasVoted'] = false;
    player['vote'] = "";
    player['isReady'] = false;

    updatedPlayers.add(jsonEncode(player));
  }

  return updatedPlayers;
}

int switchTeam(int currentTeam) {
  return currentTeam == 1 ? 2 : 1;
}

bool isValidScore(
  int team1Score,
  int team2Score,
  int maxScore,
  bool winByTwo,
) {
  // One team must win: no ties
  if (team1Score == team2Score) {
    return false;
  }

  // Check which team is winning and their score difference
  int scoreDiff = (team1Score - team2Score).abs();
  int winningScore = team1Score > team2Score ? team1Score : team2Score;

  // Winning team must have at least maxScore
  if (winningScore < maxScore) {
    return false;
  }

  // If win by two is required, the difference must be >= 2
  if (winByTwo && scoreDiff < 2) {
    return false;
  }

  return true;
}

int calculateNewRating(
  int team1Score,
  int team2Score,
  int userTeam,
  double kValue,
  double expectedResultTeam1,
  int currentRank,
) {
  // Determine actual result for Team 1 (no ties)
  double actualResultTeam1 = (team1Score > team2Score) ? 1.0 : 0.0;

  // Determine actual result for the user depending on their team
  double actualResultUser =
      (userTeam == 1) ? actualResultTeam1 : 1.0 - actualResultTeam1;

  // Calculate new rating
  double newRating =
      currentRank + kValue * (actualResultUser - expectedResultTeam1);

  // Return as int
  return newRating.round();
}

int calculateNewReputation(
  int currentRep,
  String vote,
) {
  int newRep = vote == "agree" ? currentRep + 5 : currentRep - 15;
  return newRep.clamp(0, 100); // also prevents dropping below 0
}
