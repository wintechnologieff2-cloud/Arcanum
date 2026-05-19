import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationRecord extends FirestoreRecord {
  ConversationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "listUtilisateurs" field.
  List<DocumentReference>? _listUtilisateurs;
  List<DocumentReference> get listUtilisateurs => _listUtilisateurs ?? const [];
  bool hasListUtilisateurs() => _listUtilisateurs != null;

  // "heureCreation" field.
  DateTime? _heureCreation;
  DateTime? get heureCreation => _heureCreation;
  bool hasHeureCreation() => _heureCreation != null;

  // "dernierUtilisateur" field.
  DocumentReference? _dernierUtilisateur;
  DocumentReference? get dernierUtilisateur => _dernierUtilisateur;
  bool hasDernierUtilisateur() => _dernierUtilisateur != null;

  // "dernierMessage" field.
  String? _dernierMessage;
  String get dernierMessage => _dernierMessage ?? '';
  bool hasDernierMessage() => _dernierMessage != null;

  // "luPar" field.
  List<DocumentReference>? _luPar;
  List<DocumentReference> get luPar => _luPar ?? const [];
  bool hasLuPar() => _luPar != null;

  // "heureDernierMessage" field.
  DateTime? _heureDernierMessage;
  DateTime? get heureDernierMessage => _heureDernierMessage;
  bool hasHeureDernierMessage() => _heureDernierMessage != null;

  // "LastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "otherUser" field.
  DocumentReference? _otherUser;
  DocumentReference? get otherUser => _otherUser;
  bool hasOtherUser() => _otherUser != null;

  void _initializeFields() {
    _listUtilisateurs = getDataList(snapshotData['listUtilisateurs']);
    _heureCreation = snapshotData['heureCreation'] as DateTime?;
    _dernierUtilisateur =
        snapshotData['dernierUtilisateur'] as DocumentReference?;
    _dernierMessage = snapshotData['dernierMessage'] as String?;
    _luPar = getDataList(snapshotData['luPar']);
    _heureDernierMessage = snapshotData['heureDernierMessage'] as DateTime?;
    _lastMessage = snapshotData['LastMessage'] as String?;
    _otherUser = snapshotData['otherUser'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Conversation');

  static Stream<ConversationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConversationRecord.fromSnapshot(s));

  static Future<ConversationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConversationRecord.fromSnapshot(s));

  static ConversationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConversationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConversationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConversationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConversationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConversationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConversationRecordData({
  DateTime? heureCreation,
  DocumentReference? dernierUtilisateur,
  String? dernierMessage,
  DateTime? heureDernierMessage,
  String? lastMessage,
  DocumentReference? otherUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'heureCreation': heureCreation,
      'dernierUtilisateur': dernierUtilisateur,
      'dernierMessage': dernierMessage,
      'heureDernierMessage': heureDernierMessage,
      'LastMessage': lastMessage,
      'otherUser': otherUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConversationRecordDocumentEquality
    implements Equality<ConversationRecord> {
  const ConversationRecordDocumentEquality();

  @override
  bool equals(ConversationRecord? e1, ConversationRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.listUtilisateurs, e2?.listUtilisateurs) &&
        e1?.heureCreation == e2?.heureCreation &&
        e1?.dernierUtilisateur == e2?.dernierUtilisateur &&
        e1?.dernierMessage == e2?.dernierMessage &&
        listEquality.equals(e1?.luPar, e2?.luPar) &&
        e1?.heureDernierMessage == e2?.heureDernierMessage &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.otherUser == e2?.otherUser;
  }

  @override
  int hash(ConversationRecord? e) => const ListEquality().hash([
        e?.listUtilisateurs,
        e?.heureCreation,
        e?.dernierUtilisateur,
        e?.dernierMessage,
        e?.luPar,
        e?.heureDernierMessage,
        e?.lastMessage,
        e?.otherUser
      ]);

  @override
  bool isValidKey(Object? o) => o is ConversationRecord;
}
