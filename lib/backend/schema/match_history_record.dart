import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchHistoryRecord extends FirestoreRecord {
  MatchHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "elo" field.
  int? _elo;
  int get elo => _elo ?? 0;
  bool hasElo() => _elo != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "teamWon" field.
  bool? _teamWon;
  bool get teamWon => _teamWon ?? false;
  bool hasTeamWon() => _teamWon != null;

  // "score" field.
  String? _score;
  String get score => _score ?? '';
  bool hasScore() => _score != null;

  // "gameName" field.
  String? _gameName;
  String get gameName => _gameName ?? '';
  bool hasGameName() => _gameName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _elo = castToType<int>(snapshotData['elo']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _teamWon = snapshotData['teamWon'] as bool?;
    _score = snapshotData['score'] as String?;
    _gameName = snapshotData['gameName'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('matchHistory')
          : FirebaseFirestore.instance.collectionGroup('matchHistory');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('matchHistory').doc(id);

  static Stream<MatchHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MatchHistoryRecord.fromSnapshot(s));

  static Future<MatchHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MatchHistoryRecord.fromSnapshot(s));

  static MatchHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MatchHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MatchHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MatchHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MatchHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MatchHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMatchHistoryRecordData({
  int? elo,
  DateTime? timestamp,
  bool? teamWon,
  String? score,
  String? gameName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'elo': elo,
      'timestamp': timestamp,
      'teamWon': teamWon,
      'score': score,
      'gameName': gameName,
    }.withoutNulls,
  );

  return firestoreData;
}

class MatchHistoryRecordDocumentEquality
    implements Equality<MatchHistoryRecord> {
  const MatchHistoryRecordDocumentEquality();

  @override
  bool equals(MatchHistoryRecord? e1, MatchHistoryRecord? e2) {
    return e1?.elo == e2?.elo &&
        e1?.timestamp == e2?.timestamp &&
        e1?.teamWon == e2?.teamWon &&
        e1?.score == e2?.score &&
        e1?.gameName == e2?.gameName;
  }

  @override
  int hash(MatchHistoryRecord? e) => const ListEquality()
      .hash([e?.elo, e?.timestamp, e?.teamWon, e?.score, e?.gameName]);

  @override
  bool isValidKey(Object? o) => o is MatchHistoryRecord;
}
