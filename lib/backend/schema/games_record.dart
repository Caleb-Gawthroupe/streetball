import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// List of all games with their data
class GamesRecord extends FirestoreRecord {
  GamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "scoreCap" field.
  int? _scoreCap;
  int get scoreCap => _scoreCap ?? 0;
  bool hasScoreCap() => _scoreCap != null;

  // "winByTwo" field.
  bool? _winByTwo;
  bool get winByTwo => _winByTwo ?? false;
  bool hasWinByTwo() => _winByTwo != null;

  // "minRep" field.
  int? _minRep;
  int get minRep => _minRep ?? 0;
  bool hasMinRep() => _minRep != null;

  // "minRating" field.
  int? _minRating;
  int get minRating => _minRating ?? 0;
  bool hasMinRating() => _minRating != null;

  // "isPrivate" field.
  bool? _isPrivate;
  bool get isPrivate => _isPrivate ?? false;
  bool hasIsPrivate() => _isPrivate != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "maxPlayers" field.
  int? _maxPlayers;
  int get maxPlayers => _maxPlayers ?? 0;
  bool hasMaxPlayers() => _maxPlayers != null;

  // "currentPlayers" field.
  int? _currentPlayers;
  int get currentPlayers => _currentPlayers ?? 0;
  bool hasCurrentPlayers() => _currentPlayers != null;

  // "teamSize" field.
  int? _teamSize;
  int get teamSize => _teamSize ?? 0;
  bool hasTeamSize() => _teamSize != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "team1Score" field.
  int? _team1Score;
  int get team1Score => _team1Score ?? 0;
  bool hasTeam1Score() => _team1Score != null;

  // "team2Score" field.
  int? _team2Score;
  int get team2Score => _team2Score ?? 0;
  bool hasTeam2Score() => _team2Score != null;

  // "players" field.
  List<String>? _players;
  List<String> get players => _players ?? const [];
  bool hasPlayers() => _players != null;

  // "gameStatus" field.
  String? _gameStatus;
  String get gameStatus => _gameStatus ?? '';
  bool hasGameStatus() => _gameStatus != null;

  // "createTime" field.
  DateTime? _createTime;
  DateTime? get createTime => _createTime;
  bool hasCreateTime() => _createTime != null;

  // "hostUid" field.
  String? _hostUid;
  String get hostUid => _hostUid ?? '';
  bool hasHostUid() => _hostUid != null;

  // "expectedResultTeam1" field.
  double? _expectedResultTeam1;
  double get expectedResultTeam1 => _expectedResultTeam1 ?? 0.0;
  bool hasExpectedResultTeam1() => _expectedResultTeam1 != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _scoreCap = castToType<int>(snapshotData['scoreCap']);
    _winByTwo = snapshotData['winByTwo'] as bool?;
    _minRep = castToType<int>(snapshotData['minRep']);
    _minRating = castToType<int>(snapshotData['minRating']);
    _isPrivate = snapshotData['isPrivate'] as bool?;
    _password = snapshotData['password'] as String?;
    _maxPlayers = castToType<int>(snapshotData['maxPlayers']);
    _currentPlayers = castToType<int>(snapshotData['currentPlayers']);
    _teamSize = castToType<int>(snapshotData['teamSize']);
    _description = snapshotData['description'] as String?;
    _team1Score = castToType<int>(snapshotData['team1Score']);
    _team2Score = castToType<int>(snapshotData['team2Score']);
    _players = getDataList(snapshotData['players']);
    _gameStatus = snapshotData['gameStatus'] as String?;
    _createTime = snapshotData['createTime'] as DateTime?;
    _hostUid = snapshotData['hostUid'] as String?;
    _expectedResultTeam1 =
        castToType<double>(snapshotData['expectedResultTeam1']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('games');

  static Stream<GamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GamesRecord.fromSnapshot(s));

  static Future<GamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GamesRecord.fromSnapshot(s));

  static GamesRecord fromSnapshot(DocumentSnapshot snapshot) => GamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGamesRecordData({
  String? name,
  LatLng? location,
  int? scoreCap,
  bool? winByTwo,
  int? minRep,
  int? minRating,
  bool? isPrivate,
  String? password,
  int? maxPlayers,
  int? currentPlayers,
  int? teamSize,
  String? description,
  int? team1Score,
  int? team2Score,
  String? gameStatus,
  DateTime? createTime,
  String? hostUid,
  double? expectedResultTeam1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'scoreCap': scoreCap,
      'winByTwo': winByTwo,
      'minRep': minRep,
      'minRating': minRating,
      'isPrivate': isPrivate,
      'password': password,
      'maxPlayers': maxPlayers,
      'currentPlayers': currentPlayers,
      'teamSize': teamSize,
      'description': description,
      'team1Score': team1Score,
      'team2Score': team2Score,
      'gameStatus': gameStatus,
      'createTime': createTime,
      'hostUid': hostUid,
      'expectedResultTeam1': expectedResultTeam1,
    }.withoutNulls,
  );

  return firestoreData;
}

class GamesRecordDocumentEquality implements Equality<GamesRecord> {
  const GamesRecordDocumentEquality();

  @override
  bool equals(GamesRecord? e1, GamesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.scoreCap == e2?.scoreCap &&
        e1?.winByTwo == e2?.winByTwo &&
        e1?.minRep == e2?.minRep &&
        e1?.minRating == e2?.minRating &&
        e1?.isPrivate == e2?.isPrivate &&
        e1?.password == e2?.password &&
        e1?.maxPlayers == e2?.maxPlayers &&
        e1?.currentPlayers == e2?.currentPlayers &&
        e1?.teamSize == e2?.teamSize &&
        e1?.description == e2?.description &&
        e1?.team1Score == e2?.team1Score &&
        e1?.team2Score == e2?.team2Score &&
        listEquality.equals(e1?.players, e2?.players) &&
        e1?.gameStatus == e2?.gameStatus &&
        e1?.createTime == e2?.createTime &&
        e1?.hostUid == e2?.hostUid &&
        e1?.expectedResultTeam1 == e2?.expectedResultTeam1;
  }

  @override
  int hash(GamesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.location,
        e?.scoreCap,
        e?.winByTwo,
        e?.minRep,
        e?.minRating,
        e?.isPrivate,
        e?.password,
        e?.maxPlayers,
        e?.currentPlayers,
        e?.teamSize,
        e?.description,
        e?.team1Score,
        e?.team2Score,
        e?.players,
        e?.gameStatus,
        e?.createTime,
        e?.hostUid,
        e?.expectedResultTeam1
      ]);

  @override
  bool isValidKey(Object? o) => o is GamesRecord;
}
