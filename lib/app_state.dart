import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _ongletCourant = 0;
  int get ongletCourant => _ongletCourant;
  set ongletCourant(int value) {
    _ongletCourant = value;
  }

  String _Arcane1 = '';
  String get Arcane1 => _Arcane1;
  set Arcane1(String value) {
    _Arcane1 = value;
  }

  String _Arcane2 = '';
  String get Arcane2 => _Arcane2;
  set Arcane2(String value) {
    _Arcane2 = value;
  }

  String _arcane3 = '';
  String get arcane3 => _arcane3;
  set arcane3(String value) {
    _arcane3 = value;
  }

  String _Arcane4 = '';
  String get Arcane4 => _Arcane4;
  set Arcane4(String value) {
    _Arcane4 = value;
  }

  int _currentQuestion = 1;
  int get currentQuestion => _currentQuestion;
  set currentQuestion(int value) {
    _currentQuestion = value;
  }

  List<String> _arcaneListState = [];
  List<String> get arcaneListState => _arcaneListState;
  set arcaneListState(List<String> value) {
    _arcaneListState = value;
  }

  void addToArcaneListState(String value) {
    arcaneListState.add(value);
  }

  void removeFromArcaneListState(String value) {
    arcaneListState.remove(value);
  }

  void removeAtIndexFromArcaneListState(int index) {
    arcaneListState.removeAt(index);
  }

  void updateArcaneListStateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    arcaneListState[index] = updateFn(_arcaneListState[index]);
  }

  void insertAtIndexInArcaneListState(int index, String value) {
    arcaneListState.insert(index, value);
  }

  List<String> _top4Arcane = [];
  List<String> get top4Arcane => _top4Arcane;
  set top4Arcane(List<String> value) {
    _top4Arcane = value;
  }

  void addToTop4Arcane(String value) {
    top4Arcane.add(value);
  }

  void removeFromTop4Arcane(String value) {
    top4Arcane.remove(value);
  }

  void removeAtIndexFromTop4Arcane(int index) {
    top4Arcane.removeAt(index);
  }

  void updateTop4ArcaneAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    top4Arcane[index] = updateFn(_top4Arcane[index]);
  }

  void insertAtIndexInTop4Arcane(int index, String value) {
    top4Arcane.insert(index, value);
  }

  String _language = '';
  String get language => _language;
  set language(String value) {
    _language = value;
  }

  String _date = '';
  String get date => _date;
  set date(String value) {
    _date = value;
  }
}
