// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ArcaneStruct extends FFFirebaseStruct {
  ArcaneStruct({
    String? nom,
    String? slogan,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nom = nom,
        _slogan = slogan,
        _description = description,
        super(firestoreUtilData);

  // "Nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  set nom(String? val) => _nom = val;

  bool hasNom() => _nom != null;

  // "slogan" field.
  String? _slogan;
  String get slogan => _slogan ?? '';
  set slogan(String? val) => _slogan = val;

  bool hasSlogan() => _slogan != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static ArcaneStruct fromMap(Map<String, dynamic> data) => ArcaneStruct(
        nom: data['Nom'] as String?,
        slogan: data['slogan'] as String?,
        description: data['description'] as String?,
      );

  static ArcaneStruct? maybeFromMap(dynamic data) =>
      data is Map ? ArcaneStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Nom': _nom,
        'slogan': _slogan,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Nom': serializeParam(
          _nom,
          ParamType.String,
        ),
        'slogan': serializeParam(
          _slogan,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static ArcaneStruct fromSerializableMap(Map<String, dynamic> data) =>
      ArcaneStruct(
        nom: deserializeParam(
          data['Nom'],
          ParamType.String,
          false,
        ),
        slogan: deserializeParam(
          data['slogan'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ArcaneStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ArcaneStruct &&
        nom == other.nom &&
        slogan == other.slogan &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([nom, slogan, description]);
}

ArcaneStruct createArcaneStruct({
  String? nom,
  String? slogan,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ArcaneStruct(
      nom: nom,
      slogan: slogan,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ArcaneStruct? updateArcaneStruct(
  ArcaneStruct? arcane, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    arcane
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addArcaneStructData(
  Map<String, dynamic> firestoreData,
  ArcaneStruct? arcane,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (arcane == null) {
    return;
  }
  if (arcane.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && arcane.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final arcaneData = getArcaneFirestoreData(arcane, forFieldValue);
  final nestedData = arcaneData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = arcane.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getArcaneFirestoreData(
  ArcaneStruct? arcane, [
  bool forFieldValue = false,
]) {
  if (arcane == null) {
    return {};
  }
  final firestoreData = mapToFirestore(arcane.toMap());

  // Add any Firestore field values
  mapToFirestore(arcane.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getArcaneListFirestoreData(
  List<ArcaneStruct>? arcanes,
) =>
    arcanes?.map((e) => getArcaneFirestoreData(e, true)).toList() ?? [];
