import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'id'];

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
    String? arText = '',
    String? idText = '',
  }) =>
      [enText, arText, idText][languageIndex] ?? '';

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
  // HomePage
  {
    '99wovnbe': {
      'en': 'Sign In With Steam',
      'ar': '',
      'id': '',
    },
    'sftupl0v': {
      'en': 'Sell your CS2 skins',
      'ar': '',
      'id': '',
    },
    '435oum9d': {
      'en':
          'Get a fair price for your items. Secure trades without the hassle.',
      'ar': '',
      'id': '',
    },
    'g0k898nu': {
      'en': 'Login In With Steam',
      'ar': '',
      'id': '',
    },
    'wkw1occ7': {
      'en': 'Secure Payment\nthrough Adyen',
      'ar': '',
      'id': '',
    },
    'iidlb6yb': {
      'en': 'Fast Online Support\nWe\'re here to help',
      'ar': '',
      'id': '',
    },
    'bu2mhieh': {
      'en': 'Transparent\n0% buyer fees',
      'ar': '',
      'id': '',
    },
    't49pbjlb': {
      'en': 'Fast Payment\nWithdraw funds using muliple options',
      'ar': '',
      'id': '',
    },
    'oecb90o3': {
      'en': 'Trade Anywhere With\n Mobile App',
      'ar': '',
      'id': '',
    },
    'rjpl67gd': {
      'en': 'Learn More',
      'ar': '',
      'id': '',
    },
    '7ovzs178': {
      'en': 'Popular CS2 skins',
      'ar': '',
      'id': '',
    },
    '1site4hy': {
      'en': 'Home',
      'ar': '',
      'id': '',
    },
  },
  // Miscellaneous
  {
    '3p00xm8b': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'q2dfjr4t': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'u0qzsva9': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'i7p4m5u0': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'a038yqzu': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'pcmj1gqd': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'endb6whz': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'a4yyx53j': {
      'en': '',
      'ar': '',
      'id': '',
    },
    '6vlmtjtb': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'zw6qmo6r': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'ulldhr14': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'sxk34z8x': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'fqgy062d': {
      'en': '',
      'ar': '',
      'id': '',
    },
    '9xelrdfk': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'ftjy0fut': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'oinga3jg': {
      'en': '',
      'ar': '',
      'id': '',
    },
    '1n8gznsj': {
      'en': '',
      'ar': '',
      'id': '',
    },
    '67b0g8oc': {
      'en': '',
      'ar': '',
      'id': '',
    },
    '0duyygo2': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'u7k1d8ny': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'bhnfexbe': {
      'en': '',
      'ar': '',
      'id': '',
    },
    '4672akvk': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'dt7nc98o': {
      'en': '',
      'ar': '',
      'id': '',
    },
    '6jp21z79': {
      'en': '',
      'ar': '',
      'id': '',
    },
    'osczkiws': {
      'en': '',
      'ar': '',
      'id': '',
    },
  },
].reduce((a, b) => a..addAll(b));
