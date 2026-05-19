import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Cette collection représente une conversation entre 2 utilisateurs.
class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Users" field.
  List<DocumentReference>? _users;

  /// les 2 utilisateurs de la conversation
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "userIds" field.
  List<String>? _userIds;

  /// les ids des 2 utilisateurs
  List<String> get userIds => _userIds ?? const [];
  bool hasUserIds() => _userIds != null;

  // "lastMessage" field.
  String? _lastMessage;

  /// dernier message
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "lastMessageTime" field.
  DateTime? _lastMessageTime;

  /// date du dernier message
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "lastMessageSender" field.
  DocumentReference? _lastMessageSender;

  /// qui a envoyé le dernier message
  DocumentReference? get lastMessageSender => _lastMessageSender;
  bool hasLastMessageSender() => _lastMessageSender != null;

  // "createdTime" field.
  DateTime? _createdTime;

  /// date de création du chat
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "isGroup" field.
  bool? _isGroup;

  /// false pour conversation privée
  bool get isGroup => _isGroup ?? false;
  bool hasIsGroup() => _isGroup != null;

  // "seenBy" field.
  List<String>? _seenBy;

  /// ids des utilisateurs qui ont vu le dernier message
  List<String> get seenBy => _seenBy ?? const [];
  bool hasSeenBy() => _seenBy != null;

  void _initializeFields() {
    _users = getDataList(snapshotData['Users']);
    _userIds = getDataList(snapshotData['userIds']);
    _lastMessage = snapshotData['lastMessage'] as String?;
    _lastMessageTime = snapshotData['lastMessageTime'] as DateTime?;
    _lastMessageSender =
        snapshotData['lastMessageSender'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _isGroup = snapshotData['isGroup'] as bool?;
    _seenBy = getDataList(snapshotData['seenBy']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? lastMessage,
  DateTime? lastMessageTime,
  DocumentReference? lastMessageSender,
  DateTime? createdTime,
  bool? isGroup,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime,
      'lastMessageSender': lastMessageSender,
      'createdTime': createdTime,
      'isGroup': isGroup,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.users, e2?.users) &&
        listEquality.equals(e1?.userIds, e2?.userIds) &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.lastMessageSender == e2?.lastMessageSender &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isGroup == e2?.isGroup &&
        listEquality.equals(e1?.seenBy, e2?.seenBy);
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.users,
        e?.userIds,
        e?.lastMessage,
        e?.lastMessageTime,
        e?.lastMessageSender,
        e?.createdTime,
        e?.isGroup,
        e?.seenBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
