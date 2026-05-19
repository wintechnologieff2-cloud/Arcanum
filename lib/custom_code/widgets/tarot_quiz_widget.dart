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

import '/custom_code/widgets/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TarotQuizWidget extends StatefulWidget {
  const TarotQuizWidget({
    super.key,
    this.width,
    this.height,
    this.primaryColor,
    this.backgroundColor,
  });

  final double? width;
  final double? height;
  final Color? primaryColor;
  final Color? backgroundColor;

  @override
  State<TarotQuizWidget> createState() => _TarotQuizWidgetState();
}

class _TarotQuizWidgetState extends State<TarotQuizWidget> {
  // ─── Data (French) ────────────────────────────────────────────────────────

  static const List<Map<String, dynamic>> _questionsFr = [
    {
      'question':
          'Quelles qualités appréciez-vous le plus chez une autre personne ?',
      'options': [
        {'label': 'La loyauté', 'card': 'La Justice'},
        {'label': "L'enthousiasme", 'card': 'Le Soleil'},
        {'label': 'La sagesse', 'card': 'Le Pape'},
        {'label': "L'humour", 'card': 'La Force'},
        {'label': "L'empathie", 'card': "L'Étoile"},
      ],
    },
    {
      'question': 'Préférez-vous passer du temps seul ou en groupe ?',
      'options': [
        {'label': 'Seul', 'card': "L'Hermite"},
        {'label': 'En petit groupe', 'card': 'Le Chariot'},
        {'label': 'En grande compagnie', 'card': 'Le Monde'},
        {
          'label': 'À moitié temps seul, moitié en groupe',
          'card': 'La Tempérance'
        },
        {'label': 'Avec des inconnus', 'card': 'Le Fou'},
      ],
    },
    {
      'question': 'Êtes-vous plutôt impulsif ou réfléchi dans vos décisions ?',
      'options': [
        {'label': 'Impulsif', 'card': 'Le Fou'},
        {'label': 'Réfléchi', 'card': "L'Empereur"},
        {'label': 'Parfois impulsif, parfois réfléchi', 'card': 'Le Jugement'},
        {'label': 'Réactif', 'card': 'La Lune'},
        {'label': 'Positif', 'card': "L'Étoile"},
      ],
    },
    {
      'question': 'Comment gérez-vous les conflits dans une relation ?',
      'options': [
        {
          'label': 'En affrontant directement la situation',
          'card': 'Le Chariot'
        },
        {'label': 'En cherchant un compromis', 'card': 'La Tempérance'},
        {'label': 'En évitant la confrontation', 'card': "L'Hermite"},
        {'label': 'En analysant la situation', 'card': 'La Justice'},
        {'label': "En cherchant à apaiser l'autre", 'card': 'La Force'},
      ],
    },
    {
      'question':
          'Quels traits de caractère sont essentiels pour vous dans une relation ?',
      'options': [
        {'label': 'Honnêteté', 'card': 'La Justice'},
        {'label': 'Passion', 'card': 'Le Diable'},
        {'label': 'Empathie', 'card': "L'Étoile"},
        {'label': 'Ambition', 'card': "L'Empereur"},
        {'label': 'Authenticité', 'card': 'Le Fou'},
      ],
    },
    {
      'question':
          "Quelle importance accordez-vous à la spiritualité dans votre vie ?",
      'options': [
        {'label': 'Très importante', 'card': 'Le Pape'},
        {'label': 'Assez importante', 'card': 'La Tempérance'},
        {'label': 'Moyennement importante', 'card': 'Le Jugement'},
        {'label': 'Peu importante', 'card': "L'Empereur"},
        {'label': 'Pas importante du tout', 'card': 'Le Diable'},
      ],
    },
    {
      'question': 'Quelles sont vos priorités dans la vie ?',
      'options': [
        {'label': 'Amour', 'card': "L'Amoureux"},
        {'label': 'Carrière', 'card': 'Le Chariot'},
        {'label': 'Famille', 'card': "L'Empereur"},
        {'label': 'Équilibre', 'card': 'La Tempérance'},
        {'label': 'Expérience personnelle', 'card': 'Le Fou'},
      ],
    },
    {
      'question': 'Comment définissez-vous le bonheur ?',
      'options': [
        {'label': "En ayant de l'amour autour de soi", 'card': "L'Amoureux"},
        {'label': 'En accomplissant ses objectifs', 'card': 'Le Monde'},
        {'label': 'En vivant chaque moment pleinement', 'card': 'Le Soleil'},
        {'label': 'En créant des connexions profondes', 'card': "L'Étoile"},
        {'label': 'En explorant le monde', 'card': 'Le Monde'},
      ],
    },
    {
      'question':
          'Quelles sont vos activités préférées pendant votre temps libre ?',
      'options': [
        {'label': 'Lire', 'card': "L'Hermite"},
        {'label': 'Sortir avec des amis', 'card': 'Le Soleil'},
        {'label': 'Pratiquer un sport', 'card': 'Le Chariot'},
        {'label': 'Voyager', 'card': 'Le Monde'},
        {'label': 'Créer quelque chose', 'card': "L'Impératrice"},
      ],
    },
    {
      'question': 'Aimez-vous voyager ?',
      'options': [
        {'label': 'Oui, vers des lieux exotiques', 'card': 'Le Monde'},
        {'label': 'Oui, vers des villes historiques', 'card': 'Le Pape'},
        {'label': 'Non, je préfère rester chez moi', 'card': "L'Hermite"},
        {'label': 'Oui, vers la nature', 'card': 'Le Jugement'},
        {'label': "Non, mais j'aime découvrir ma ville", 'card': 'Le Fou'},
      ],
    },
    {
      'question': 'Pratiquez-vous un art ou un hobby ?',
      'options': [
        {'label': 'Oui, peinture', 'card': "L'Impératrice"},
        {'label': 'Oui, musique', 'card': 'Le Soleil'},
        {'label': 'Oui, écriture', 'card': 'Le Pape'},
        {'label': 'Oui, danse', 'card': 'Le Magicien'},
        {'label': "Non, je n'ai pas d'hobby", 'card': "L'Hermite"},
      ],
    },
    {
      'question': "Quel type de musique ou d'art vous inspire le plus ?",
      'options': [
        {'label': 'Classique', 'card': 'Le Pape'},
        {'label': 'Pop', 'card': 'Le Soleil'},
        {'label': 'Jazz', 'card': 'Le Magicien'},
        {'label': 'Rock', 'card': 'Le Diable'},
        {'label': 'Musique du monde', 'card': 'Le Monde'},
      ],
    },
    {
      'question': 'Comment envisagez-vous votre avenir dans cinq ans ?',
      'options': [
        {'label': 'Épanoui personnellement', 'card': 'Le Soleil'},
        {
          'label': 'Accomplissant mes rêves professionnels',
          'card': 'Le Chariot'
        },
        {'label': 'En voyage', 'card': 'Le Monde'},
        {'label': 'Avec une famille', 'card': "L'Amoureux"},
        {'label': 'En développement personnel', 'card': "L'Hermite"},
      ],
    },
    {
      'question': 'Que souhaitez-vous accomplir dans votre vie ?',
      'options': [
        {'label': 'Avoir un impact positif sur les autres', 'card': "L'Étoile"},
        {'label': 'Réussir professionnellement', 'card': 'Le Magicien'},
        {'label': 'Créer une belle famille', 'card': "L'Empereur"},
        {'label': 'Voyager et découvrir le monde', 'card': 'Le Fou'},
        {'label': 'Être en paix avec moi-même', 'card': 'La Tempérance'},
      ],
    },
    {
      'question':
          'Quel rôle souhaitez-vous que votre partenaire joue dans vos rêves ?',
      'options': [
        {'label': 'Support et encouragement', 'card': "L'Étoile"},
        {'label': "Partenaire dans l'aventure", 'card': 'Le Chariot'},
        {'label': 'Collaborateur créatif', 'card': 'Le Magicien'},
        {'label': 'Complice de vie', 'card': "L'Amoureux"},
        {'label': 'Mentor et guide', 'card': 'Le Pape'},
      ],
    },
  ];

  // ─── Data (English) ───────────────────────────────────────────────────────

  static const List<Map<String, dynamic>> _questionsEn = [
    {
      'question': 'What qualities do you appreciate most in another person?',
      'options': [
        {'label': 'Loyalty', 'card': 'La Justice'},
        {'label': 'Enthusiasm', 'card': 'Le Soleil'},
        {'label': 'Wisdom', 'card': 'Le Pape'},
        {'label': 'Humor', 'card': 'La Force'},
        {'label': 'Empathy', 'card': "L'Étoile"},
      ],
    },
    {
      'question': 'Do you prefer spending time alone or in a group?',
      'options': [
        {'label': 'Alone', 'card': "L'Hermite"},
        {'label': 'In a small group', 'card': 'Le Chariot'},
        {'label': 'In a large group', 'card': 'Le Monde'},
        {'label': 'Half alone, half in a group', 'card': 'La Tempérance'},
        {'label': 'With strangers', 'card': 'Le Fou'},
      ],
    },
    {
      'question': 'Are you more impulsive or thoughtful in your decisions?',
      'options': [
        {'label': 'Impulsive', 'card': 'Le Fou'},
        {'label': 'Thoughtful', 'card': "L'Empereur"},
        {
          'label': 'Sometimes impulsive, sometimes thoughtful',
          'card': 'Le Jugement'
        },
        {'label': 'Reactive', 'card': 'La Lune'},
        {'label': 'Positive', 'card': "L'Étoile"},
      ],
    },
    {
      'question': 'How do you handle conflicts in a relationship?',
      'options': [
        {
          'label': 'By confronting the situation directly',
          'card': 'Le Chariot'
        },
        {'label': 'By seeking a compromise', 'card': 'La Tempérance'},
        {'label': 'By avoiding confrontation', 'card': "L'Hermite"},
        {'label': 'By analyzing the situation', 'card': 'La Justice'},
        {'label': 'By trying to soothe the other person', 'card': 'La Force'},
      ],
    },
    {
      'question':
          'What character traits are essential for you in a relationship?',
      'options': [
        {'label': 'Honesty', 'card': 'La Justice'},
        {'label': 'Passion', 'card': 'Le Diable'},
        {'label': 'Empathy', 'card': "L'Étoile"},
        {'label': 'Ambition', 'card': "L'Empereur"},
        {'label': 'Authenticity', 'card': 'Le Fou'},
      ],
    },
    {
      'question': 'How important is spirituality in your life?',
      'options': [
        {'label': 'Very important', 'card': 'Le Pape'},
        {'label': 'Quite important', 'card': 'La Tempérance'},
        {'label': 'Moderately important', 'card': 'Le Jugement'},
        {'label': 'Not very important', 'card': "L'Empereur"},
        {'label': 'Not important at all', 'card': 'Le Diable'},
      ],
    },
    {
      'question': 'What are your priorities in life?',
      'options': [
        {'label': 'Love', 'card': "L'Amoureux"},
        {'label': 'Career', 'card': 'Le Chariot'},
        {'label': 'Family', 'card': "L'Empereur"},
        {'label': 'Balance', 'card': 'La Tempérance'},
        {'label': 'Personal experience', 'card': 'Le Fou'},
      ],
    },
    {
      'question': 'How do you define happiness?',
      'options': [
        {'label': 'Having love around you', 'card': "L'Amoureux"},
        {'label': 'Achieving your goals', 'card': 'Le Monde'},
        {'label': 'Living each moment to the fullest', 'card': 'Le Soleil'},
        {'label': 'Building deep connections', 'card': "L'Étoile"},
        {'label': 'Exploring the world', 'card': 'Le Monde'},
      ],
    },
    {
      'question': 'What are your favourite activities in your free time?',
      'options': [
        {'label': 'Reading', 'card': "L'Hermite"},
        {'label': 'Going out with friends', 'card': 'Le Soleil'},
        {'label': 'Playing sports', 'card': 'Le Chariot'},
        {'label': 'Travelling', 'card': 'Le Monde'},
        {'label': 'Creating something', 'card': "L'Impératrice"},
      ],
    },
    {
      'question': 'Do you enjoy travelling?',
      'options': [
        {'label': 'Yes, to exotic destinations', 'card': 'Le Monde'},
        {'label': 'Yes, to historic cities', 'card': 'Le Pape'},
        {'label': 'No, I prefer staying home', 'card': "L'Hermite"},
        {'label': 'Yes, into nature', 'card': 'Le Jugement'},
        {'label': 'No, but I love exploring my city', 'card': 'Le Fou'},
      ],
    },
    {
      'question': 'Do you practice an art or a hobby?',
      'options': [
        {'label': 'Yes, painting', 'card': "L'Impératrice"},
        {'label': 'Yes, music', 'card': 'Le Soleil'},
        {'label': 'Yes, writing', 'card': 'Le Pape'},
        {'label': 'Yes, dancing', 'card': 'Le Magicien'},
        {'label': "No, I don't have a hobby", 'card': "L'Hermite"},
      ],
    },
    {
      'question': 'What type of music or art inspires you the most?',
      'options': [
        {'label': 'Classical', 'card': 'Le Pape'},
        {'label': 'Pop', 'card': 'Le Soleil'},
        {'label': 'Jazz', 'card': 'Le Magicien'},
        {'label': 'Rock', 'card': 'Le Diable'},
        {'label': 'World music', 'card': 'Le Monde'},
      ],
    },
    {
      'question': 'How do you picture your life in five years?',
      'options': [
        {'label': 'Personally fulfilled', 'card': 'Le Soleil'},
        {'label': 'Achieving my professional dreams', 'card': 'Le Chariot'},
        {'label': 'Travelling', 'card': 'Le Monde'},
        {'label': 'With a family', 'card': "L'Amoureux"},
        {'label': 'In personal development', 'card': "L'Hermite"},
      ],
    },
    {
      'question': 'What do you wish to accomplish in your life?',
      'options': [
        {'label': 'Have a positive impact on others', 'card': "L'Étoile"},
        {'label': 'Succeed professionally', 'card': 'Le Magicien'},
        {'label': 'Build a beautiful family', 'card': "L'Empereur"},
        {'label': 'Travel and discover the world', 'card': 'Le Fou'},
        {'label': 'Be at peace with myself', 'card': 'La Tempérance'},
      ],
    },
    {
      'question': 'What role do you want your partner to play in your dreams?',
      'options': [
        {'label': 'Support and encouragement', 'card': "L'Étoile"},
        {'label': 'Partner in adventure', 'card': 'Le Chariot'},
        {'label': 'Creative collaborator', 'card': 'Le Magicien'},
        {'label': 'Life companion', 'card': "L'Amoureux"},
        {'label': 'Mentor and guide', 'card': 'Le Pape'},
      ],
    },
  ];

  // ─── State ────────────────────────────────────────────────────────────────

  int _currentIndex = 0;
  int? _selectedOption;
  final Map<String, int> _cardCounts = {};
  final List<String?> _selectedCards = List.filled(15, null);

  // ─── Locale helpers ───────────────────────────────────────────────────────

  bool get _isEnglish {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    return locale.languageCode == 'en';
  }

  List<Map<String, dynamic>> get _questions =>
      _isEnglish ? _questionsEn : _questionsFr;

  String get _prevLabel => _isEnglish ? 'Previous' : 'Précédent';
  String get _nextLabel => _isEnglish ? 'Next' : 'Suivant';
  String get _finishLabel => _isEnglish ? 'Finish' : 'Terminer';

  // ─── Logic ────────────────────────────────────────────────────────────────

  void _selectOption(int index) => setState(() => _selectedOption = index);

  Future<void> _next() async {
    if (_selectedOption == null) return;
    final card = _questions[_currentIndex]['options'][_selectedOption!]['card']
        as String;
    _cardCounts[card] = (_cardCounts[card] ?? 0) + 1;
    _selectedCards[_currentIndex] = card;

    FFAppState().update(() {
      FFAppState().arcaneListState.add(card);
    });

    // ── Write to Firestore ──────────────────────────────────────────────────
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(uid);
      final doc = await docRef.get();
      final currentList = List<String>.from(doc.data()?['arcaneList'] ?? []);
      currentList.add(card);
      await docRef.update({'arcaneList': currentList});
    }
    // ───────────────────────────────────────────────────────────────────────

    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOption = null;
      });
      FFAppState().update(() {
        FFAppState().currentQuestion = FFAppState().currentQuestion + 1;
      });
    } else {
      context.pushNamed('Accueil-arcane-4');
    }
  }

  Future<void> _previous() async {
    if (_currentIndex == 0) return;

    // ── Remove only the first occurrence of the previous card ──────────────
    final previousCard = _selectedCards[_currentIndex - 1];
    if (previousCard != null) {
      FFAppState().update(() {
        FFAppState().arcaneListState.remove(previousCard);
      });
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        final docRef = FirebaseFirestore.instance.collection('users').doc(uid);
        final doc = await docRef.get();
        final currentList = List<String>.from(doc.data()?['arcaneList'] ?? []);
        currentList.remove(previousCard); // removes only the first occurrence
        await docRef.update({'arcaneList': currentList});
      }
      _cardCounts[previousCard] = (_cardCounts[previousCard] ?? 1) - 1;
      if (_cardCounts[previousCard] == 0) _cardCounts.remove(previousCard);
      _selectedCards[_currentIndex - 1] = null;
    }
    // ───────────────────────────────────────────────────────────────────────

    setState(() {
      _currentIndex--;
      _selectedOption = null;
    });
    FFAppState().update(() {
      FFAppState().currentQuestion = FFAppState().currentQuestion - 1;
    });
  }

  // ─── Theme ────────────────────────────────────────────────────────────────

  Color get _primary => widget.primaryColor ?? const Color(0xFFE4BAFF);
  Color get _bg => widget.backgroundColor ?? const Color(0xFFF4EFE6);

  static const Color _cardBg = Color(0xFFFFFFFF);
  static const Color _borderColor = Color(0xFFCCCCCC);
  static const Color _questionColor = Color(0xFF676C78);
  static const Color _optionTextColor = Color(0xFF7E8491);
  static const Color _prevBtnBg = Color(0xFFE3DBD0);
  static const Color _prevBtnText = Color(0xFF7A7067);
  static const Color _borderSelectedOption = Color(0xFFAA95D6);
  static const Color _optionsTextColor = Color(0xFF7E8491);

  TextStyle _spectral({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = _optionsTextColor,
    double height = 1.4,
    FontStyle fontStyle = FontStyle.normal,
  }) =>
      GoogleFonts.spectral(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
        fontStyle: fontStyle,
      );

  // ─── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 375,
      constraints: const BoxConstraints(maxWidth: 375, maxHeight: 372),
      decoration: BoxDecoration(
        color: _bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borderColor, width: 1.5),
      ),
      child: _buildQuestion(),
    );
  }

  // ─── Question screen ──────────────────────────────────────────────────────

  Widget _buildQuestion() {
    final q = _questions[_currentIndex];
    final options = q['options'] as List<Map<String, dynamic>>;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Question
          Text(
            q['question'] as String,
            textAlign: TextAlign.center,
            style: _spectral(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: _questionColor,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),

          // Options
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: options.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, i) {
                final isSelected = _selectedOption == i;
                return GestureDetector(
                  onTap: () => _selectOption(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    height: 35,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? _primary : _cardBg,
                      border: Border.all(
                        color:
                            isSelected ? _borderSelectedOption : _borderColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      options[i]['label'] as String,
                      style: _spectral(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: isSelected ? Colors.white : _optionTextColor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // Précédent / Suivant
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _currentIndex > 0 ? _previous : null,
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                      color: _currentIndex > 0
                          ? _prevBtnBg
                          : _prevBtnBg.withOpacity(0.45),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _prevLabel,
                      style: _spectral(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: _currentIndex > 0
                            ? _prevBtnText
                            : _prevBtnText.withOpacity(0.35),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: _selectedOption != null ? _next : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    height: 36,
                    decoration: BoxDecoration(
                      color: _selectedOption != null
                          ? _primary
                          : _primary.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _currentIndex < _questions.length - 1
                          ? _nextLabel
                          : _finishLabel,
                      style: _spectral(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
