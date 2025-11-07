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

  static List<String> languages() =>
      ['en', 'es', 'pt', 'zh_Hans', 'zh_Hant', 'ka', 'ar'];

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
    String? esText = '',
    String? ptText = '',
    String? zh_HansText = '',
    String? zh_HantText = '',
    String? kaText = '',
    String? arText = '',
  }) =>
      [
        enText,
        esText,
        ptText,
        zh_HansText,
        zh_HantText,
        kaText,
        arText
      ][languageIndex] ??
      '';

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
  // HomePage
  {
    'w2ipiy35': {
      'en': 'AI Photo',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'fwogqnrf': {
      'en': 'HD Image',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '82o03qes': {
      'en': 'Portrait',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'drfvywji': {
      'en': 'Landscape',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '81ng2kex': {
      'en': 'Abstract',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'abe7i6qs': {
      'en': 'Trending Now',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'e0opw6fh': {
      'en': 'See all',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5s5j1030': {
      'en': 'AI Portrait',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0gsj657g': {
      'en': 'Premium',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wy3wss2p': {
      'en': 'Digital Art',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xu8brx1x': {
      'en': 'Free',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'slhib54j': {
      'en': 'Fantasy',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'zxp0iih2': {
      'en': 'Premium',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xd5j8igd': {
      'en': 'Popular Templates',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'po4tp7nl': {
      'en': 'See all',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'usdrnjly': {
      'en': 'Modern Poster',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ge2gw1i7': {
      'en': 'Business',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'yxx06ge9': {
      'en': 'Social Media',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'mqvpnjn7': {
      'en': 'Marketing',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'gfkf2xnt': {
      'en': 'Brand Kit',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wk2mgccl': {
      'en': 'Corporate',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'dodzj8r3': {
      'en': 'Creative Flow',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'e8hlr0my': {
      'en': 'Artistic',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'r9dkojz7': {
      'en': 'AI Tools',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'exnks28t': {
      'en': 'See all',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ld93g39t': {
      'en': 'AI Enhance',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'r6bnfo1l': {
      'en': 'Color Magic',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3rxqvear': {
      'en': 'Smart Crop',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'al7he1ju': {
      'en': 'Background',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'fqb26x3k': {
      'en': 'Advertisement',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // AiToolsPage
  {
    '0nslwv2g': {
      'en': 'Advertisement Banner Placeholder',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // MinePage
  {
    'zuaf0ccc': {
      'en': 'Start Creating Now',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'htp44ila': {
      'en':
          'Start experiencing the features and unleash your creativity with our powerful tools',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3yon2sc3': {
      'en': 'Start Creating',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // SettingsPage
  {
    '2ku26grr': {
      'en': 'Unlimited Artwork Styles',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'aj57y5yc': {
      'en': 'Try Pro Now',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ti0t6ea5': {
      'en': 'Share',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'm63qd1kb': {
      'en': 'Feedback',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'yisudlng': {
      'en': 'Language',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'hdlumuya': {
      'en': 'Privacy Policy',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'f315orz1': {
      'en': 'Terms of Service',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ndye3g0i': {
      'en': 'About',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'pxr21hwj': {
      'en': 'Settings',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // TrendingPage
  {
    'u3hyuuf7': {
      'en': 'Urban Style',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '59hs3tdi': {
      'en': 'Hot this week',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'iivw6v91': {
      'en': '89 items',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5vi1c4cs': {
      'en': 'Vintage Look',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'jq9v9xeh': {
      'en': 'Classic choice',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '61ohn77n': {
      'en': '67 items',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0qd5qt8h': {
      'en': 'Minimalist',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7c9fljb4': {
      'en': 'Clean & simple',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'vlrvoy0f': {
      'en': '156 items',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3evaeyp0': {
      'en': 'Boho Chic',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'oi6tjz8h': {
      'en': 'Free spirit',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'qyibxayt': {
      'en': '93 items',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'sw21311e': {
      'en': 'Business Formal',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '4u684846': {
      'en': 'Professional',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'vaw1ipjl': {
      'en': '78 items',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'om74lbzl': {
      'en': 'Trending',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // ToolDetailPage
  {
    'jj9d9bd2': {
      'en': 'Add your face to swap',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '56axo3fw': {
      'en': 'Swap Face',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'aix5m0s2': {
      'en': 'Watch Ad',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'epa9hu9f': {
      'en': 'Ghostface',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9qk7wdeh': {
      'en': 'Remove Ad',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // ProPage
  {
    '56toelc5': {
      'en': 'Unlimited access to premium content',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '00e6jeeb': {
      'en': 'Ad-free experience across all platforms',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'vwfomz7s': {
      'en': 'Priority customer support 24/7',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '94qjkx4u': {
      'en': 'Exclusive member-only features',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'bmlm03s6': {
      'en': 'POPULAR',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'rx5a2kg4': {
      'en': 'Premium',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '8a7w742a': {
      'en': '\$19.99',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'd5v54qq8': {
      'en': 'per month',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'zyhpmtv7': {
      'en': 'Best value for families',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    't4uf8y1s': {
      'en': 'Enterprise',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xn0h5dbz': {
      'en': '\$49.99',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'k79znrld': {
      'en': 'per month',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ubse7t0f': {
      'en': 'For large organizations',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ga3b8w5e': {
      'en': 'Continue',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ap0vvd6m': {
      'en': 'User Agreement',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'w8rmxxha': {
      'en': '•',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'o06wy94r': {
      'en': 'Privacy Policy',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // HDPage
  {
    'y00dj2sv': {
      'en': 'Add Your Photo',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5rkd0nbk': {
      'en': 'Photos',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ndxpxumu': {
      'en': 'Camera',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'nhw146iq': {
      'en': 'Demo',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xnwsn7eu': {
      'en': 'Demo',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7fnnvmnu': {
      'en': 'HD Image',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // MainAppBar
  {
    '7i3b0tbz': {
      'en': 'PRO',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // BottomNavBar
  {
    'sxs2lkr8': {
      'en': 'Home',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'i29ifwew': {
      'en': 'AI Tools',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'qley5tls': {
      'en': 'Mine',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // AiToolCard
  {
    'zjpify3s': {
      'en': 'Improve Photo Quality',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // StyleCard
  {
    'vcebb9mq': {
      'en': 'Cartoonify Yourself',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // CategorySection
  {
    'penlenlb': {
      'en': 'Trending',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kekfyhni': {
      'en': 'See All',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7xtqp3rx': {
      'en': 'Summer Vibes',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '8wwwyxsy': {
      'en': 'Casual & Trendy',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '8k3e0cfa': {
      'en': 'Urban Style',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '975c3b46': {
      'en': 'Street Fashion',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'rglv0s5x': {
      'en': 'Business Chic',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'zsetx7zl': {
      'en': 'Professional Look',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // SettingsItem
  {
    'yejuazzb': {
      'en': 'Share',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // SubscriptionPlanCard
  {
    'xojcppmr': {
      'en': '1 Year',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '51q9sdn1': {
      'en': 'đ944,000',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3takc0ny': {
      'en': 'đ18,153.85 / Week',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // SimpleAppBar
  {
    'ayliupf2': {
      'en': 'Page Title',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // AiToolCard2
  {
    'i402lyc6': {
      'en': 'Improve Photo Quality',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // AiToolCard3
  {
    'kngxo16l': {
      'en': 'Improve Photo Quality',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // AiToolCard4
  {
    'bupg5b82': {
      'en': 'Improve Photo Quality',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // AiToolCard5
  {
    '3zwlurnv': {
      'en': 'Improve Photo Quality',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // Miscellaneous
  {
    'cujfp8aw': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'jf37eh75': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ncpcci3q': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '2xxjb9si': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ry9kwtij': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xi1a09z5': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'g3acdgu5': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'nlcrurx0': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '80ne1mot': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'tcsui6c9': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '8rvm2c0s': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'bp4p0y6o': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'gsp9zb7m': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'um7kg3gm': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5r6qss2n': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    've16ukhy': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'oygmq4r7': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'bncr570w': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'c6g03k9y': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'edqosyo3': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'l2espmxw': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'amwc15sb': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7yhazwva': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wcxs8si3': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ej6sse7q': {
      'en': '',
      'ar': '',
      'es': '',
      'ka': '',
      'pt': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
].reduce((a, b) => a..addAll(b));
