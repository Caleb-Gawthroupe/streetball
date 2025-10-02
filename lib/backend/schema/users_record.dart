import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "rank" field.
  int? _rank;
  int get rank => _rank ?? 0;
  bool hasRank() => _rank != null;

  // "rep" field.
  int? _rep;
  int get rep => _rep ?? 0;
  bool hasRep() => _rep != null;

  // "isReady" field.
  bool? _isReady;
  bool get isReady => _isReady ?? false;
  bool hasIsReady() => _isReady != null;

  // "vote" field.
  String? _vote;
  String get vote => _vote ?? '';
  bool hasVote() => _vote != null;

  // "hasDownloadedNewRank" field.
  bool? _hasDownloadedNewRank;
  bool get hasDownloadedNewRank => _hasDownloadedNewRank ?? false;
  bool hasHasDownloadedNewRank() => _hasDownloadedNewRank != null;

  // "team" field.
  int? _team;
  int get team => _team ?? 0;
  bool hasTeam() => _team != null;

  // "currentGameID" field.
  String? _currentGameID;
  String get currentGameID => _currentGameID ?? '';
  bool hasCurrentGameID() => _currentGameID != null;

  // "friends" field.
  List<String>? _friends;
  List<String> get friends => _friends ?? const [];
  bool hasFriends() => _friends != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _rank = castToType<int>(snapshotData['rank']);
    _rep = castToType<int>(snapshotData['rep']);
    _isReady = snapshotData['isReady'] as bool?;
    _vote = snapshotData['vote'] as String?;
    _hasDownloadedNewRank = snapshotData['hasDownloadedNewRank'] as bool?;
    _team = castToType<int>(snapshotData['team']);
    _currentGameID = snapshotData['currentGameID'] as String?;
    _friends = getDataList(snapshotData['friends']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? lastActiveTime,
  int? rank,
  int? rep,
  bool? isReady,
  String? vote,
  bool? hasDownloadedNewRank,
  int? team,
  String? currentGameID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'last_active_time': lastActiveTime,
      'rank': rank,
      'rep': rep,
      'isReady': isReady,
      'vote': vote,
      'hasDownloadedNewRank': hasDownloadedNewRank,
      'team': team,
      'currentGameID': currentGameID,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.rank == e2?.rank &&
        e1?.rep == e2?.rep &&
        e1?.isReady == e2?.isReady &&
        e1?.vote == e2?.vote &&
        e1?.hasDownloadedNewRank == e2?.hasDownloadedNewRank &&
        e1?.team == e2?.team &&
        e1?.currentGameID == e2?.currentGameID &&
        listEquality.equals(e1?.friends, e2?.friends);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.lastActiveTime,
        e?.rank,
        e?.rep,
        e?.isReady,
        e?.vote,
        e?.hasDownloadedNewRank,
        e?.team,
        e?.currentGameID,
        e?.friends
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
