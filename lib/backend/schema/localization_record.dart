import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocalizationRecord extends FirestoreRecord {
  LocalizationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "photoPath" field.
  String? _photoPath;
  String get photoPath => _photoPath ?? '';
  bool hasPhotoPath() => _photoPath != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _photoPath = snapshotData['photoPath'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('localization');

  static Stream<LocalizationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocalizationRecord.fromSnapshot(s));

  static Future<LocalizationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocalizationRecord.fromSnapshot(s));

  static LocalizationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocalizationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocalizationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocalizationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocalizationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocalizationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocalizationRecordData({
  String? userId,
  DateTime? updatedAt,
  LatLng? location,
  DocumentReference? userRef,
  String? photoUrl,
  String? photoPath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'updatedAt': updatedAt,
      'location': location,
      'userRef': userRef,
      'photo_url': photoUrl,
      'photoPath': photoPath,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocalizationRecordDocumentEquality
    implements Equality<LocalizationRecord> {
  const LocalizationRecordDocumentEquality();

  @override
  bool equals(LocalizationRecord? e1, LocalizationRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.location == e2?.location &&
        e1?.userRef == e2?.userRef &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.photoPath == e2?.photoPath;
  }

  @override
  int hash(LocalizationRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.updatedAt,
        e?.location,
        e?.userRef,
        e?.photoUrl,
        e?.photoPath
      ]);

  @override
  bool isValidKey(Object? o) => o is LocalizationRecord;
}
