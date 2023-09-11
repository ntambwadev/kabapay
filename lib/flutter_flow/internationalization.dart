import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'sw'];

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
    String? enText = '',
    String? frText = '',
    String? swText = '',
  }) =>
      [enText, frText, swText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // onboarding_page
  {
    'kgi0yevl': {
      'en': 'Welcome',
      'fr': 'Accueillir',
      'sw': 'Karibu',
    },
    '76x3qb7u': {
      'en': 'Welcome to Vaultpay',
      'fr': 'Bienvenue sur VaultPay',
      'sw': 'Karibu Vaultpay',
    },
    '0u5e512o': {
      'en':
          'The first crypto platform in DR Congo supporting Airtel money, Orange money and Vodacom Mpesa',
      'fr':
          'La première plateforme crypto en RD Congo supportant Airtel money, Orange money et Vodacom Mpesa',
      'sw':
          'Jukwaa la kwanza la crypto nchini DR Congo linalosaidia Airtel money, Orange money na Vodacom Mpesa',
    },
    'fkvbn8zi': {
      'en': 'Secure and reliable ',
      'fr': 'Sûr et fiable',
      'sw': 'Salama na ya kuaminika',
    },
    '6jul5522': {
      'en':
          'Buy and Sell Crypto with piece of mind using your mobile money accounts.',
      'fr':
          'Achetez et vendez des cryptos en toute tranquillité d\'esprit en utilisant vos comptes d\'argent mobile.',
      'sw':
          'Nunua na Uuze Crypto kwa akili ukitumia akaunti zako za pesa za rununu.',
    },
    'p620jgn4': {
      'en': 'Fast and Flexible',
      'fr': 'Rapide et flexible',
      'sw': 'Haraka na Rahisi',
    },
    'ddvmpmi9': {
      'en':
          'We are constantly improving Vaultpay to offer you a world class experience.',
      'fr':
          'Nous améliorons constamment Vaultpay pour vous offrir une expérience de classe mondiale.',
      'sw':
          'Tunaboresha Vaultpay kila wakati ili kukupa uzoefu wa hali ya juu.',
    },
    '4tdqak56': {
      'en': 'Login with phone',
      'fr': 'Connectez-vous avec le téléphone',
      'sw': 'Ingia na simu',
    },
    '1ne6njze': {
      'en': 'Login with email',
      'fr': 'Connectez-vous avec e-mail',
      'sw': 'Ingia kwa barua pepe',
    },
    '8lb31spr': {
      'en': 'Register',
      'fr': 'Enregistrer',
      'sw': 'Sajili',
    },
    'zl6et8z1': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // recipient_page
  {
    'mrifrk2y': {
      'en': 'Recipient',
      'fr': 'Destinataire',
      'sw': 'Mpokeaji',
    },
    'hjqrsgeh': {
      'en': 'Wallet address',
      'fr': 'Adresse du portefeuille',
      'sw': 'Anwani ya Wallet',
    },
    '8s1mp27d': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'do55n5r6': {
      'en': '0x473Adc04036b3c318aD4c18EF6C0',
      'fr': '0x473Adc04036b3c318aD4c18EF6C0',
      'sw': '0x473Adc04036b3c318aD4c18EF6C0',
    },
    'o8a13o07': {
      'en': 'Full name',
      'fr': 'Nom et prénom',
      'sw': 'Jina kamili',
    },
    '0cn0t6d5': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'z9ovzo1e': {
      'en': 'Aime Tshibangu',
      'fr': 'Aimé Tshibangu',
      'sw': 'Aime Tshibangu',
    },
    'lc09brsg': {
      'en': 'Mobile phone',
      'fr': 'Téléphone mobile',
      'sw': 'Simu ya rununu',
    },
    's66futd5': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    '3r2nt6g2': {
      'en': '+243992457388',
      'fr': '+243992457388',
      'sw': '+243992457388',
    },
    'o2q4hy0a': {
      'en': 'Continue',
      'fr': 'Continuer',
      'sw': 'Endelea',
    },
    'jvdsxbuz': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // register_page
  {
    '33vz8nqh': {
      'en': 'Create Account',
      'fr': 'Créer un compte',
      'sw': 'Tengeneza akaunti',
    },
    'yrcetpw2': {
      'en':
          'Create your account by filling in the information below to access the app.',
      'fr':
          'Créez votre compte en remplissant les informations ci-dessous pour accéder à l\'application.',
      'sw':
          'Fungua akaunti yako kwa kujaza maelezo hapa chini ili kufikia programu.',
    },
    '4pjed3e4': {
      'en': 'Enter your email...',
      'fr': 'Entrer votre Email...',
      'sw': 'Weka barua pepe yako...',
    },
    '6ry1zj1g': {
      'en': 'Please enter your password...',
      'fr': 'S\'il vous plait entrez votre mot de passe...',
      'sw': 'Tafadhali weka nenosiri lako...',
    },
    'q6vvznln': {
      'en': 'Please enter your password...',
      'fr': 'S\'il vous plait entrez votre mot de passe...',
      'sw': 'Tafadhali weka nenosiri lako...',
    },
    'gs8m1xvh': {
      'en': 'Create Account',
      'fr': 'Créer un compte',
      'sw': 'Tengeneza akaunti',
    },
    'zmghngze': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // login_page
  {
    'k7njmv60': {
      'en': 'Login',
      'fr': 'Connexion',
      'sw': 'Ingia',
    },
    '7lnzj2mq': {
      'en': 'Access your account by logging in below.',
      'fr': 'Accédez à votre compte en vous connectant ci-dessous.',
      'sw': 'Fikia akaunti yako kwa kuingia hapa chini.',
    },
    'dglqdjf5': {
      'en': 'Enter your email...',
      'fr': 'Entrer votre Email...',
      'sw': 'Weka barua pepe yako...',
    },
    'dixaqb58': {
      'en': 'Please enter your password...',
      'fr': 'S\'il vous plait entrez votre mot de passe...',
      'sw': 'Tafadhali weka nenosiri lako...',
    },
    'ss3467gf': {
      'en': 'Login',
      'fr': 'Connexion',
      'sw': 'Ingia',
    },
    'b1818lqs': {
      'en': 'Forgot Password?',
      'fr': 'Mot de passe oublié?',
      'sw': 'Umesahau nywila?',
    },
    'e8tl8j5k': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // home_page
  {
    '5f7w2rwu': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // tokens_page
  {
    '4dfo553x': {
      'en': 'Tokens',
      'fr': 'Jetons',
      'sw': 'Ishara',
    },
    'zv0rvf78': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // buy_token_page
  {
    'np0tkmuy': {
      'en': 'Buy Token',
      'fr': 'Acheter un jeton',
      'sw': 'Nunua Tokeni',
    },
    'u9is7l5l': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // payment_methods_page
  {
    '9r7aauvp': {
      'en': 'How will you pay?',
      'fr': 'Comment paierez-vous?',
      'sw': 'Utalipaje?',
    },
    'br10fnam': {
      'en': 'Select your payment method',
      'fr': 'Sélectionnez votre méthode de paiement',
      'sw': 'Chagua njia yako ya kulipa',
    },
    'lfjf7ceh': {
      'en': 'Or ',
      'fr': 'Ou',
      'sw': 'Au',
    },
    'bcv1wdx6': {
      'en': 'Add new number',
      'fr': 'Ajouter un nouveau numéro',
      'sw': 'Ongeza nambari mpya',
    },
    'ii5gh4ls': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // confirmation_page
  {
    '7r65gheu': {
      'en': 'Confirmation',
      'fr': 'Confirmation',
      'sw': 'Uthibitisho',
    },
    'm4tvulyy': {
      'en': 'Confirm and pay',
      'fr': 'Confirmer et payer',
      'sw': 'Thibitisha na ulipe',
    },
    '51ozp1v6': {
      'en': 'Please authenticate to continue',
      'fr': 'Veuillez vous authentifier pour continuer',
      'sw': 'Tafadhali thibitisha ili kuendelea',
    },
    'gsq78zqf': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // settings_page
  {
    'ny2njesp': {
      'en': 'Settings',
      'fr': 'Paramètres',
      'sw': 'Mipangilio',
    },
    '180k82nb': {
      'en': 'Logout',
      'fr': 'Se déconnecter',
      'sw': 'Ondoka',
    },
    'lgf10g04': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // success_page
  {
    'rmg0tflb': {
      'en': 'Success!',
      'fr': 'Succès!',
      'sw': 'Mafanikio!',
    },
    'jfgpj763': {
      'en': 'Your transaction was successfully created. ',
      'fr': 'Votre transaction a été créée avec succès.',
      'sw': 'Muamala wako umeundwa.',
    },
    'x73isb0j': {
      'en': 'To pay, send',
      'fr': 'Pour payer, envoyez',
      'sw': 'Ili kulipa, tuma',
    },
    'lda607x5': {
      'en': '\$97 USD',
      'fr': '97 USD',
      'sw': '\$97 USD',
    },
    '4uxsg6tk': {
      'en': 'to',
      'fr': 'pour',
      'sw': 'kwa',
    },
    '6p8d0o9w': {
      'en': '0971504436',
      'fr': '0x123ghxffkjsds',
      'sw': '0x123ghxffkjsds',
    },
    'vsl23of4': {
      'en':
          'Important: Make sure to use your number: 0971504436 for the transfer. We\'ll send your crypto once we receive the payment. ',
      'fr':
          'Important : Assurez-vous d\'utiliser votre numéro : 0971504436 pour le transfert. Nous vous enverrons votre crypto une fois que nous aurons reçu le paiement.',
      'sw':
          'Muhimu: Hakikisha unatumia nambari yako: 0971504436 kwa uhamisho. Tutakutumia cryptocurrency yako mara tu tutakapopokea malipo.',
    },
    'ba5y4wt5': {
      'en': 'Done',
      'fr': 'Fait',
      'sw': 'Imekamilika',
    },
    'fi4h7dml': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // phone_login_page
  {
    'ilgsn5cf': {
      'en': 'Phone login',
      'fr': 'Connexion par téléphone',
      'sw': 'Kuingia kwa simu',
    },
    'bk57n2yy': {
      'en': 'Type in your phone number below to register.',
      'fr': 'Tapez votre numéro de téléphone ci-dessous pour vous inscrire.',
      'sw': 'Andika nambari yako ya simu hapa chini ili kujiandikisha.',
    },
    '84985loc': {
      'en': '+243971504436',
      'fr': '+243971504436',
      'sw': '+243971504436',
    },
    'nk5lffam': {
      'en': 'Sign In with Phone',
      'fr': 'Se connecter avec le téléphone',
      'sw': 'Ingia kwa kutumia Simu',
    },
    '6osi0bb0': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // sms_verification_page
  {
    'ojco3nk2': {
      'en': 'This code helps keep your account safe and secure.',
      'fr': 'Ce code permet de garder votre compte sûr et sécurisé.',
      'sw': 'Nambari hii husaidia kuweka akaunti yako salama na salama.',
    },
    'fd8yh3cc': {
      'en': 'Confirm & Continue',
      'fr': 'Confirmer et continuer',
      'sw': 'Thibitisha na Uendelee',
    },
    'm18584jp': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // forgot_password_page
  {
    '7oeg0kkz': {
      'en': 'Forgot Password',
      'fr': 'Mot de passe oublié',
      'sw': 'Umesahau nywila',
    },
    '3cevtwb9': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'fr':
          'Nous vous enverrons un e-mail avec un lien pour réinitialiser votre mot de passe, veuillez entrer l\'e-mail associé à votre compte ci-dessous.',
      'sw':
          'Tutakutumia barua pepe yenye kiungo cha kuweka upya nenosiri lako, tafadhali weka barua pepe inayohusishwa na akaunti yako hapa chini.',
    },
    'd9r8z5ts': {
      'en': 'Enter your email...',
      'fr': 'Entrer votre Email...',
      'sw': 'Weka barua pepe yako...',
    },
    'ywz8wiqt': {
      'en': 'Send Link',
      'fr': 'Envoyer un lien',
      'sw': 'Tuma Kiungo',
    },
    '7n73lcp5': {
      'en': 'Home',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // select_recipient_page
  {
    'xqrfb5nj': {
      'en': 'Select Recipient',
      'fr': 'Comment paierez-vous?',
      'sw': 'Utalipaje?',
    },
    'g31uzcy0': {
      'en': 'Select your recipient',
      'fr': 'Sélectionnez votre méthode de paiement',
      'sw': 'Chagua njia yako ya kulipa',
    },
    'tsyofvs2': {
      'en': 'Or ',
      'fr': 'Ou',
      'sw': 'Au',
    },
    'blq1s1o2': {
      'en': 'Add new recipient',
      'fr': 'Ajouter un nouveau numéro',
      'sw': 'Ongeza nambari mpya',
    },
    'oogi1izk': {
      'en': 'Home',
      'fr': '',
      'sw': '',
    },
  },
  // settings_main_page
  {
    'merg4u9m': {
      'en': 'Andrea Davis',
      'fr': 'Andréa Davis',
      'sw': 'Andrea Davis',
    },
    'vrd3evnm': {
      'en': 'andrea@domainname.com',
      'fr': 'andrea@nomdomaine.com',
      'sw': 'andrea@domainname.com',
    },
    '8sba9svs': {
      'en': 'Edit Profile',
      'fr': 'Editer le profil',
      'sw': 'Badilisha Wasifu',
    },
    'haxxp4bo': {
      'en': 'Account Settings',
      'fr': 'Paramètres du compte',
      'sw': 'Mipangilio ya Akaunti',
    },
    '52qk5n3x': {
      'en': 'Terms of service & Privacy',
      'fr': 'Conditions d\'utilisation et confidentialité',
      'sw': 'Sheria na Masharti na Faragha',
    },
    'wfbb2kkl': {
      'en': 'Logout',
      'fr': 'Se déconnecter',
      'sw': 'Ondoka',
    },
    'skr3lx23': {
      'en': '__',
      'fr': '__',
      'sw': '__',
    },
  },
  // edit_profile
  {
    '5lhizk3m': {
      'en': 'Edit profile',
      'fr': 'Comment paierez-vous?',
      'sw': 'Utalipaje?',
    },
    'xi0b31v4': {
      'en': 'Your Name',
      'fr': '',
      'sw': '',
    },
    'o8g4bc9p': {
      'en': 'Your City',
      'fr': '',
      'sw': '',
    },
    'v3lzdrso': {
      'en': 'State',
      'fr': '',
      'sw': '',
    },
    'm5int8i9': {
      'en': 'State',
      'fr': '',
      'sw': '',
    },
    '2t8fy758': {
      'en': 'Alabama',
      'fr': '',
      'sw': '',
    },
    '8mw7x1aq': {
      'en': 'Alaska',
      'fr': '',
      'sw': '',
    },
    'lmd11anj': {
      'en': 'Arizona',
      'fr': '',
      'sw': '',
    },
    '50nj3ajx': {
      'en': 'Arkansas',
      'fr': '',
      'sw': '',
    },
    'o7yqp2tw': {
      'en': 'California',
      'fr': '',
      'sw': '',
    },
    'ox7xsttx': {
      'en': 'Colorado',
      'fr': '',
      'sw': '',
    },
    'yql130io': {
      'en': 'Connecticut',
      'fr': '',
      'sw': '',
    },
    'cni7bxpl': {
      'en': 'Delaware',
      'fr': '',
      'sw': '',
    },
    'mf6embu9': {
      'en': 'Florida',
      'fr': '',
      'sw': '',
    },
    'jz3fxv8s': {
      'en': 'Georgia',
      'fr': '',
      'sw': '',
    },
    '3o34gp01': {
      'en': 'Hawaii',
      'fr': '',
      'sw': '',
    },
    '3yo13a86': {
      'en': 'Idaho',
      'fr': '',
      'sw': '',
    },
    'ibc33c8b': {
      'en': 'Illinoi',
      'fr': '',
      'sw': '',
    },
    'u0mnfx3y': {
      'en': 'Indiana',
      'fr': '',
      'sw': '',
    },
    'vqxwt66y': {
      'en': 'Iowa',
      'fr': '',
      'sw': '',
    },
    'l5oj3349': {
      'en': 'Kansas',
      'fr': '',
      'sw': '',
    },
    's1fx9bcw': {
      'en': 'Kentucky',
      'fr': '',
      'sw': '',
    },
    'e7odtij1': {
      'en': 'Louisiana',
      'fr': '',
      'sw': '',
    },
    'rctcltye': {
      'en': 'Maine',
      'fr': '',
      'sw': '',
    },
    'ju53hqh4': {
      'en': 'Maryland',
      'fr': '',
      'sw': '',
    },
    'm7ifgrer': {
      'en': 'Massachusetts',
      'fr': '',
      'sw': '',
    },
    'zin9klxz': {
      'en': 'Michigan',
      'fr': '',
      'sw': '',
    },
    'a6xnnhbs': {
      'en': 'Minnesota',
      'fr': '',
      'sw': '',
    },
    'v41dhhz3': {
      'en': 'Mississippi',
      'fr': '',
      'sw': '',
    },
    'pzbkly96': {
      'en': 'Missouri',
      'fr': '',
      'sw': '',
    },
    'zvtdleka': {
      'en': 'Monta',
      'fr': '',
      'sw': '',
    },
    'd4d4dj6z': {
      'en': 'Nebraska',
      'fr': '',
      'sw': '',
    },
    '4qdm3quu': {
      'en': 'Nevada',
      'fr': '',
      'sw': '',
    },
    'pviwvfib': {
      'en': 'New Hampshire',
      'fr': '',
      'sw': '',
    },
    'xjtof912': {
      'en': 'New Jersey',
      'fr': '',
      'sw': '',
    },
    'uxo7rglz': {
      'en': 'New Mexico',
      'fr': '',
      'sw': '',
    },
    'hgbr152p': {
      'en': 'New York',
      'fr': '',
      'sw': '',
    },
    '0h72awkb': {
      'en': 'North Carolina',
      'fr': '',
      'sw': '',
    },
    'yfjqm8zc': {
      'en': 'North Dak',
      'fr': '',
      'sw': '',
    },
    'of8fp4w3': {
      'en': 'Ohio',
      'fr': '',
      'sw': '',
    },
    'm1qakh0k': {
      'en': 'Oklahoma',
      'fr': '',
      'sw': '',
    },
    'ti4qm885': {
      'en': 'Oregon',
      'fr': '',
      'sw': '',
    },
    '7ditk5a8': {
      'en': 'Pennsylvani',
      'fr': '',
      'sw': '',
    },
    'z2ysxcz6': {
      'en': 'Rhode Island',
      'fr': '',
      'sw': '',
    },
    'eivrltat': {
      'en': 'South Caroli',
      'fr': '',
      'sw': '',
    },
    'ybysp69p': {
      'en': 'South Dakota',
      'fr': '',
      'sw': '',
    },
    'gttazu7k': {
      'en': 'Tennessee',
      'fr': '',
      'sw': '',
    },
    'kl2dgkwl': {
      'en': 'Texas',
      'fr': '',
      'sw': '',
    },
    'mtvgpddy': {
      'en': 'Utah',
      'fr': '',
      'sw': '',
    },
    'lz1f7qxh': {
      'en': 'Vermont',
      'fr': '',
      'sw': '',
    },
    'phy18qgu': {
      'en': 'Virginia',
      'fr': '',
      'sw': '',
    },
    'jrye5f9f': {
      'en': 'Washingto',
      'fr': '',
      'sw': '',
    },
    'ceq0fb5k': {
      'en': 'West Virginia',
      'fr': '',
      'sw': '',
    },
    'hxo4cwwi': {
      'en': 'Wisconsin',
      'fr': '',
      'sw': '',
    },
    'esxzr8o1': {
      'en': 'Wyoming',
      'fr': '',
      'sw': '',
    },
    'meuw9xew': {
      'en': 'Select State',
      'fr': '',
      'sw': '',
    },
    'a1fum1c0': {
      'en': 'Your bio',
      'fr': '',
      'sw': '',
    },
    '8sjxsk4k': {
      'en': 'Save Changes',
      'fr': '',
      'sw': '',
    },
  },
  // home_button
  {
    'tkmbhgt6': {
      'en': 'Send',
      'fr': 'Envoyer',
      'sw': 'Tuma',
    },
  },
  // add_phone_instrument
  {
    'nk7meo7x': {
      'en': 'Enter a number?',
      'fr': 'Entrez un nombre ?',
      'sw': 'Ungependa kuweka nambari?',
    },
    '911nhcgc': {
      'en': 'Select network: ',
      'fr': 'Sélectionnez réseau:',
      'sw': 'Chagua mtandao:',
    },
    'hmotvql5': {
      'en': 'Vodacom',
      'fr': 'Vodacom',
      'sw': 'Vodacom',
    },
    'xc6581zs': {
      'en': 'Mobile money number:',
      'fr': 'Numéro de mobile money :',
      'sw': 'Nambari ya pesa ya rununu:',
    },
    's6izsmq2': {
      'en': '+243',
      'fr': '+243',
      'sw': '+243',
    },
    'zkj2jcdp': {
      'en': '992457388',
      'fr': '992457388',
      'sw': '992457388',
    },
    'ute521ze': {
      'en': 'Add',
      'fr': 'Ajouter',
      'sw': 'Ongeza',
    },
  },
  // telecom_selector
  {
    'f3bu15h3': {
      'en': 'Select network',
      'fr': 'Sélectionnez réseau',
      'sw': 'Chagua mtandao',
    },
    'ahrk9kui': {
      'en': 'Airtel money',
      'fr': 'L\'argent d\'Airtel',
      'sw': 'Airtel money',
    },
    '6gtpes89': {
      'en': 'Airtel',
      'fr': 'Airtel',
      'sw': 'Airtel',
    },
    '1nxk651v': {
      'en': 'Mpesa',
      'fr': 'Mpesa',
      'sw': 'Mpesa',
    },
    '1cz39r2c': {
      'en': 'Vodacom',
      'fr': 'Vodacom',
      'sw': 'Vodacom',
    },
    'aqqyi7zj': {
      'en': 'Orange money',
      'fr': 'Argent orange',
      'sw': 'Pesa ya machungwa',
    },
    'mikpg9tk': {
      'en': 'Orange',
      'fr': 'Orange',
      'sw': 'Chungwa',
    },
  },
  // phone_payment_method_item
  {
    'dahr2van': {
      'en': '0823345678',
      'fr': '0823345678',
      'sw': '0823345678',
    },
    'j6rjiybj': {
      'en': 'Vodacom',
      'fr': 'Vodacom',
      'sw': 'Vodacom',
    },
  },
  // token_item
  {
    'yqcnl5yr': {
      'en': 'Ethereum',
      'fr': 'Ethereum',
      'sw': 'Ethereum',
    },
    'o1xrnt04': {
      'en': 'ETH BEP20',
      'fr': 'EPF BEP20',
      'sw': 'ETH BEP20',
    },
    '9xrvaw4d': {
      'en': '\$',
      'fr': '\$',
      'sw': '\$',
    },
    'zdn08gbt': {
      'en': '\$ 1734',
      'fr': '1734 \$',
      'sw': '\$ 1734',
    },
    'x6wbjhmi': {
      'en': '+10.34%',
      'fr': '+10,34%',
      'sw': '+10.34%',
    },
  },
  // receive_token
  {
    'bjys7lu3': {
      'en': 'Receive ',
      'fr': 'Recevoir',
      'sw': 'Pokea',
    },
    'd5ox0e1u': {
      'en': 'Copy or Scan your BSC wallet address to receive tokens',
      'fr':
          'Copiez ou scannez votre adresse de portefeuille BSC pour recevoir des jetons',
      'sw':
          'Nakili au Changanua anwani yako ya pochi ya BSC ili kupokea tokeni',
    },
    'lg2pfm1k': {
      'en': 'Send only binance BEP20 token to this address.',
      'fr': 'Envoyez uniquement le jeton binance BEP20 à cette adresse.',
      'sw': 'Tuma tokeni ya BEP20 pekee kwa anwani hii.',
    },
    'ip7tqqd4': {
      'en': '0x123ghxffkjsds',
      'fr': '0x123ghxffkjsds',
      'sw': '0x123ghxffkjsds',
    },
  },
  // loading_view
  {
    '1k1br4ry': {
      'en': 'Waiting for mobile money payment...',
      'fr': 'En attente de paiement mobile money...',
      'sw': 'Inasubiri malipo ya pesa kwa simu...',
    },
  },
  // nav_back_button
  {
    'dqz8qdg4': {
      'en': 'Confirm your code',
      'fr': 'Confirmez votre code',
      'sw': 'Thibitisha nambari yako ya kuthibitisha',
    },
  },
  // home_page_tab
  {
    '3k4uw7qb': {
      'en': 'Tokens',
      'fr': 'Jetons',
      'sw': 'Ishara',
    },
    'fx56ak9t': {
      'en': 'Transactions',
      'fr': 'Transactions',
      'sw': 'Shughuli',
    },
  },
  // home_page_balance
  {
    'nvsz7pmg': {
      'en': 'Balance',
      'fr': 'Équilibre',
      'sw': 'Mizani',
    },
    '82j6thjy': {
      'en': '\$0',
      'fr': '0 \$',
      'sw': '\$0',
    },
  },
  // buy_token_amount
  {
    'bvf6srr8': {
      'en': '\$',
      'fr': '\$',
      'sw': '\$',
    },
    '9sx28qt6': {
      'en': '0',
      'fr': '0',
      'sw': '0',
    },
    'ozwfhod8': {
      'en': 'USD',
      'fr': 'USD',
      'sw': 'USD',
    },
    'src5r0fb': {
      'en': '= ',
      'fr': '=',
      'sw': '=',
    },
    '59h7pq5s': {
      'en': '0.000345 ETH',
      'fr': '0,000345 ETH',
      'sw': '0.000345 ETH',
    },
  },
  // buy_token_next_button
  {
    '8ze2o2h0': {
      'en': 'Next',
      'fr': 'Suivant',
      'sw': 'Inayofuata',
    },
  },
  // transaction_item
  {
    'tfuogp09': {
      'en': '2022-09-08 1:52:35: PM',
      'fr': '2022-09-08 1:52:35 : PM',
      'sw': '2022-09-08 1:52:35: PM',
    },
    'nc374fp7': {
      'en': 'Received',
      'fr': 'Reçu',
      'sw': 'Imepokelewa',
    },
    'v3z6xy0x': {
      'en': 'Pending',
      'fr': 'En attente',
      'sw': 'Inasubiri',
    },
    'tf19m68r': {
      'en': '20 USDT',
      'fr': '20 USDT',
      'sw': '20 USDT',
    },
    'm0o9ogso': {
      'en': '\$19.20',
      'fr': '19,20 \$',
      'sw': '\$19.20',
    },
  },
  // transaction_details
  {
    'j4tcradb': {
      'en': 'Transaction Details',
      'fr': 'détails de la transaction',
      'sw': 'Maelezo ya Muamala',
    },
    'dzxvejah': {
      'en': 'Cancel',
      'fr': 'Continuer',
      'sw': 'Endelea',
    },
  },
  // transaction_summary
  {
    '6iv597d9': {
      'en': 'Transaction summary',
      'fr': '',
      'sw': '',
    },
    '0s3cbmii': {
      'en': 'Payment method',
      'fr': 'Mode de paiement',
      'sw': 'Njia ya malipo',
    },
    'pibxg7fm': {
      'en': 'MPesa',
      'fr': 'MPesa',
      'sw': 'MPesa',
    },
    '1vdr04oj': {
      'en': 'Mobile money number',
      'fr': 'Numéro d\'argent mobile',
      'sw': 'Nambari ya pesa ya rununu',
    },
    '9j45tc8b': {
      'en': '0971504436',
      'fr': '0971504436',
      'sw': '0971504436',
    },
    'enxf3cm7': {
      'en': 'You pay',
      'fr': 'Tu payes',
      'sw': 'Unalipa',
    },
    'plkzh84c': {
      'en': '\$100 USD',
      'fr': '100 USD',
      'sw': '\$100 USD',
    },
    'a4h035al': {
      'en': 'You receive',
      'fr': 'Vous recevez',
      'sw': 'Unapokea',
    },
    'hfvxl2pp': {
      'en': '100 USDT',
      'fr': '100 USDT',
      'sw': '100 USDT',
    },
    '9dx3sx8g': {
      'en': 'Transaction fees',
      'fr': 'Les frais de transaction',
      'sw': 'Ada za muamala',
    },
    '5qtg3guc': {
      'en': '\$0.05 USD',
      'fr': '0,05 USD',
      'sw': '\$0.05 USD',
    },
    '2caxy42a': {
      'en': 'Total',
      'fr': 'Total',
      'sw': 'Jumla',
    },
    'c3vla7vk': {
      'en': '\$100.05 USD',
      'fr': '100,05 USD',
      'sw': '\$100.05 USD',
    },
  },
  // payment_instructions
  {
    'oezsg2a1': {
      'en': 'Payment instructions',
      'fr': '',
      'sw': '',
    },
    '1k87empz': {
      'en':
          'To complete your transaction, send us your payment from 0971504436. Use the details below to make the transfer',
      'fr': 'pour',
      'sw': 'kwa',
    },
    '37hmzj2z': {
      'en': 'Amount to send',
      'fr': 'Pour payer, envoyez',
      'sw': 'Ili kulipa, tuma',
    },
    'vo2zw0yz': {
      'en': '\$97 USD',
      'fr': '97 USD',
      'sw': '\$97 USD',
    },
    'qg3l5g4e': {
      'en': 'Copy',
      'fr': '97 USD',
      'sw': '\$97 USD',
    },
    'z73au94g': {
      'en': 'To number',
      'fr': 'pour',
      'sw': 'kwa',
    },
    'tmqgie05': {
      'en': '0971504436',
      'fr': '97 USD',
      'sw': '\$97 USD',
    },
    'zwrxzhdy': {
      'en': 'Copy',
      'fr': '97 USD',
      'sw': '\$97 USD',
    },
  },
  // recipient_item
  {
    'ujt2c82q': {
      'en': 'Ntambwa Basambombo',
      'fr': 'Reçu',
      'sw': 'Imepokelewa',
    },
    'p77wquk7': {
      'en': 'Address: 0x473... aD4c18EF6C02721ae10Caac',
      'fr': 'Reçu',
      'sw': 'Imepokelewa',
    },
    '5emknfgo': {
      'en': 'Phone: +243992457388',
      'fr': 'En attente',
      'sw': 'Inasubiri',
    },
  },
  // user_kyc_auth
  {
    '5i509a64': {
      'en': 'Identification',
      'fr': 'Destinataire',
      'sw': 'Mpokeaji',
    },
    'kqqcxytd': {
      'en': 'Wallet address',
      'fr': 'Adresse du portefeuille',
      'sw': 'Anwani ya Wallet',
    },
    '9kqiexqa': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'cl040q0x': {
      'en': '0x473Adc04036b3c318aD4c18EF6C0',
      'fr': '0x473Adc04036b3c318aD4c18EF6C0',
      'sw': '0x473Adc04036b3c318aD4c18EF6C0',
    },
    'cgfnd95j': {
      'en': 'Full name',
      'fr': 'Nom et prénom',
      'sw': 'Jina kamili',
    },
    'aeqm7ule': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'cn24ee90': {
      'en': 'Aime Tshibangu',
      'fr': 'Aimé Tshibangu',
      'sw': 'Aime Tshibangu',
    },
    'ggn02brh': {
      'en': 'Mobile phone',
      'fr': 'Téléphone mobile',
      'sw': 'Simu ya rununu',
    },
    'i7eqmf9v': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    's0mgtq15': {
      'en': '+243992457388',
      'fr': '+243992457388',
      'sw': '+243992457388',
    },
    '0ir4unyl': {
      'en': 'Continue',
      'fr': 'Continuer',
      'sw': 'Endelea',
    },
    'a1pv11o6': {
      'en': 'Title',
      'fr': '',
      'sw': '',
    },
    'hmmb48dr': {
      'en': 'Subtitle',
      'fr': '',
      'sw': '',
    },
    '64ltmh5o': {
      'en': 'Title',
      'fr': '',
      'sw': '',
    },
    'rbhsubio': {
      'en': 'Subtitle',
      'fr': '',
      'sw': '',
    },
  },
  // Miscellaneous
  {
    'zw306lqi': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'q9u9tqyi': {
      'en': 'This app requires permissions to perfrom biometric verification',
      'fr':
          'Cette application nécessite des autorisations pour effectuer une vérification biométrique',
      'sw':
          'Programu hii inahitaji ruhusa ili kufanya uthibitishaji wa kibayometriki',
    },
    'ugyj2xsg': {
      'en':
          'This app requires permission to access the camera in order to scan for barcodes and QR codes. ',
      'fr':
          'Cette application nécessite l\'autorisation d\'accéder à l\'appareil photo afin de rechercher des codes-barres et des codes QR.',
      'sw':
          'Programu hii inahitaji ruhusa ya kufikia kamera ili kutafuta misimbo pau na misimbo ya QR.',
    },
    '2omacvwr': {
      'en':
          'This app requires permission to send you notifaction of transactions',
      'fr':
          'Cette application nécessite une autorisation pour vous envoyer une notification de transactions',
      'sw': 'Programu hii inahitaji ruhusa ili kukutumia arifa kuhusu miamala',
    },
    'kb6rg1sq': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'x1x358sb': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'a6pbpo2u': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    '9gcpl5km': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    '0iz4qc57': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'kuqkk3qm': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'awcta5oq': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'mc1x8gnf': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'kcfckjns': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'su7lw87l': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'dthuqgxo': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'qd0l4poc': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'j6ayuyt3': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'oxj5poih': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    '2uft3hac': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'x6pjn93j': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'tvqpu9bm': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'pwie20lw': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    'teupwrfn': {
      'en': '',
      'fr': '',
      'sw': '',
    },
    '7j3ri5xe': {
      'en': '',
      'fr': '',
      'sw': '',
    },
  },
].reduce((a, b) => a..addAll(b));
