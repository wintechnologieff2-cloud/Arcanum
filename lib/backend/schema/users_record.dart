import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "demandeUserList" field.
  List<DocumentReference>? _demandeUserList;
  List<DocumentReference> get demandeUserList => _demandeUserList ?? const [];
  bool hasDemandeUserList() => _demandeUserList != null;

  // "connexionList" field.
  List<DocumentReference>? _connexionList;
  List<DocumentReference> get connexionList => _connexionList ?? const [];
  bool hasConnexionList() => _connexionList != null;

  // "dateNaissance" field.
  DateTime? _dateNaissance;
  DateTime? get dateNaissance => _dateNaissance;
  bool hasDateNaissance() => _dateNaissance != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "ville" field.
  String? _ville;
  String get ville => _ville ?? '';
  bool hasVille() => _ville != null;

  // "typePersonalite" field.
  String? _typePersonalite;
  String get typePersonalite => _typePersonalite ?? '';
  bool hasTypePersonalite() => _typePersonalite != null;

  // "enneagramme" field.
  String? _enneagramme;
  String get enneagramme => _enneagramme ?? '';
  bool hasEnneagramme() => _enneagramme != null;

  // "pratiquesSpirituelles" field.
  List<String>? _pratiquesSpirituelles;
  List<String> get pratiquesSpirituelles => _pratiquesSpirituelles ?? const [];
  bool hasPratiquesSpirituelles() => _pratiquesSpirituelles != null;

  // "centreInteret" field.
  List<String>? _centreInteret;
  List<String> get centreInteret => _centreInteret ?? const [];
  bool hasCentreInteret() => _centreInteret != null;

  // "activitePrefere" field.
  String? _activitePrefere;
  String get activitePrefere => _activitePrefere ?? '';
  bool hasActivitePrefere() => _activitePrefere != null;

  // "styleCommunication" field.
  String? _styleCommunication;
  String get styleCommunication => _styleCommunication ?? '';
  bool hasStyleCommunication() => _styleCommunication != null;

  // "arcanePrimaire" field.
  String? _arcanePrimaire;
  String get arcanePrimaire => _arcanePrimaire ?? '';
  bool hasArcanePrimaire() => _arcanePrimaire != null;

  // "arcaneSecondaire" field.
  List<String>? _arcaneSecondaire;
  List<String> get arcaneSecondaire => _arcaneSecondaire ?? const [];
  bool hasArcaneSecondaire() => _arcaneSecondaire != null;

  // "adresse" field.
  String? _adresse;
  String get adresse => _adresse ?? '';
  bool hasAdresse() => _adresse != null;

  // "demandeAttenteList" field.
  List<DocumentReference>? _demandeAttenteList;
  List<DocumentReference> get demandeAttenteList =>
      _demandeAttenteList ?? const [];
  bool hasDemandeAttenteList() => _demandeAttenteList != null;

  // "reponses" field.
  List<String>? _reponses;
  List<String> get reponses => _reponses ?? const [];
  bool hasReponses() => _reponses != null;

  // "arcaneList" field.
  List<String>? _arcaneList;
  List<String> get arcaneList => _arcaneList ?? const [];
  bool hasArcaneList() => _arcaneList != null;

  // "Top1Arcane" field.
  String? _top1Arcane;
  String get top1Arcane => _top1Arcane ?? '';
  bool hasTop1Arcane() => _top1Arcane != null;

  // "Top4Arcane" field.
  List<String>? _top4Arcane;
  List<String> get top4Arcane => _top4Arcane ?? const [];
  bool hasTop4Arcane() => _top4Arcane != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "photoPathArcanum" field.
  String? _photoPathArcanum;
  String get photoPathArcanum => _photoPathArcanum ?? '';
  bool hasPhotoPathArcanum() => _photoPathArcanum != null;

  // "profilStage" field.
  int? _profilStage;
  int get profilStage => _profilStage ?? 0;
  bool hasProfilStage() => _profilStage != null;

  // "isOnline" field.
  bool? _isOnline;
  bool get isOnline => _isOnline ?? false;
  bool hasIsOnline() => _isOnline != null;

  // "typePersonalite_en" field.
  String? _typePersonaliteEn;
  String get typePersonaliteEn => _typePersonaliteEn ?? '';
  bool hasTypePersonaliteEn() => _typePersonaliteEn != null;

  // "enneagramme_en" field.
  String? _enneagrammeEn;
  String get enneagrammeEn => _enneagrammeEn ?? '';
  bool hasEnneagrammeEn() => _enneagrammeEn != null;

  // "styleCommunication_en" field.
  String? _styleCommunicationEn;
  String get styleCommunicationEn => _styleCommunicationEn ?? '';
  bool hasStyleCommunicationEn() => _styleCommunicationEn != null;

  // "pratiquesSpirituelles_en" field.
  List<String>? _pratiquesSpirituellesEn;
  List<String> get pratiquesSpirituellesEn =>
      _pratiquesSpirituellesEn ?? const [];
  bool hasPratiquesSpirituellesEn() => _pratiquesSpirituellesEn != null;

  // "centreInteret_en" field.
  List<String>? _centreInteretEn;
  List<String> get centreInteretEn => _centreInteretEn ?? const [];
  bool hasCentreInteretEn() => _centreInteretEn != null;

  // "blockedList" field.
  List<DocumentReference>? _blockedList;
  List<DocumentReference> get blockedList => _blockedList ?? const [];
  bool hasBlockedList() => _blockedList != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photos = getDataList(snapshotData['photos']);
    _demandeUserList = getDataList(snapshotData['demandeUserList']);
    _connexionList = getDataList(snapshotData['connexionList']);
    _dateNaissance = snapshotData['dateNaissance'] as DateTime?;
    _age = castToType<int>(snapshotData['age']);
    _bio = snapshotData['bio'] as String?;
    _ville = snapshotData['ville'] as String?;
    _typePersonalite = snapshotData['typePersonalite'] as String?;
    _enneagramme = snapshotData['enneagramme'] as String?;
    _pratiquesSpirituelles = getDataList(snapshotData['pratiquesSpirituelles']);
    _centreInteret = getDataList(snapshotData['centreInteret']);
    _activitePrefere = snapshotData['activitePrefere'] as String?;
    _styleCommunication = snapshotData['styleCommunication'] as String?;
    _arcanePrimaire = snapshotData['arcanePrimaire'] as String?;
    _arcaneSecondaire = getDataList(snapshotData['arcaneSecondaire']);
    _adresse = snapshotData['adresse'] as String?;
    _demandeAttenteList = getDataList(snapshotData['demandeAttenteList']);
    _reponses = getDataList(snapshotData['reponses']);
    _arcaneList = getDataList(snapshotData['arcaneList']);
    _top1Arcane = snapshotData['Top1Arcane'] as String?;
    _top4Arcane = getDataList(snapshotData['Top4Arcane']);
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _photoPathArcanum = snapshotData['photoPathArcanum'] as String?;
    _profilStage = castToType<int>(snapshotData['profilStage']);
    _isOnline = snapshotData['isOnline'] as bool?;
    _typePersonaliteEn = snapshotData['typePersonalite_en'] as String?;
    _enneagrammeEn = snapshotData['enneagramme_en'] as String?;
    _styleCommunicationEn = snapshotData['styleCommunication_en'] as String?;
    _pratiquesSpirituellesEn =
        getDataList(snapshotData['pratiquesSpirituelles_en']);
    _centreInteretEn = getDataList(snapshotData['centreInteret_en']);
    _blockedList = getDataList(snapshotData['blockedList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? dateNaissance,
  int? age,
  String? bio,
  String? ville,
  String? typePersonalite,
  String? enneagramme,
  String? activitePrefere,
  String? styleCommunication,
  String? arcanePrimaire,
  String? adresse,
  String? top1Arcane,
  bool? isCompleted,
  String? photoPathArcanum,
  int? profilStage,
  bool? isOnline,
  String? typePersonaliteEn,
  String? enneagrammeEn,
  String? styleCommunicationEn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'dateNaissance': dateNaissance,
      'age': age,
      'bio': bio,
      'ville': ville,
      'typePersonalite': typePersonalite,
      'enneagramme': enneagramme,
      'activitePrefere': activitePrefere,
      'styleCommunication': styleCommunication,
      'arcanePrimaire': arcanePrimaire,
      'adresse': adresse,
      'Top1Arcane': top1Arcane,
      'isCompleted': isCompleted,
      'photoPathArcanum': photoPathArcanum,
      'profilStage': profilStage,
      'isOnline': isOnline,
      'typePersonalite_en': typePersonaliteEn,
      'enneagramme_en': enneagrammeEn,
      'styleCommunication_en': styleCommunicationEn,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.photos, e2?.photos) &&
        listEquality.equals(e1?.demandeUserList, e2?.demandeUserList) &&
        listEquality.equals(e1?.connexionList, e2?.connexionList) &&
        e1?.dateNaissance == e2?.dateNaissance &&
        e1?.age == e2?.age &&
        e1?.bio == e2?.bio &&
        e1?.ville == e2?.ville &&
        e1?.typePersonalite == e2?.typePersonalite &&
        e1?.enneagramme == e2?.enneagramme &&
        listEquality.equals(
            e1?.pratiquesSpirituelles, e2?.pratiquesSpirituelles) &&
        listEquality.equals(e1?.centreInteret, e2?.centreInteret) &&
        e1?.activitePrefere == e2?.activitePrefere &&
        e1?.styleCommunication == e2?.styleCommunication &&
        e1?.arcanePrimaire == e2?.arcanePrimaire &&
        listEquality.equals(e1?.arcaneSecondaire, e2?.arcaneSecondaire) &&
        e1?.adresse == e2?.adresse &&
        listEquality.equals(e1?.demandeAttenteList, e2?.demandeAttenteList) &&
        listEquality.equals(e1?.reponses, e2?.reponses) &&
        listEquality.equals(e1?.arcaneList, e2?.arcaneList) &&
        e1?.top1Arcane == e2?.top1Arcane &&
        listEquality.equals(e1?.top4Arcane, e2?.top4Arcane) &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.photoPathArcanum == e2?.photoPathArcanum &&
        e1?.profilStage == e2?.profilStage &&
        e1?.isOnline == e2?.isOnline &&
        e1?.typePersonaliteEn == e2?.typePersonaliteEn &&
        e1?.enneagrammeEn == e2?.enneagrammeEn &&
        e1?.styleCommunicationEn == e2?.styleCommunicationEn &&
        listEquality.equals(
            e1?.pratiquesSpirituellesEn, e2?.pratiquesSpirituellesEn) &&
        listEquality.equals(e1?.centreInteretEn, e2?.centreInteretEn) &&
        listEquality.equals(e1?.blockedList, e2?.blockedList);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.photos,
        e?.demandeUserList,
        e?.connexionList,
        e?.dateNaissance,
        e?.age,
        e?.bio,
        e?.ville,
        e?.typePersonalite,
        e?.enneagramme,
        e?.pratiquesSpirituelles,
        e?.centreInteret,
        e?.activitePrefere,
        e?.styleCommunication,
        e?.arcanePrimaire,
        e?.arcaneSecondaire,
        e?.adresse,
        e?.demandeAttenteList,
        e?.reponses,
        e?.arcaneList,
        e?.top1Arcane,
        e?.top4Arcane,
        e?.isCompleted,
        e?.photoPathArcanum,
        e?.profilStage,
        e?.isOnline,
        e?.typePersonaliteEn,
        e?.enneagrammeEn,
        e?.styleCommunicationEn,
        e?.pratiquesSpirituellesEn,
        e?.centreInteretEn,
        e?.blockedList
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
