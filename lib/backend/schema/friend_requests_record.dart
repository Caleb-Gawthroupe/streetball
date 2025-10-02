import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FriendRequestsRecord extends FirestoreRecord {
  FriendRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fromUid" field.
  String? _fromUid;
  String get fromUid => _fromUid ?? '';
  bool hasFromUid() => _fromUid != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "fromName" field.
  String? _fromName;
  String get fromName => _fromName ?? '';
  bool hasFromName() => _fromName != null;

  // "fromUser" field.
  DocumentReference? _fromUser;
  DocumentReference? get fromUser => _fromUser;
  bool hasFromUser() => _fromUser != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fromUid = snapshotData['fromUid'] as String?;
    _status = snapshotData['status'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _fromName = snapshotData['fromName'] as String?;
    _fromUser = snapshotData['fromUser'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('friendRequests')
          : FirebaseFirestore.instance.collectionGroup('friendRequests');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('friendRequests').doc(id);

  static Stream<FriendRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendRequestsRecord.fromSnapshot(s));

  static Future<FriendRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendRequestsRecord.fromSnapshot(s));

  static FriendRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendRequestsRecordData({
  String? fromUid,
  String? status,
  DateTime? timestamp,
  String? fromName,
  DocumentReference? fromUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fromUid': fromUid,
      'status': status,
      'timestamp': timestamp,
      'fromName': fromName,
      'fromUser': fromUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendRequestsRecordDocumentEquality
    implements Equality<FriendRequestsRecord> {
  const FriendRequestsRecordDocumentEquality();

  @override
  bool equals(FriendRequestsRecord? e1, FriendRequestsRecord? e2) {
    return e1?.fromUid == e2?.fromUid &&
        e1?.status == e2?.status &&
        e1?.timestamp == e2?.timestamp &&
        e1?.fromName == e2?.fromName &&
        e1?.fromUser == e2?.fromUser;
  }

  @override
  int hash(FriendRequestsRecord? e) => const ListEquality()
      .hash([e?.fromUid, e?.status, e?.timestamp, e?.fromName, e?.fromUser]);

  @override
  bool isValidKey(Object? o) => o is FriendRequestsRecord;
}
