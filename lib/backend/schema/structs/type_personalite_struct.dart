// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TypePersonaliteStruct extends FFFirebaseStruct {
  TypePersonaliteStruct({
    String? code,
    String? nameEn,
    String? nameFr,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _code = code,
        _nameEn = nameEn,
        _nameFr = nameFr,
        super(firestoreUtilData);

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "name_en" field.
  String? _nameEn;
  String get nameEn => _nameEn ?? '';
  set nameEn(String? val) => _nameEn = val;

  bool hasNameEn() => _nameEn != null;

  // "name_fr" field.
  String? _nameFr;
  String get nameFr => _nameFr ?? '';
  set nameFr(String? val) => _nameFr = val;

  bool hasNameFr() => _nameFr != null;

  static TypePersonaliteStruct fromMap(Map<String, dynamic> data) =>
      TypePersonaliteStruct(
        code: data['code'] as String?,
        nameEn: data['name_en'] as String?,
        nameFr: data['name_fr'] as String?,
      );

  static TypePersonaliteStruct? maybeFromMap(dynamic data) => data is Map
      ? TypePersonaliteStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'name_en': _nameEn,
        'name_fr': _nameFr,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'name_en': serializeParam(
          _nameEn,
          ParamType.String,
        ),
        'name_fr': serializeParam(
          _nameFr,
          ParamType.String,
        ),
      }.withoutNulls;

  static TypePersonaliteStruct fromSerializableMap(Map<String, dynamic> data) =>
      TypePersonaliteStruct(
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        nameEn: deserializeParam(
          data['name_en'],
          ParamType.String,
          false,
        ),
        nameFr: deserializeParam(
          data['name_fr'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TypePersonaliteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TypePersonaliteStruct &&
        code == other.code &&
        nameEn == other.nameEn &&
        nameFr == other.nameFr;
  }

  @override
  int get hashCode => const ListEquality().hash([code, nameEn, nameFr]);
}

TypePersonaliteStruct createTypePersonaliteStruct({
  String? code,
  String? nameEn,
  String? nameFr,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TypePersonaliteStruct(
      code: code,
      nameEn: nameEn,
      nameFr: nameFr,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TypePersonaliteStruct? updateTypePersonaliteStruct(
  TypePersonaliteStruct? typePersonalite, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    typePersonalite
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTypePersonaliteStructData(
  Map<String, dynamic> firestoreData,
  TypePersonaliteStruct? typePersonalite,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (typePersonalite == null) {
    return;
  }
  if (typePersonalite.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && typePersonalite.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final typePersonaliteData =
      getTypePersonaliteFirestoreData(typePersonalite, forFieldValue);
  final nestedData =
      typePersonaliteData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = typePersonalite.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTypePersonaliteFirestoreData(
  TypePersonaliteStruct? typePersonalite, [
  bool forFieldValue = false,
]) {
  if (typePersonalite == null) {
    return {};
  }
  final firestoreData = mapToFirestore(typePersonalite.toMap());

  // Add any Firestore field values
  mapToFirestore(typePersonalite.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTypePersonaliteListFirestoreData(
  List<TypePersonaliteStruct>? typePersonalites,
) =>
    typePersonalites
        ?.map((e) => getTypePersonaliteFirestoreData(e, true))
        .toList() ??
    [];
