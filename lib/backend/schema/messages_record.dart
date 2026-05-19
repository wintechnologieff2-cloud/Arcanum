import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "utlisateur" field.
  DocumentReference? _utlisateur;
  DocumentReference? get utlisateur => _utlisateur;
  bool hasUtlisateur() => _utlisateur != null;

  // "messageText" field.
  String? _messageText;
  String get messageText => _messageText ?? '';
  bool hasMessageText() => _messageText != null;

  // "heureEnvoie" field.
  DateTime? _heureEnvoie;
  DateTime? get heureEnvoie => _heureEnvoie;
  bool hasHeureEnvoie() => _heureEnvoie != null;

  // "conversationRef" field.
  DocumentReference? _conversationRef;
  DocumentReference? get conversationRef => _conversationRef;
  bool hasConversationRef() => _conversationRef != null;

  void _initializeFields() {
    _utlisateur = snapshotData['utlisateur'] as DocumentReference?;
    _messageText = snapshotData['messageText'] as String?;
    _heureEnvoie = snapshotData['heureEnvoie'] as DateTime?;
    _conversationRef = snapshotData['conversationRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DocumentReference? utlisateur,
  String? messageText,
  DateTime? heureEnvoie,
  DocumentReference? conversationRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'utlisateur': utlisateur,
      'messageText': messageText,
      'heureEnvoie': heureEnvoie,
      'conversationRef': conversationRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.utlisateur == e2?.utlisateur &&
        e1?.messageText == e2?.messageText &&
        e1?.heureEnvoie == e2?.heureEnvoie &&
        e1?.conversationRef == e2?.conversationRef;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash(
      [e?.utlisateur, e?.messageText, e?.heureEnvoie, e?.conversationRef]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
