import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _createGameName = '';
  String get createGameName => _createGameName;
  set createGameName(String value) {
    _createGameName = value;
  }

  LatLng? _gameLocation;
  LatLng? get gameLocation => _gameLocation;
  set gameLocation(LatLng? value) {
    _gameLocation = value;
  }

  int _gameScoreCap = 0;
  int get gameScoreCap => _gameScoreCap;
  set gameScoreCap(int value) {
    _gameScoreCap = value;
  }

  bool _winByTwo = false;
  bool get winByTwo => _winByTwo;
  set winByTwo(bool value) {
    _winByTwo = value;
  }

  int _minRep = 0;
  int get minRep => _minRep;
  set minRep(int value) {
    _minRep = value;
  }

  int _minRating = 0;
  int get minRating => _minRating;
  set minRating(int value) {
    _minRating = value;
  }

  String _gamePassword = '';
  String get gamePassword => _gamePassword;
  set gamePassword(String value) {
    _gamePassword = value;
  }

  bool _isPrivate = false;
  bool get isPrivate => _isPrivate;
  set isPrivate(bool value) {
    _isPrivate = value;
  }

  int _gameMaxPlayer = 0;
  int get gameMaxPlayer => _gameMaxPlayer;
  set gameMaxPlayer(int value) {
    _gameMaxPlayer = value;
  }

  int _gameTeamSize = 0;
  int get gameTeamSize => _gameTeamSize;
  set gameTeamSize(int value) {
    _gameTeamSize = value;
  }

  String _gameDescription = '';
  String get gameDescription => _gameDescription;
  set gameDescription(String value) {
    _gameDescription = value;
  }

  bool _doesAgree = false;
  bool get doesAgree => _doesAgree;
  set doesAgree(bool value) {
    _doesAgree = value;
  }

  LatLng? _testCurrentLocation = LatLng(43.95128225831101, -80.1025656228457);
  LatLng? get testCurrentLocation => _testCurrentLocation;
  set testCurrentLocation(LatLng? value) {
    _testCurrentLocation = value;
  }
}
