import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArcaneRecord extends FirestoreRecord {
  ArcaneRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "qualites" field.
  String? _qualites;
  String get qualites => _qualites ?? '';
  bool hasQualites() => _qualites != null;

  // "nom_en" field.
  String? _nomEn;
  String get nomEn => _nomEn ?? '';
  bool hasNomEn() => _nomEn != null;

  // "description_en" field.
  String? _descriptionEn;
  String get descriptionEn => _descriptionEn ?? '';
  bool hasDescriptionEn() => _descriptionEn != null;

  // "qualites_en" field.
  String? _qualitesEn;
  String get qualitesEn => _qualitesEn ?? '';
  bool hasQualitesEn() => _qualitesEn != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
    _qualites = snapshotData['qualites'] as String?;
    _nomEn = snapshotData['nom_en'] as String?;
    _descriptionEn = snapshotData['description_en'] as String?;
    _qualitesEn = snapshotData['qualites_en'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Arcane');

  static Stream<ArcaneRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArcaneRecord.fromSnapshot(s));

  static Future<ArcaneRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArcaneRecord.fromSnapshot(s));

  static ArcaneRecord fromSnapshot(DocumentSnapshot snapshot) => ArcaneRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArcaneRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArcaneRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArcaneRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArcaneRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArcaneRecordData({
  String? nom,
  String? image,
  String? description,
  String? qualites,
  String? nomEn,
  String? descriptionEn,
  String? qualitesEn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'image': image,
      'description': description,
      'qualites': qualites,
      'nom_en': nomEn,
      'description_en': descriptionEn,
      'qualites_en': qualitesEn,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArcaneRecordDocumentEquality implements Equality<ArcaneRecord> {
  const ArcaneRecordDocumentEquality();

  @override
  bool equals(ArcaneRecord? e1, ArcaneRecord? e2) {
    return e1?.nom == e2?.nom &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description &&
        e1?.qualites == e2?.qualites &&
        e1?.nomEn == e2?.nomEn &&
        e1?.descriptionEn == e2?.descriptionEn &&
        e1?.qualitesEn == e2?.qualitesEn;
  }

  @override
  int hash(ArcaneRecord? e) => const ListEquality().hash([
        e?.nom,
        e?.image,
        e?.description,
        e?.qualites,
        e?.nomEn,
        e?.descriptionEn,
        e?.qualitesEn
      ]);

  @override
  bool isValidKey(Object? o) => o is ArcaneRecord;
}
