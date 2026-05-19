// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class SpiritualChipsChoiceProfil extends StatefulWidget {
  final double width;
  final double height;

  static const List<String> _practices = [
    "Méditation quotidienne ~ Daily meditation",
    "Prière / Mantras ~ Prayer / Mantras",
    "Yoga (Hatha, Vinyasa, Kundalini) ~ Yoga (Hatha, Vinyasa, Kundalini)",
    "Astrologie ~ Astrology",
    "Journaling / Écriture intuitive ~ Journaling / Intuitive writing",
    "Visualisation ~ Visualization",
    "Reiki / Soins énergétiques ~ Reiki / Energy healing",
    "Lecture de tarot ~ Tarot reading",
    "Cérémonies rituelles ~ Ritual ceremonies",
    "Gratitude quotidienne ~ Daily gratitude",
    "Pleine conscience (Mindfulness) ~ Mindfulness",
    "Connexion à la nature ~ Connection with nature",
    "Chant / Musique sacrée ~ Chanting / Sacred music",
    "Marche en conscience ~ Mindful walking",
  ];

  const SpiritualChipsChoiceProfil({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<SpiritualChipsChoiceProfil> createState() =>
      _SpiritualPracticesChipsState();
}

class _SpiritualPracticesChipsState extends State<SpiritualChipsChoiceProfil> {
  final Set<int> _selectedIndices = {};
  bool _isSaving = false;
  bool _isLoading = true;

  TextStyle _spectral({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = const Color(0xFF7E8491),
    double height = 1.4,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.spectral(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      fontStyle: fontStyle,
    );
  }

  List<String> _frList() => SpiritualChipsChoiceProfil._practices
      .map((e) => e.split('~')[0].trim())
      .toList();

  List<String> _enList() => SpiritualChipsChoiceProfil._practices
      .map((e) => e.split('~')[1].trim())
      .toList();

  @override
  void initState() {
    super.initState();
    _loadUserPractices();
  }

  Future<void> _loadUserPractices() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        setState(() => _isLoading = false);
        return;
      }

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!doc.exists) {
        setState(() => _isLoading = false);
        return;
      }

      final data = doc.data();
      if (data == null) {
        setState(() => _isLoading = false);
        return;
      }

      final List<dynamic> savedFR = data['pratiquesSpirituelles'] ?? [];

      final frList = _frList();

      final Set<int> loadedIndices = {};

      for (int i = 0; i < frList.length; i++) {
        if (savedFR.contains(frList[i])) {
          loadedIndices.add(i);
        }
      }

      setState(() {
        _selectedIndices.clear();
        _selectedIndices.addAll(loadedIndices);
        _isLoading = false;
      });
    } catch (e) {
      print("Error loading practices: $e");
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveToUser() async {
    if (_isSaving) return;
    _isSaving = true;

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final frList = _frList();
      final enList = _enList();

      final selectedFR = _selectedIndices.map((i) => frList[i]).toList();
      final selectedEN = _selectedIndices.map((i) => enList[i]).toList();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'pratiquesSpirituelles': selectedFR,
        'pratiquesSpirituelles_en': selectedEN,
      });
    } finally {
      _isSaving = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFrench =
        Localizations.localeOf(context).languageCode.startsWith('fr');

    final frList = _frList();
    final enList = _enList();

    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SizedBox(
      width: widget.width,
      child: Wrap(
        spacing: 5,
        runSpacing: 2,
        children: List.generate(
          SpiritualChipsChoiceProfil._practices.length,
          (index) {
            final label = isFrench ? frList[index] : enList[index];
            final isSelected = _selectedIndices.contains(index);

            return ChoiceChip(
              label: Text(
                label,
                style: _spectral(
                  color: isSelected ? Colors.white : const Color(0xFF7E8491),
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              selected: isSelected,
              selectedColor: const Color(0xFFE4BAFF),
              backgroundColor: const Color(0xFFFFFFFF),
              disabledColor: Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? const Color(0xFFAA95D6)
                      : const Color(0xFFCCCCCC),
                  width: 1,
                ),
              ),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedIndices.add(index);
                  } else {
                    _selectedIndices.remove(index);
                  }
                });
                _saveToUser();
              },
            );
          },
        ),
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
