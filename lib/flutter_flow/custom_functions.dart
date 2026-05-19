import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

int calculateAge(DateTime birthDate) {
  final now = DateTime.now();

  int age = now.year - birthDate.year;

  if (now.month < birthDate.month ||
      (now.month == birthDate.month && now.day < birthDate.day)) {
    age--;
  }

  return age;
}

List<DocumentReference>? listUsers(
  DocumentReference user1,
  DocumentReference user2,
) {
  return [user1, user2];
}

List<DocumentReference> generateListOfUsers(
  DocumentReference authUser,
  DocumentReference otherUser,
) {
  return [authUser, otherUser];
}

List<String> generateListOfNames(
  String authUser,
  String otherUser,
) {
  return [authUser, otherUser];
}

DocumentReference getOtherUserRef(
  List<DocumentReference> listOfUserRefs,
  DocumentReference authUserRef,
) {
  return authUserRef == listOfUserRefs.first
      ? listOfUserRefs.last
      : listOfUserRefs.first;
}

String getOtherUserName(
  List<String> listOfUserRefs,
  String authUserRef,
) {
  return authUserRef == listOfUserRefs.first
      ? listOfUserRefs.last
      : listOfUserRefs.first;
}

List<String> getTopTarotResults(List<String> answers) {
  final Map<String, int> frequency = {};

  // Count occurrences
  for (final answer in answers) {
    if (answer == null || answer.isEmpty) continue;
    frequency[answer] = (frequency[answer] ?? 0) + 1;
  }

  // Sort by frequency (descending)
  final sortedEntries = frequency.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  // Take top 3
  final top3 = sortedEntries.take(3).map((e) => e.key).toList();

  return top3;
}

List<String> getTopFour(List<String> arcaneList) {
  final Map<String, int> counts = {};

  // Count occurrences
  for (final arcane in arcaneList) {
    counts[arcane] = (counts[arcane] ?? 0) + 1;
  }

  // Sort by frequency (descending)
  final sorted = counts.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  // Take top 4 and return only the strings
  return sorted.take(4).map((e) => e.key).toList();
}

double calculateMatchPercentage(
  List<String> list1,
  List<String> list2,
) {
  if (list1.isEmpty || list2.isEmpty) return 0.0;

  int matchCount = 0;

  // Copy list2 to avoid modifying original
  List<String> tempList2 = List.from(list2);

  for (String item in list1) {
    if (tempList2.contains(item)) {
      matchCount++;
      tempList2.remove(item); // prevents double counting
    }
  }

  // You can choose the denominator:
  int total = list1.length; // or min(list1.length, list2.length)

  return (matchCount / total) * 100;
}

double calculateCompatibility(
  List<String> spiritual1,
  List<String> spiritual2,
  List<String> interest1,
  List<String> interest2,
  List<String> arcane1,
  List<String> arcane2,
) {
  double listMatch(List a, List b) {
    final setA = a.toSet();
    final setB = b.toSet();

    final intersection = setA.intersection(setB).length;
    final union = setA.union(setB).length;

    if (union == 0) return 0;

    return (intersection / union) * 10;
  }

  double spiritualScore = listMatch(spiritual1, spiritual2);
  double interestScore = listMatch(interest1, interest2);
  double arcaneScore = listMatch(arcane1, arcane2);

  double finalScore =
      (spiritualScore * 0.35) + (interestScore * 0.30) + (arcaneScore * 0.35);

  return (finalScore / 10) * 100;
}

String imagePathToUrl(String? imagePath) {
  // 1. Null / empty guard — use ?.trim() because imagePath is nullable
  final String path = imagePath?.trim() ?? '';
  if (path.isEmpty) return '';

  // 2. Already a valid HTTPS / HTTP URL — return as-is
  if (path.startsWith('https://') || path.startsWith('http://')) {
    return path;
  }

  // 3. Firebase Storage gs:// URI → convert to HTTPS download URL
  if (path.startsWith('gs://')) {
    final String withoutScheme = path.replaceFirst('gs://', '');
    final int slashIndex = withoutScheme.indexOf('/');
    if (slashIndex == -1) return '';

    final String bucket = withoutScheme.substring(0, slashIndex);
    final String objectPath = withoutScheme.substring(slashIndex + 1);
    final String encodedPath = Uri.encodeComponent(objectPath);

    return 'https://firebasestorage.googleapis.com/v0/b/$bucket/o/$encodedPath?alt=media';
  }

  // 4. Unrecognised format — return empty so the marker is skipped
  return '';
}

bool onlineCheck(DateTime activeTime) {
// If time of activeTime is below 5 minutes return true
  final now = DateTime.now();
  final difference = now.difference(activeTime);
  return difference.inMinutes < 5;
}

List<String> splitFrEn(String input) {
  if (input.isEmpty) return [];

  // Split using "~"
  final parts = input.split('~');

  // Trim spaces and return
  return parts.map((e) => e.trim()).toList();
}

List<String> getFrenchList(List<String> input) {
  List<String> french = [];

  for (String item in input) {
    if (item.contains('~')) {
      french.add(item.split('~')[0].trim());
    } else {
      french.add(item.trim());
    }
  }

  return french;
}

List<String> getEnglishList(List<String> input) {
  List<String> english = [];

  for (String item in input) {
    if (item.contains('~')) {
      english.add(item.split('~')[1].trim());
    } else {
      english.add(item.trim());
    }
  }

  return english;
}

List<String> get4mostFrequent(List<String> inputList) {
  if (inputList.isEmpty) return [];

  // Count occurrences
  final Map<String, int> frequencyMap = {};

  for (var item in inputList) {
    if (item == null) continue;
    frequencyMap[item] = (frequencyMap[item] ?? 0) + 1;
  }

  // Convert map to list of entries
  final sortedEntries = frequencyMap.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value)); // descending order

  // Take top 4
  final top4 = sortedEntries.take(4).map((e) => e.key).toList();

  return top4;
}

double calculateSecondPercantage(
  List<String>? list,
  String? target,
) {
  if (list == null || list.isEmpty || target == null || target.isEmpty) {
    return 0.0;
  }

  // Step 1: keep all occurrences of target
  List<String> targetOnly = list.where((item) => item == target).toList();

  // Step 2: remove duplicates for everything else
  List<String> othersUnique =
      list.where((item) => item != target).toSet().toList();

  // Step 3: rebuild final list
  List<String> cleaned = [...targetOnly, ...othersUnique];

  // Step 4: compute percentage of target
  int matchCount = targetOnly.length;

  if (cleaned.isEmpty) return 0.0;

  return (matchCount / cleaned.length) * 100;
}
