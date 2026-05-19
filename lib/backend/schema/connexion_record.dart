import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConnexionRecord extends FirestoreRecord {
  ConnexionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user1" field.
  DocumentReference? _user1;
  DocumentReference? get user1 => _user1;
  bool hasUser1() => _user1 != null;

  // "user2" field.
  DocumentReference? _user2;
  DocumentReference? get user2 => _user2;
  bool hasUser2() => _user2 != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "users_list" field.
  List<DocumentReference>? _usersList;
  List<DocumentReference> get usersList => _usersList ?? const [];
  bool hasUsersList() => _usersList != null;

  void _initializeFields() {
    _user1 = snapshotData['user1'] as DocumentReference?;
    _user2 = snapshotData['user2'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _usersList = getDataList(snapshotData['users_list']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('connexion');

  static Stream<ConnexionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConnexionRecord.fromSnapshot(s));

  static Future<ConnexionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConnexionRecord.fromSnapshot(s));

  static ConnexionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConnexionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConnexionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConnexionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConnexionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConnexionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConnexionRecordData({
  DocumentReference? user1,
  DocumentReference? user2,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user1': user1,
      'user2': user2,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConnexionRecordDocumentEquality implements Equality<ConnexionRecord> {
  const ConnexionRecordDocumentEquality();

  @override
  bool equals(ConnexionRecord? e1, ConnexionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user1 == e2?.user1 &&
        e1?.user2 == e2?.user2 &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.usersList, e2?.usersList);
  }

  @override
  int hash(ConnexionRecord? e) => const ListEquality()
      .hash([e?.user1, e?.user2, e?.createdAt, e?.usersList]);

  @override
  bool isValidKey(Object? o) => o is ConnexionRecord;
}
