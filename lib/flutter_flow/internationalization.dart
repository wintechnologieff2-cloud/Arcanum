import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? frText = '',
    String? enText = '',
  }) =>
      [frText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Profile_Complet
  {
    '8x2dtozl': {
      'fr': 'Retour',
      'en': 'Back',
    },
    'prrn1qsk': {
      'fr': 'Profil complet',
      'en': 'Full profile',
    },
    '4u3r0s4l': {
      'fr': 'Mon activité préféré',
      'en': 'My favorite activity',
    },
    '5u9oju5k': {
      'fr': 'Mon style de communication:',
      'en': 'My communication style:',
    },
    'yolrc5k4': {
      'fr': 'Centre d’interêt:',
      'en': 'Area of ​​interest:',
    },
    'u2nemqsq': {
      'fr': 'Pratique spirituelles',
      'en': 'Spiritual practices',
    },
    'du4libug': {
      'fr': 'Photos',
      'en': 'Photos',
    },
    'rqalv0db': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Conversations_empty
  {
    '87qkzvvq': {
      'fr': 'Mes messages',
      'en': 'My messages',
    },
    'zr1b2b0d': {
      'fr': 'Accueil',
      'en': 'Home',
    },
  },
  // Chat_liste-ami_2
  {
    'cnx8kqq3': {
      'fr': 'Mes messages',
      'en': 'My messages',
    },
    'kzskw7o0': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Home
  {
    'rk27x5ja': {
      'fr': 'Arcane du jour',
      'en': 'Arcana of the day',
    },
    'xysydq6k': {
      'fr': 'Découvrez la signification des arcanes',
      'en': 'Discover the meaning of the arcana',
    },
    'wcypdjlo': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Accueil-arcane-sec-2
  {
    'ct1xdchv': {
      'fr': 'Vos arcanes\nsecondaires sont...',
      'en': 'Your secondary mysteries are...',
    },
    '11fsb37y': {
      'fr': 'Terminer',
      'en': 'To end',
    },
    'bsd40txh': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Chat_Conversation
  {
    'p1mn4gnd': {
      'fr': 'En ligne',
      'en': 'Online',
    },
    'ew5i4xqr': {
      'fr': 'Aa',
      'en': 'Aa',
    },
    'rw3cefgb': {
      'fr': 'Conversation bloquée',
      'en': 'Blocked conversation',
    },
    'n27gws0g': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Loading_01
  {
    '9czu837v': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Loading_03
  {
    '9tgpsh3i': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Loading_02
  {
    '6mu4fn7r': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Creervotreprofil_01
  {
    'w1qazvau': {
      'fr': 'Créez votre profil',
      'en': 'Create your profile',
    },
    'md8r9kap': {
      'fr': 'Informations générales 1/3',
      'en': 'General Information 1/3',
    },
    'r87avcl9': {
      'fr': 'Nom complet',
      'en': 'Full name',
    },
    'goh19yj9': {
      'fr': 'Date de naissance',
      'en': 'Date of birth',
    },
    '3j8z5gwb': {
      'fr': 'Choisir date',
      'en': 'Choose date',
    },
    'jkl1dpw6': {
      'fr': 'Ville',
      'en': 'City',
    },
    'qyoo4ruf': {
      'fr': 'Bio',
      'en': 'Bio',
    },
    'ezg316wb': {
      'fr': 'Continuer',
      'en': 'Continue',
    },
    'abbykgm3': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Creervotreprofil_photoschoisis_02
  {
    '3qu8iczo': {
      'fr': 'Créez votre profil',
      'en': 'Create your profile',
    },
    '1qn5aara': {
      'fr': 'Sélection de photos',
      'en': 'Photo selection',
    },
    '20u6yaik': {
      'fr': 'Ajouter des photos',
      'en': 'Add photos',
    },
    '208sp09s': {
      'fr': 'Terminer',
      'en': 'To end',
    },
    '0r1r5ou7': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // PageEntree
  {
    'a8c3tp9q': {
      'fr': 'Propulsé par ',
      'en': 'Powered by',
    },
    '9ifld00o': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Accueil-arcane-5
  {
    'syaw3ljp': {
      'fr': 'Votre arcane est...',
      'en': 'Your secret is...',
    },
    'jz8l17at': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Accueil-arcane-6
  {
    'wwczntgp': {
      'fr': 'Votre arcane est...',
      'en': 'Your secret is...',
    },
    '321rcoki': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Accueil-arcane-4
  {
    '2dnhf3l7': {
      'fr': 'Votre arcane est...',
      'en': 'Your secret is...',
    },
    'x9z56u6y': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // connexion_03_2
  {
    '1tb3q99f': {
      'fr': 'Mes connexions',
      'en': 'My connections',
    },
    'fbf8a7aj': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Creervotreprofil_personnalit_03
  {
    '140rekib': {
      'fr': 'Créez votre profil',
      'en': 'Create your profile',
    },
    'jrdtlkro': {
      'fr': 'Informations générales 3/3',
      'en': 'General information 3/3',
    },
    'y0lquaid': {
      'fr': 'Préférences',
      'en': 'Preferences',
    },
    'vl8r27ym': {
      'fr': 'Mon activité préféré',
      'en': 'My favorite activity',
    },
    'oi6rw38h': {
      'fr': 'Mon style de communication',
      'en': 'My communication style',
    },
    '2g46iwzx': {
      'fr': 'Search...',
      'en': 'Search...',
    },
    'xipcf563': {
      'fr': 'Direct',
      'en': 'Direct',
    },
    '1ieuh51f': {
      'fr': 'Empathique',
      'en': 'Empathetic',
    },
    '34ewt6q0': {
      'fr': 'Analytique',
      'en': 'Analytical',
    },
    '0vm8hbav': {
      'fr': 'Créatif',
      'en': 'Creative',
    },
    'w871gbyb': {
      'fr': 'Spirituel',
      'en': 'Spiritual',
    },
    '02juf1ux': {
      'fr': 'Centre d\'intérêt',
      'en': 'Area of ​​interest',
    },
    '9apgvlpf': {
      'fr': 'Continuer',
      'en': 'Continue',
    },
    'tz1d92m9': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Creervotreprofil_personnalit_02
  {
    'kcqo6svy': {
      'fr': 'Créez votre profil',
      'en': 'Create your profile',
    },
    'btqdcg84': {
      'fr': 'Informations générales 2/3',
      'en': 'General information 2/3',
    },
    '2b2fi1x7': {
      'fr': 'Pratiques spirituelles',
      'en': 'Spiritual practices',
    },
    'i9io0tju': {
      'fr': 'Continuer',
      'en': 'Continue',
    },
    'bxx3cl8w': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Accueil-arcane-2
  {
    'g3udl0zt': {
      'fr': 'Découvrez votre arcane',
      'en': 'Discover your secret',
    },
    'vgi8u0ws': {
      'fr': 'Question 1 sur 15',
      'en': 'Question 1 of 15',
    },
    'ppjk0ewp': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // VotreProfil_2
  {
    'aowqur2w': {
      'fr': 'Votre Profil',
      'en': 'Your Profile',
    },
    'efhw83df': {
      'fr': 'Informations générales ',
      'en': 'General Information',
    },
    '439i4kev': {
      'fr': 'Jean Pot',
      'en': 'Jean Pot',
    },
    'qdal7j1s': {
      'fr': '05-02-1999',
      'en': '05-02-1999',
    },
    'rlz0zowy': {
      'fr': 'Montréal ',
      'en': 'Montreal',
    },
    'jr4c5emt': {
      'fr': 'Nature, Prières et gentillesse :)',
      'en': 'Nature, prayers, and kindness :)',
    },
    '9rfiptp9': {
      'fr': '24',
      'en': '24',
    },
    'tvaf9vos': {
      'fr': 'Photos ',
      'en': 'Photos',
    },
    'cw1i1g2e': {
      'fr': 'Pratiques spirituelles',
      'en': 'Spiritual practices',
    },
    '8l8n27zr': {
      'fr': 'Préférence ',
      'en': 'Preference',
    },
    'brua56m3': {
      'fr': 'Mon activité préféré',
      'en': 'My favorite activity',
    },
    'ld37u3bs': {
      'fr': 'Mon style de communication',
      'en': 'My communication style',
    },
    'wlkapl7o': {
      'fr': 'Search...',
      'en': 'Search...',
    },
    'zjfplwa2': {
      'fr': 'Direct',
      'en': 'Direct',
    },
    'zs1y20wx': {
      'fr': 'Empathique',
      'en': 'Empathetic',
    },
    'zz2jq3sg': {
      'fr': 'Analytique',
      'en': 'Analytical',
    },
    'gy514txe': {
      'fr': 'Créatif',
      'en': 'Creative',
    },
    '3mcg70xq': {
      'fr': 'Spirituel',
      'en': 'Spiritual',
    },
    'mwxe8yma': {
      'fr': 'Centres d\'intérêt ',
      'en': 'Areas of interest',
    },
    'n6tf0j34': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Chat_Conversation_02
  {
    'e71nd4m9': {
      'fr': 'Jean Pierre, 24',
      'en': 'Jean Pierre, 24',
    },
    'esmopk51': {
      'fr': 'En ligne',
      'en': 'Online',
    },
    'pf58bdtr': {
      'fr': 'Hey 🙂 comment s’est passée ta journée?',
      'en': 'Hey 🙂 how was your day?',
    },
    'kewdehr7': {
      'fr': 'Mood universel.',
      'en': 'Universal mood.',
    },
    '6p5ddqxh': {
      'fr': 'Team café noir ou latte fancy?',
      'en': 'Team black coffee or fancy latte?',
    },
    'bh9zbjgu': {
      'fr': 'Mood universel.',
      'en': 'Universal mood.',
    },
    'hon1cxyw': {
      'fr': 'Team café noir ou latte fancy?',
      'en': 'Team black coffee or fancy latte?',
    },
    '04jus7kb': {
      'fr': 'Mood universel.',
      'en': 'Universal mood.',
    },
    'ew447esd': {
      'fr': 'Team café noir ou latte fancy?',
      'en': 'Team black coffee or fancy latte?',
    },
    'vlz10uzd': {
      'fr': 'Mood universel.',
      'en': 'Universal mood.',
    },
    'c07y8ss7': {
      'fr': 'Team café noir ou latte fancy?',
      'en': 'Team black coffee or fancy latte?',
    },
    'fx2eqzez': {
      'fr': 'Latte!',
      'en': 'Latte!',
    },
    'uoqn4d0i': {
      'fr': 'Mais j’essaie de pas trop l’assumer.',
      'en': 'But I\'m trying not to admit it too much.',
    },
    'ilxbgpba': {
      'fr': 'Aa',
      'en': 'Aa',
    },
    '4g3wp9zm': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Limitedematch
  {
    's0ikse3n': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // background_2
  {
    'eh7q7ogw': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // background_1
  {
    'j9em3piv': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // background_3
  {
    'jpfjz4k4': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Settings_2
  {
    'zyj5jal2': {
      'fr': '  Retour',
      'en': 'Back',
    },
    'fxnhbcgb': {
      'fr': 'Paramètres ',
      'en': 'Settings',
    },
    'ndg2txxu': {
      'fr': 'Personnalisation ',
      'en': 'Customization',
    },
    '0gdni60o': {
      'fr': 'Langage',
      'en': 'Language',
    },
    '5qp00g23': {
      'fr': 'English',
      'en': 'English',
    },
    'h1wuk1hy': {
      'fr': 'Français',
      'en': 'Français',
    },
    '7zcjvf6o': {
      'fr': 'Apparence',
      'en': 'Appearance',
    },
    'yvexj636': {
      'fr': 'A propos de l\'application ',
      'en': 'About the application',
    },
    'i8hy4ax9': {
      'fr': 'Noter',
      'en': 'Note',
    },
    'jk9nzsh8': {
      'fr': 'Partager',
      'en': 'Share',
    },
    '1gez7xsy': {
      'fr': 'Contact',
      'en': 'Contact',
    },
    'qc9lv3t1': {
      'fr': 'Se déconnecter',
      'en': 'Log out',
    },
    '2bgqy4d8': {
      'fr': '© 2026 Arcanum. Tous droits réservés.',
      'en': '© 2026 Arcanum. All rights reserved.',
    },
    'j5fmtqya': {
      'fr': 'Propulsé par',
      'en': 'Powered by',
    },
    'nl3joj05': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Bienvenue
  {
    'h697ynjx': {
      'fr': 'Se connecter',
      'en': 'Log in',
    },
    's7f55nae': {
      'fr': 'Créer un compte',
      'en': 'Create an account',
    },
    'q7wrto4g': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // CreerCompte
  {
    '5p4r0btm': {
      'fr': 'Créez votre compte',
      'en': 'Create your account',
    },
    'hbauezgm': {
      'fr': 'Addresse courriel',
      'en': 'Email address',
    },
    'qocqhjrz': {
      'fr': 'Mot de passe',
      'en': 'Password',
    },
    '8bytom4d': {
      'fr': 'Confirmer mot de passe',
      'en': 'Confirm password',
    },
    '9r4jldk3': {
      'fr': 'Créer un compte',
      'en': 'Create an account',
    },
    'zs5nh4pg': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // SeConnecter
  {
    '9kp06kh8': {
      'fr': 'Se connecter',
      'en': 'Log in',
    },
    'zz6miq6n': {
      'fr': 'Retour',
      'en': '',
    },
    'la9pd53n': {
      'fr': 'Addresse courriel',
      'en': 'Email address',
    },
    'gtaqguqo': {
      'fr': 'Mot de passe',
      'en': 'Password',
    },
    '2a2gl297': {
      'fr': 'Se Connecter',
      'en': 'Log in',
    },
    'pi7d25jp': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Accueil-arcane-2Copy
  {
    'dq85jdz1': {
      'fr': 'Découvrez votre arcane',
      'en': 'Discover your secret',
    },
    'wp1xu4ae': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // pageImage
  {
    'bi2k40dd': {
      'fr': 'Page Title',
      'en': 'Page Title',
    },
    'qywf9qa0': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Explore_02Copy
  {
    'osier7zs': {
      'fr': 'Trouvez des arcanistes',
      'en': 'Find arcanists',
    },
    '87g1bq0x': {
      'fr': 'Arcaniste à proximité',
      'en': 'Arcanist nearby',
    },
    'soot1d2f': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // PageEntreeCopy
  {
    'l0jcbpja': {
      'fr': 'Propulsé par ',
      'en': 'Powered by',
    },
    'okldkhbr': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // tutoriel
  {
    '75yp398e': {
      'fr': 'Bienvenue sur Arcanum',
      'en': '',
    },
    '28baufki': {
      'fr':
          'Dès votre inscription, vous devez répondre à un questionnaire. Ce questionnaire permet de mieux comprendre votre énergie, votre personnalité et vos affinités spirituelles.',
      'en': '',
    },
    'u64wdri8': {
      'fr': 'Découvrir vos Arcanes',
      'en': '',
    },
    '42c7rxn4': {
      'fr':
          'Une fois le questionnaire complété, Arcanum vous attribue :\n- 1  Arcane principale (votre énergie dominante)\n- 3  Arcanes secondaires (vos influences complémentaires)',
      'en': '',
    },
    '65etts8w': {
      'fr':
          'Ces arcanes définissent votre profil spirituel dans l’application.',
      'en': '',
    },
    '2t7dhdqd': {
      'fr': 'Explorer les autres utilisateurs',
      'en': '',
    },
    '8n4tnnml': {
      'fr':
          'Vous pouvez ensuite découvrir d’autres personnes dans l’app. Chaque profil est accompagné d’un pourcentage de compatibilité calculé à partir de :',
      'en': '',
    },
    'ynbgx2g5': {
      'fr': 'vos Arcanes\nvos pratiques spirituelles\nvos centres d’intérêt',
      'en': '',
    },
    'ain8u9qi': {
      'fr': 'Envoyer une demande de connexion',
      'en': '',
    },
    's99xrndw': {
      'fr':
          'Si un profil vous intéresse, vous pouvez envoyer une demande de connexion. L’autre personne peut l’accepter ou la refuser.',
      'en': '',
    },
    'fvxhndyd': {
      'fr':
          'Si la demande est acceptée, vous pouvez commencer à discuter librement.',
      'en': '',
    },
    'xb91o69v': {
      'fr': 'Dévoiler la photo de profil',
      'en': '',
    },
    'v8cqvsxe': {
      'fr':
          'Après plus de 3 messages échangés dans la conversation, la photo de profil de la personne se débloque automatiquement. Cela permet de créer des connexions basées d’abord sur l’énergie et les affinités, avant l’apparence.',
      'en': '',
    },
    'nwki9pfb': {
      'fr': 'Continuer',
      'en': 'Continue',
    },
    'fwym684i': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // carteTemperance
  {
    'cgputne7': {
      'fr': 'La Tempérance',
      'en': 'Temperance',
    },
  },
  // arcaneDuJour
  {
    'eiqgibxo': {
      'fr': 'Conseils:',
      'en': 'Advice:',
    },
  },
  // freemium
  {
    'dkc6gpek': {
      'fr': 'Limite de matchs\n amoureux atteinte',
      'en': 'Match limit reached.\n\nLove matches reached.',
    },
    'rlb4ri2b': {
      'fr': '3/3',
      'en': '3/3',
    },
    '39jo74ao': {
      'fr': 'Regarder une publicité afin de\nrécupérer un match amoureux',
      'en': 'Watch an advertisement in order to\nfind a romantic match',
    },
  },
  // mesMessagesWidget
  {
    'sznwzrlo': {
      'fr': 'Messages',
      'en': 'Messages',
    },
  },
  // demandeConnexionWidget
  {
    'xyij3tq5': {
      'fr': 'Accepter',
      'en': 'Accept',
    },
    '1zheiznm': {
      'fr': 'Refuser',
      'en': 'Refuse',
    },
  },
  // arcanisteWidgetGrand
  {
    '53kvouwy': {
      'fr': 'Je suis un ',
      'en': 'I am ',
    },
    '1wr9757y': {
      'fr': ' et un ',
      'en': ' and ',
    },
    'qbztm2nb': {
      'fr': 'Centre d’interêt:',
      'en': 'Center of ​​interest:',
    },
    'gkve6ylz': {
      'fr': 'Profil Complet',
      'en': 'Full Profile',
    },
  },
  // NoConversationWidget
  {
    'bv0m05zc': {
      'fr': 'Aucune conversation',
      'en': 'No conversation',
    },
    'nop42riz': {
      'fr': 'Commencez à explorer des profils pour connecter',
      'en': 'Start exploring profiles to connect',
    },
    'bo5a714h': {
      'fr': 'Explorer',
      'en': 'Explore',
    },
  },
  // noConnexionWidget
  {
    '8t1rnuav': {
      'fr': 'Aucune connexion',
      'en': 'No connection',
    },
    '0d0zw834': {
      'fr': 'Commencez à explorer des profils pour vous connecter',
      'en': 'Start exploring profiles to connect',
    },
    'wc8gb6rs': {
      'fr': 'Explorer',
      'en': 'Explore',
    },
  },
  // noArcaneWidget
  {
    '2i9rt30d': {
      'fr': 'Aucun acaraniste',
      'en': 'No mite catcher',
    },
  },
  // questionsBoardWidget
  {
    'ivtv95yc': {
      'fr': 'Quelles qualités appréciez-vous le plus chez une autre personne ?',
      'en': 'What qualities do you appreciate most in another person?',
    },
    'udtqd3k6': {
      'fr': 'La loyauté',
      'en': 'Loyalty',
    },
    '5urkc8v6': {
      'fr': 'La loyauté',
      'en': 'Loyalty',
    },
    'g1zt5odq': {
      'fr': 'La loyauté',
      'en': 'Loyalty',
    },
    'fo39sxbs': {
      'fr': 'La loyauté',
      'en': 'Loyalty',
    },
    'kcya96ww': {
      'fr': 'La loyauté',
      'en': 'Loyalty',
    },
    '68h1nlzm': {
      'fr': 'Précédent',
      'en': 'Previous',
    },
    'n1udejco': {
      'fr': 'Suivant',
      'en': 'Following',
    },
  },
  // cartePape
  {
    'wrbupnsd': {
      'fr': 'Le Pape',
      'en': 'The Pope',
    },
  },
  // carteMat
  {
    '69dbar4t': {
      'fr': 'Le Mat',
      'en': 'The Mat',
    },
  },
  // carteBateleur
  {
    'hc2mhh0i': {
      'fr': 'Le Bateleur',
      'en': 'The Magician',
    },
  },
  // cartePapesse
  {
    'qndpekqn': {
      'fr': 'La Papesse',
      'en': 'The High Priestess',
    },
  },
  // carteImperatrice
  {
    'lwqpnbl1': {
      'fr': 'L\'Impératrice',
      'en': 'The Empress',
    },
  },
  // carteEmpereur
  {
    'bzlm8dpd': {
      'fr': 'L\'Empereur',
      'en': 'The Emperor',
    },
  },
  // carteAmoureux
  {
    '21h1zwwt': {
      'fr': 'L\'Amoureux',
      'en': 'The Lover',
    },
  },
  // carteChariot
  {
    'rqvyt9ek': {
      'fr': 'Le Chariot',
      'en': 'The Chariot',
    },
  },
  // carteForce
  {
    'nq1gdlnt': {
      'fr': 'La Force',
      'en': 'The Force',
    },
  },
  // carteErmite
  {
    'zl60wxx8': {
      'fr': 'L\'Ermite',
      'en': 'The Hermit',
    },
  },
  // carteRoueDeLaFortune
  {
    'eabz3nie': {
      'fr': 'La roue',
      'en': 'The wheel',
    },
  },
  // carteJustice
  {
    '3e9rjwla': {
      'fr': 'La Justice',
      'en': 'Justice',
    },
  },
  // cartePendu
  {
    'suahvsyy': {
      'fr': 'Le Pendu',
      'en': 'The Hanged Man',
    },
  },
  // carteMort
  {
    'sel3t520': {
      'fr': 'La Mort',
      'en': 'Death',
    },
  },
  // carteDiable
  {
    'adihhyn3': {
      'fr': 'Le Diable',
      'en': 'The Devil',
    },
  },
  // carteMaisonDieu
  {
    'ew5k9tkx': {
      'fr': 'La Maison Dieu',
      'en': 'The House of God',
    },
  },
  // carteEtoile
  {
    'wvzxv8mr': {
      'fr': 'L\'Étoile',
      'en': 'The Star',
    },
  },
  // carteLune
  {
    'ej67ssef': {
      'fr': 'La Lune',
      'en': 'The Moon',
    },
  },
  // carteSoleil
  {
    'xt0k57yx': {
      'fr': 'Le Soleil',
      'en': 'The Sun',
    },
  },
  // carteJugement
  {
    'ioy0rfc2': {
      'fr': 'Le Jugement',
      'en': 'The Judgment',
    },
  },
  // carteMonde
  {
    '3f0umee0': {
      'fr': 'Le Monde',
      'en': 'The World',
    },
  },
  // Miscellaneous
  {
    'lg9amppv': {
      'fr': 'In order to search nearby, this app access your actual location',
      'en': 'In order to search nearby, this app access your actual location',
    },
    'br3uxg0v': {
      'fr': '',
      'en': '',
    },
    '8p97uin7': {
      'fr': '',
      'en': '',
    },
    'kdix6li3': {
      'fr': 'This app will use your actual location',
      'en': 'This app will use your current location',
    },
    'c9hnlwb3': {
      'fr':
          'In order to upload data, this app requires permission to access to photo library.',
      'en':
          'In order to upload data, this app requires permission to access to photo library.',
    },
    'dupuq2ze': {
      'fr': '',
      'en': '',
    },
    '2q5wamd0': {
      'fr': '',
      'en': '',
    },
    '4t8wcvh1': {
      'fr': '',
      'en': '',
    },
    '861umer4': {
      'fr': '',
      'en': '',
    },
    'xelzbmxf': {
      'fr': '',
      'en': '',
    },
    'kehylz8b': {
      'fr': '',
      'en': '',
    },
    'pt2w00hn': {
      'fr': '',
      'en': '',
    },
    'qt7gzwsa': {
      'fr': '',
      'en': '',
    },
    't76nou2p': {
      'fr': '',
      'en': '',
    },
    '59offac3': {
      'fr': '',
      'en': '',
    },
    'cm8vhtea': {
      'fr': '',
      'en': '',
    },
    'ujm4yq3a': {
      'fr': '',
      'en': '',
    },
    '3xrgs7b9': {
      'fr': '',
      'en': '',
    },
    '207c0e6e': {
      'fr': '',
      'en': '',
    },
    'qe9vuubw': {
      'fr': '',
      'en': '',
    },
    'n1ci0k7f': {
      'fr': '',
      'en': '',
    },
    'hc5b3ouc': {
      'fr': '',
      'en': '',
    },
    'o1egm6y4': {
      'fr': '',
      'en': '',
    },
    '2nlq2yw4': {
      'fr': '',
      'en': '',
    },
    '9y0js3iz': {
      'fr': '',
      'en': '',
    },
    'a626io6n': {
      'fr': '',
      'en': '',
    },
    'vm20dr6a': {
      'fr': '',
      'en': '',
    },
    '2okjc3d2': {
      'fr': '',
      'en': '',
    },
    'husxb6cw': {
      'fr': '',
      'en': '',
    },
    'x06fdbv0': {
      'fr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
