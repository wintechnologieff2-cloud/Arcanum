import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArcaneQuotidienRecord extends FirestoreRecord {
  ArcaneQuotidienRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "arcane" field.
  String? _arcane;
  String get arcane => _arcane ?? '';
  bool hasArcane() => _arcane != null;

  // "slogan" field.
  String? _slogan;
  String get slogan => _slogan ?? '';
  bool hasSlogan() => _slogan != null;

  // "explication" field.
  String? _explication;
  String get explication => _explication ?? '';
  bool hasExplication() => _explication != null;

  // "conseil1" field.
  String? _conseil1;
  String get conseil1 => _conseil1 ?? '';
  bool hasConseil1() => _conseil1 != null;

  // "conseil2" field.
  String? _conseil2;
  String get conseil2 => _conseil2 ?? '';
  bool hasConseil2() => _conseil2 != null;

  // "conseil3" field.
  String? _conseil3;
  String get conseil3 => _conseil3 ?? '';
  bool hasConseil3() => _conseil3 != null;

  // "conseil4" field.
  String? _conseil4;
  String get conseil4 => _conseil4 ?? '';
  bool hasConseil4() => _conseil4 != null;

  // "dateString" field.
  String? _dateString;
  String get dateString => _dateString ?? '';
  bool hasDateString() => _dateString != null;

  // "arcane_en" field.
  String? _arcaneEn;
  String get arcaneEn => _arcaneEn ?? '';
  bool hasArcaneEn() => _arcaneEn != null;

  // "slogan_en" field.
  String? _sloganEn;
  String get sloganEn => _sloganEn ?? '';
  bool hasSloganEn() => _sloganEn != null;

  // "explication_en" field.
  String? _explicationEn;
  String get explicationEn => _explicationEn ?? '';
  bool hasExplicationEn() => _explicationEn != null;

  // "conseil1_en" field.
  String? _conseil1En;
  String get conseil1En => _conseil1En ?? '';
  bool hasConseil1En() => _conseil1En != null;

  // "conseil2_en" field.
  String? _conseil2En;
  String get conseil2En => _conseil2En ?? '';
  bool hasConseil2En() => _conseil2En != null;

  // "conseil3_en" field.
  String? _conseil3En;
  String get conseil3En => _conseil3En ?? '';
  bool hasConseil3En() => _conseil3En != null;

  // "conseil4_en" field.
  String? _conseil4En;
  String get conseil4En => _conseil4En ?? '';
  bool hasConseil4En() => _conseil4En != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _arcane = snapshotData['arcane'] as String?;
    _slogan = snapshotData['slogan'] as String?;
    _explication = snapshotData['explication'] as String?;
    _conseil1 = snapshotData['conseil1'] as String?;
    _conseil2 = snapshotData['conseil2'] as String?;
    _conseil3 = snapshotData['conseil3'] as String?;
    _conseil4 = snapshotData['conseil4'] as String?;
    _dateString = snapshotData['dateString'] as String?;
    _arcaneEn = snapshotData['arcane_en'] as String?;
    _sloganEn = snapshotData['slogan_en'] as String?;
    _explicationEn = snapshotData['explication_en'] as String?;
    _conseil1En = snapshotData['conseil1_en'] as String?;
    _conseil2En = snapshotData['conseil2_en'] as String?;
    _conseil3En = snapshotData['conseil3_en'] as String?;
    _conseil4En = snapshotData['conseil4_en'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('arcaneQuotidien');

  static Stream<ArcaneQuotidienRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArcaneQuotidienRecord.fromSnapshot(s));

  static Future<ArcaneQuotidienRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArcaneQuotidienRecord.fromSnapshot(s));

  static ArcaneQuotidienRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArcaneQuotidienRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArcaneQuotidienRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArcaneQuotidienRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArcaneQuotidienRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArcaneQuotidienRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArcaneQuotidienRecordData({
  DateTime? date,
  String? arcane,
  String? slogan,
  String? explication,
  String? conseil1,
  String? conseil2,
  String? conseil3,
  String? conseil4,
  String? dateString,
  String? arcaneEn,
  String? sloganEn,
  String? explicationEn,
  String? conseil1En,
  String? conseil2En,
  String? conseil3En,
  String? conseil4En,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'arcane': arcane,
      'slogan': slogan,
      'explication': explication,
      'conseil1': conseil1,
      'conseil2': conseil2,
      'conseil3': conseil3,
      'conseil4': conseil4,
      'dateString': dateString,
      'arcane_en': arcaneEn,
      'slogan_en': sloganEn,
      'explication_en': explicationEn,
      'conseil1_en': conseil1En,
      'conseil2_en': conseil2En,
      'conseil3_en': conseil3En,
      'conseil4_en': conseil4En,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArcaneQuotidienRecordDocumentEquality
    implements Equality<ArcaneQuotidienRecord> {
  const ArcaneQuotidienRecordDocumentEquality();

  @override
  bool equals(ArcaneQuotidienRecord? e1, ArcaneQuotidienRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.arcane == e2?.arcane &&
        e1?.slogan == e2?.slogan &&
        e1?.explication == e2?.explication &&
        e1?.conseil1 == e2?.conseil1 &&
        e1?.conseil2 == e2?.conseil2 &&
        e1?.conseil3 == e2?.conseil3 &&
        e1?.conseil4 == e2?.conseil4 &&
        e1?.dateString == e2?.dateString &&
        e1?.arcaneEn == e2?.arcaneEn &&
        e1?.sloganEn == e2?.sloganEn &&
        e1?.explicationEn == e2?.explicationEn &&
        e1?.conseil1En == e2?.conseil1En &&
        e1?.conseil2En == e2?.conseil2En &&
        e1?.conseil3En == e2?.conseil3En &&
        e1?.conseil4En == e2?.conseil4En;
  }

  @override
  int hash(ArcaneQuotidienRecord? e) => const ListEquality().hash([
        e?.date,
        e?.arcane,
        e?.slogan,
        e?.explication,
        e?.conseil1,
        e?.conseil2,
        e?.conseil3,
        e?.conseil4,
        e?.dateString,
        e?.arcaneEn,
        e?.sloganEn,
        e?.explicationEn,
        e?.conseil1En,
        e?.conseil2En,
        e?.conseil3En,
        e?.conseil4En
      ]);

  @override
  bool isValidKey(Object? o) => o is ArcaneQuotidienRecord;
}
