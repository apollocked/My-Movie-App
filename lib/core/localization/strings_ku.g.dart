///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsKu extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsKu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ku,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ku>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsKu _root = this; // ignore: unused_field

	@override 
	TranslationsKu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKu(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$home$ku home = _Translations$home$ku._(_root);
	@override late final _Translations$search$ku search = _Translations$search$ku._(_root);
	@override late final _Translations$profile$ku profile = _Translations$profile$ku._(_root);
	@override late final _Translations$settings$ku settings = _Translations$settings$ku._(_root);
	@override late final _Translations$privacy$ku privacy = _Translations$privacy$ku._(_root);
	@override late final _Translations$auth$ku auth = _Translations$auth$ku._(_root);
	@override late final _Translations$onboarding$ku onboarding = _Translations$onboarding$ku._(_root);
	@override late final _Translations$guest_features$ku guest_features = _Translations$guest_features$ku._(_root);
	@override late final _Translations$movie_detail$ku movie_detail = _Translations$movie_detail$ku._(_root);
	@override late final _Translations$actor$ku actor = _Translations$actor$ku._(_root);
	@override late final _Translations$director$ku director = _Translations$director$ku._(_root);
	@override late final _Translations$tv$ku tv = _Translations$tv$ku._(_root);
	@override late final _Translations$common$ku common = _Translations$common$ku._(_root);
	@override late final _Translations$genres$ku genres = _Translations$genres$ku._(_root);
	@override late final _Translations$genres_tv$ku genres_tv = _Translations$genres_tv$ku._(_root);
	@override late final _Translations$errors$ku errors = _Translations$errors$ku._(_root);
	@override late final _Translations$connectivity$ku connectivity = _Translations$connectivity$ku._(_root);
	@override late final _Translations$not_found$ku not_found = _Translations$not_found$ku._(_root);
	@override late final _Translations$what_to_watch_dialog$ku what_to_watch_dialog = _Translations$what_to_watch_dialog$ku._(_root);
	@override late final _Translations$swipe$ku swipe = _Translations$swipe$ku._(_root);
}

// Path: home
class _Translations$home$ku extends Translations$home$en {
	_Translations$home$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get trending => 'ئێستا باوە';
	@override String get top_rated => 'فیلمە خاوەن بەرزترین نمرەکان';
	@override String get now_playing => 'ئێستا پەخش دەکرێت';
	@override String get popular => 'بەناوبانگ';
	@override String get upcoming => 'بەم زووانە';
	@override String get action => 'ئەکشن و هەستبزوێن';
	@override String get sci_fi => 'خەیاڵی زانستی';
	@override String get horror => 'ترسناک و دڵەڕاوکێ';
	@override String get drama => 'دراما';
	@override String get comedy => 'کۆمیدی';
	@override String get romance => 'ڕۆمانسی';
	@override String get thriller => 'هەستبزوێن';
	@override String get animation => 'ئەنیمەیشن';
	@override String get mystery => 'نهێنی';
}

// Path: search
class _Translations$search$ku extends Translations$search$en {
	_Translations$search$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get explore => 'دۆزینەوە';
	@override String get explore_caps => 'دۆزینەوە';
	@override String get hint => 'بگەڕێ بۆ فیلمەکان...';
	@override String get no_results => 'هیچ ئەنجامێک نەدۆزرایەوە.';
	@override late final _Translations$search$filters$ku filters = _Translations$search$filters$ku._(_root);
	@override String get no_results_subtitle => 'هەوڵی گەڕان بدە بۆ شتێکی تر';
	@override String get discover_title => 'فیلمەکان بدۆزەرەوە';
	@override String get discover_subtitle => 'دەست بکە بە نووسین بۆ گەڕان لە ملیۆنان فیلم و زنجیرە';
	@override String get recent_searches => 'گەڕانەکانی پێشوو';
	@override String get clear => 'سڕینەوە';
	@override String get browse_categories => 'گەڕان بەپێی پۆلەکان';
	@override String get browse_all => 'گەڕان بە هەمووی';
	@override String get top_rated_badge => 'بەرزترین نمرە';
	@override String get browse => 'گەڕان';
}

// Path: profile
class _Translations$profile$ku extends Translations$profile$en {
	_Translations$profile$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'پڕۆفایل';
	@override String get my_activity => 'چالاکییەکانم';
	@override String get watch_later => 'سەیرکردنی دواتر';
	@override String get favorites => 'دڵخوازەکانم';
	@override String get my_favorites => 'دڵخوازەکانم';
	@override String get ratings => 'هەڵسەنگاندنەکانم';
	@override String get my_ratings => 'هەڵسەنگاندنەکانم';
	@override String get account => 'هەژمار';
	@override String get logout => 'چوونەدەرەوە';
	@override String get logout_confirm => 'دڵنیای لە چوونەدەرەوە؟';
	@override String get default_name => 'خۆشەویستی فیلم';
}

// Path: settings
class _Translations$settings$ku extends Translations$settings$en {
	_Translations$settings$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'ڕێکخستن';
	@override String get language => 'زمان';
	@override String get dark_mode => 'دۆخی تاریک';
	@override String get lang_en => 'ئینگلیزی';
	@override String get lang_ku => 'کوردی';
	@override String get lang_ar => 'عەرەبی';
	@override String get privacy_policy => 'سیاسەی تایبەتی';
	@override String get legal => 'یاسایی';
	@override String get support => 'پاڵپشتی';
	@override String get contact_us => 'پەیوەندیمان پێوە بکە';
	@override String get email => 'mahamadbarznji712@gmail.com';
}

// Path: privacy
class _Translations$privacy$ku extends Translations$privacy$en {
	_Translations$privacy$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'سیاسەی تایبەتی';
	@override String get last_updated => 'دوایین نوێکردنەوە: حوزەیرانی 26, 2026';
	@override String get introduction => 'My Movies ڕێزی لە تایبەتی تۆ دەگرێت. ئەم سیاسەتە ڕوون دەکاتەوە کە چۆن زانیارییەکانی تۆ کۆدەکەینەوە، بەکاری دەهێنین، و پاراستنی دەکەین.';
	@override String get info_collect_title => 'زانیارییەکانی کۆی دەکەینەوە';
	@override String get info_collect => 'ئێمە کەمترین زانیاری پێویست کۆدەکەینەوە بۆ دابینکردنی خزمەتگوزارییەکانمان. ئەمە ڕەنگە ئیمەیڵەکەت لەخۆبگرێت ئەگەر هەژمارێک دروست بکەیت، و زانیاری بەکارهێنانی سادە وەک ئەو فیلمانەی کە دەیپارێزیت بۆ دواتر یان دڵخوازەکانت. ئێمە زانیاری تایبەتی هەستیار کۆناکەینەوە.';
	@override String get how_use_title => 'چۆن زانیارییەکانی تۆ بەکار دەهێنین';
	@override String get how_use => 'زانیارییەکانی تۆ تەنها بۆ تایبەتکردنی ئەزموونەکەت، پاراستنی هەڵبژاردنەکانت، و دابینکردنی بنەڕەتی کارەکانی ئەپەکە بەکار دەهێنرێت. ئێمە زانیارییەکانی تۆ بە لایەنی سێیەم نافرۆشین.';
	@override String get data_security_title => 'پاراستنی زانیاری';
	@override String get data_security => 'ئێمە پێوانەکانی ئاسایشی پیشەسازی جێبەجێ دەکەین بۆ پاراستنی زانیارییەکانت. بەڵام هیچ ڕێگەیەکی هەڵگرتنی ئەلیکترۆنی 100%% پارێزراو نییە.';
	@override String get contact_title => 'پەیوەندیمان پێوە بکە';
	@override String get contact => 'ئەگەر پرسیارت هەیە دەربارەی ئەم سیاسەتە، تکایە پەیوەندیمان پێوە بکە لە support@mymovies.app';
}

// Path: auth
class _Translations$auth$ku extends Translations$auth$en {
	_Translations$auth$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get login => 'چوونەژوورەوە';
	@override String get signup => 'ناونووسین';
	@override String get create_account => 'دروستکردنی هەژمار';
	@override String get welcome_back => 'بەخێربێیتەوە';
	@override String get login_subtitle => 'بچۆ ناو هەژمارەکەت';
	@override String get join_community => 'ببە بە ئەندام';
	@override String get join_subtitle => 'بچۆ ژوورەوە بۆ دەستگەیشتن بە هەموو تایبەتمەندییەکانی My Movies.';
	@override String get email => 'ئیمەیڵ';
	@override String get email_hint => 'ئیمەیڵەکەت بنووسە';
	@override String get password => 'وشەی نهێنی';
	@override String get password_hint => 'وشەی نهێنییەکەت بنووسە';
	@override String get confirm_password => 'وشەی نهێنی پشتڕاست بکەرەوە';
	@override String get confirm_password_hint => 'وشەی نهێنی دووبارە بنووسەوە';
	@override String get no_account => 'هەژمارت نییە؟ ';
	@override String get already_account => 'پێشتر هەژمارت دروست کردووە؟ ';
	@override String get join_us_subtitle => 'بەشداربە بۆ نمرەدان و پاراستنی فیلمەکان';
	@override String get onboarding_subtitle => 'بەدوای ملیۆنان فیلمدا بگەڕێ، لیستی تایبەت بەخۆت دروست بکە، و بە ئاسانی نمرە بە فیلمە دڵخوازەکانت بدە.';
	@override String get get_started => 'دەستپێبکە';
	@override String get continue_guest => 'بەردەوامبە وەک میوان';
	@override String get login_required_desc => 'تکایە بچۆ ژوورەوە بۆ بینینی لیستەکانت';
	@override String get welcome_title => 'بەخێربێیت بۆ My Movies';
	@override String get onboarding_settings => 'ئەزموونەکەت بگونجێنە';
	@override late final _Translations$auth$errors$ku errors = _Translations$auth$errors$ku._(_root);
	@override late final _Translations$auth$guest$ku guest = _Translations$auth$guest$ku._(_root);
	@override String get reset_password => 'ڕێستکردنی وشەی نهێنی';
	@override String get reset_subtitle => 'ئیمەیڵەکەت بنووسە بۆ ناردنی لینکی ڕێستکردنی وشەی نهێنی.';
	@override String get send_reset_link => 'ناردنی لینکی ڕێستکردن';
	@override String get reset_sent => 'لینکی ڕێستکردن نێردرا! ئیمەیڵەکەت بپشکنە.';
	@override String get back_to_login => 'گەڕانەوە بۆ چوونەژوورەوە';
}

// Path: onboarding
class _Translations$onboarding$ku extends Translations$onboarding$en {
	_Translations$onboarding$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'بەدوای ملیۆنان فیلمدا بگەڕێ، لیستی تایبەت بەخۆت دروست بکە، و بە ئاسانی نمرە بە فیلمە دڵخوازەکانت بدە.';
	@override late final _Translations$onboarding$features$ku features = _Translations$onboarding$features$ku._(_root);
	@override late final _Translations$onboarding$tooltips$ku tooltips = _Translations$onboarding$tooltips$ku._(_root);
}

// Path: guest_features
class _Translations$guest_features$ku extends Translations$guest_features$en {
	_Translations$guest_features$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$guest_features$favorites$ku favorites = _Translations$guest_features$favorites$ku._(_root);
	@override late final _Translations$guest_features$rate$ku rate = _Translations$guest_features$rate$ku._(_root);
	@override late final _Translations$guest_features$watch_later$ku watch_later = _Translations$guest_features$watch_later$ku._(_root);
	@override late final _Translations$guest_features$sync$ku sync = _Translations$guest_features$sync$ku._(_root);
}

// Path: movie_detail
class _Translations$movie_detail$ku extends Translations$movie_detail$en {
	_Translations$movie_detail$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get overview => 'کورتە';
	@override String get watch_later => 'سەیرکردنی دواتر';
	@override String get saved => 'پاشەکەوتکرا';
	@override String get rate_movie => 'نمرە بدە بە فیلمەکە';
	@override String get added_to_favorites => 'بۆ دڵخوازەکان زیادکرا';
	@override String get removed_from_favorites => 'لە دڵخوازەکان سڕایەوە';
	@override String get saved_rating => 'نمرەکە پاشەکەوتکرا: ';
	@override late final _Translations$movie_detail$prompts$ku prompts = _Translations$movie_detail$prompts$ku._(_root);
	@override late final _Translations$movie_detail$actions$ku actions = _Translations$movie_detail$actions$ku._(_root);
	@override String get play_trailer => 'پەخشکردنی ترەیلەر';
	@override String get watch_trailer => 'سەیرکردنی ترەیلەر';
	@override String get on_youtube => 'لە یوتیوب';
	@override String get favorite => 'دڵخواز';
	@override String get watch => 'سەیرکە';
	@override String get release_today => 'ئەمڕۆ';
	@override String get release_1_day => '١ ڕۆژ';
	@override String get release_days => 'ڕۆژ';
	@override String get added_to_watch_later => 'بۆ سەیرکردنی دواتر زیادکرا';
	@override String get director => 'دەرهێنەر';
	@override String get cast => 'ئەکتەرەکان';
	@override String get you_might_also_like => 'لەوانەیە ئەمانەشت بەدڵ بێت';
}

// Path: actor
class _Translations$actor$ku extends Translations$actor$en {
	_Translations$actor$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get born => 'لەدایکبوون:';
	@override String get biography => 'ژیاننامە';
	@override String get filmography => 'فیلمۆگرافی';
}

// Path: director
class _Translations$director$ku extends Translations$director$en {
	_Translations$director$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get born => 'لەدایکبوون:';
	@override String get biography => 'ژیاننامە';
	@override String get filmography => 'فیلمۆگرافی';
}

// Path: tv
class _Translations$tv$ku extends Translations$tv$en {
	_Translations$tv$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get popular => 'زنجیرە بەناوبانگەکان';
	@override String get top_rated => 'زنجیرە خاوەن بەرزترین نمرەکان';
	@override String get airing_today => 'ئەمڕۆ پەخش دەکرێت';
	@override String get on_the_air => 'ئێستا پەخش دەکرێت';
	@override String get action => 'زنجیرەی ئەکشن';
	@override String get comedy => 'زنجیرەی کۆمیدی';
	@override String get drama => 'زنجیرەی دراما';
	@override String get sci_fi_fantasy => 'خەیاڵی زانستی و فەنتازیا';
	@override String get mystery => 'زنجیرەی نهێنی';
	@override String get animation => 'زنجیرەی ئەنیمەیشن';
	@override String get reality => 'زنجیرەی ڕاستەقینە';
	@override String get horror => 'زنجیرەی ترسناک';
}

// Path: common
class _Translations$common$ku extends Translations$common$en {
	_Translations$common$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'هەڵوەشاندنەوە';
	@override String get submit => 'نمرەکە بنێرە';
	@override String get cinema => 'سینەما';
	@override String get app_name => 'My Movies';
	@override String get empty_list => 'لیستەکەت لە ئێستادا بەتاڵە';
	@override String get cine_stream => 'My Movies';
	@override String get retry => 'دووبارە هەوڵبدەرەوە';
	@override String get error_title => 'هەڵەیەک ڕوویدا';
	@override String get see_all => 'هەمووی ببینە';
	@override String get back_to_browse => 'گەڕانەوە بۆ گەڕان';
	@override String get collection => 'کۆمەڵە';
	@override String get my_movie => 'My Movies';
}

// Path: genres
class _Translations$genres$ku extends Translations$genres$en {
	_Translations$genres$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get g_28 => 'ئەکشن';
	@override String get g_12 => 'سەرگەرمی';
	@override String get g_16 => 'ئەنیمەیشن';
	@override String get g_35 => 'کۆمیدی';
	@override String get g_80 => 'تاوان';
	@override String get g_99 => 'دۆکیومێنتەری';
	@override String get g_18 => 'دراما';
	@override String get g_10751 => 'خێزانی';
	@override String get g_14 => 'فەنتازیا';
	@override String get g_36 => 'مێژوویی';
	@override String get g_27 => 'ترسناک';
	@override String get g_10402 => 'موزیک';
	@override String get g_9648 => 'نهێنی';
	@override String get g_10749 => 'ڕۆمانسی';
	@override String get g_878 => 'خەیاڵی زانستی';
	@override String get g_10770 => 'فیلمی تەلەفزیۆنی';
	@override String get g_53 => 'هەستبزوێن';
	@override String get g_10752 => 'جەنگ';
	@override String get g_37 => 'ڕۆژئاوایی';
}

// Path: genres_tv
class _Translations$genres_tv$ku extends Translations$genres_tv$en {
	_Translations$genres_tv$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get g_10759 => 'ئەکشن و سەرگەرمی';
	@override String get g_10762 => 'منداڵان';
	@override String get g_10763 => 'هەواڵ';
	@override String get g_10764 => 'ڕاستەقینە';
	@override String get g_10765 => 'خەیاڵی زانستی و فەنتازیا';
	@override String get g_10766 => 'زنجیرەی ڕۆژانە';
	@override String get g_10767 => 'وتووێژ';
	@override String get g_10768 => 'جەنگ و سیاسەت';
}

// Path: errors
class _Translations$errors$ku extends Translations$errors$en {
	_Translations$errors$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get search_failed => 'گەڕان سەرکەوتوو نەبوو. تکایە دووبارە هەوڵبدەرەوە.';
	@override String get search_tv_failed => 'گەڕانی زنجیرەکان سەرکەوتوو نەبوو. تکایە دووبارە هەوڵبدەرەوە.';
	@override String get load_failed => 'بارکردنی ناوەڕۆک سەرکەوتوو نەبوو.';
	@override String get network_timeout => 'کاتی تۆڕ تەواو بوو. تکایە پەیوەندییەکەت بپشکنە.';
	@override String get server_error => 'هەڵەی ڕاژەکار. تکایە دووبارە هەوڵبدەرەوە.';
	@override String get network_error => 'هەڵەیەکی چاوەڕواننەکراوی تۆڕ.';
	@override String get request_failed => 'داواکاری سەرکەوتوو نەبوو.';
	@override String get sign_up_failed => 'ناونووسین سەرکەوتوو نەبوو.';
	@override String get auth_failed => 'چوونەژوورەوە سەرکەوتوو نەبوو.';
}

// Path: connectivity
class _Translations$connectivity$ku extends Translations$connectivity$en {
	_Translations$connectivity$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'پەیوەندیدانی ئەنتەرنێت نییە';
	@override String get description => 'تکایە پەیوەندی ئەنتەرنێتت بسەرببە و دوبارە هەوڵبدەرەوە. تطبيق My Movies پێویست بە پەیوەندی کاراکێی ئەنتەرنێتی هەیە بۆ کارکردن بە شێوەیەکی ڕاست.';
	@override String get troubleshooting_title => 'ڕاهێنان بۆ چارەسەرکردنی کێشه:';
	@override late final _Translations$connectivity$tips$ku tips = _Translations$connectivity$tips$ku._(_root);
	@override String get check_connection => 'پەیوەندیدان دابین دەکرێت...';
	@override String get retry => 'دووبارە هەوڵبدەرەوە';
	@override String get offline_banner => 'تۆ بە ئۆفلاینیت — هەندێک خزمەتگوزاری سنووردارن';
	@override String get browse_watch_later => 'بگەڕێ بۆ دواتر سەیرکردن';
}

// Path: not_found
class _Translations$not_found$ku extends Translations$not_found$en {
	_Translations$not_found$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'پەڕەکە نەدۆزرایەوە';
	@override String get title_404 => '404 - پەڕەکە نەدۆزرایەوە';
	@override String get subtitle => 'ئەو پەڕەیەی بەدوایدا دەگەڕێیت بوونی نییە یان گواستراوەتەوە.';
	@override String get return_home => 'بگەڕێوە بۆ سەرەتا';
}

// Path: what_to_watch_dialog
class _Translations$what_to_watch_dialog$ku extends Translations$what_to_watch_dialog$en {
	_Translations$what_to_watch_dialog$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'بەخێربێیت بۆ چی سەیر بکەم';
	@override String get step1_title => 'ڕێکخستنەکانت دیاری بکە';
	@override String get step1_desc => 'جۆر، مەودای نمرە، ساڵی بڵاوکردنەوە، و ڕێکخستنی ڕیزکردن هەڵبژێرە بۆ دۆزینەوەی ئەوەی کە حەزت پێیەتی.';
	@override String get step2_title => 'بەناو فیلمەکاندا سوایپ بکە';
	@override String get step2_desc => 'بە ڕاستدا سوایپ بکە بۆ پاشەکەوتکردنی فیلم یان بە چەپدا بۆ پەڕاندنی. لەسەر کارتەکە بدا بۆ وردەکاری.';
	@override String get step3_title => 'سەیرکردنی دواتر';
	@override String get step3_desc => 'هەموو فیلمە پاشەکەوتکراوەکان لە پڕۆفایلەکەتدا دەردەکەون لەژێر سەیرکردنی دواتر.';
	@override String get got_it => 'باشە!';
}

// Path: swipe
class _Translations$swipe$ku extends Translations$swipe$en {
	_Translations$swipe$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'چی سەیر بکەم';
	@override String get save_label => 'پاشەکەوتکردن';
	@override String get skip_label => 'پەڕاندن';
	@override String get nope_label => 'نەخێر';
	@override String get watch_later_label => 'سەیرکردنی دواتر';
	@override String get hint => 'بۆ پاشەکەوتکردن بە ڕاستدا سوایپ بکە';
	@override String get error_title => 'هەڵەیەک ڕوویدا';
	@override String get retry => 'دووبارە هەوڵبدەرەوە';
	@override String get empty_no_movies => 'هیچ فیلمێک نەدۆزرایەوە. فیلتەری جیاواز تاقی بکەرەوە.';
	@override String get change_filters => 'فیلتەرەکان بگۆڕە';
	@override String get all_caught_up => 'هەموو فیلمەکانت بینی!';
	@override String get no_movies_added => 'هیچ فیلمێک بۆ سەیرکردنی دواتر زیاد نەکرا.';
	@override String get movie_added => 'فیلم بۆ سەیرکردنی دواتر زیادکرا!';
	@override String get movies_added => 'فیلم بۆ سەیرکردنی دواتر زیادکران!';
	@override String get view_watch_later => 'سەیرکردنی دواتر ببینە';
	@override String get skip => 'پەڕاندن';
	@override String get save => 'پاشەکەوتکردن';
	@override String get genres => 'جۆرەکان';
	@override String get selected => 'هەڵبژێردرا';
	@override String get select_genres => 'جۆرەکان هەڵبژێرە';
	@override String get minimum_rating => 'کەمترین نمرە';
	@override String get release_year => 'ساڵی بڵاوکردنەوە';
	@override String get sort_by => 'ڕێکخستن بەپێی';
	@override String get shuffle => 'هەڕەمەکی کردن';
	@override String get start_swiping => ' دەستپێبکە بە سوایپکردن';
	@override String get year_from => 'لە';
	@override String get year_to => 'بۆ';
	@override String get year_any => 'هەر';
	@override late final _Translations$swipe$sort_options$ku sort_options = _Translations$swipe$sort_options$ku._(_root);
}

// Path: search.filters
class _Translations$search$filters$ku extends Translations$search$filters$en {
	_Translations$search$filters$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get all => 'هەمووی';
	@override String get movies => 'فیلمەکان';
	@override String get tv_shows => 'زنجیرەکان';
	@override String get actors => 'ئەکتەرەکان';
}

// Path: auth.errors
class _Translations$auth$errors$ku extends Translations$auth$errors$en {
	_Translations$auth$errors$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get email_required => 'ئیمەیڵ پێویستە';
	@override String get invalid_email => 'ئیمەیڵێکی دروست بنووسە';
	@override String get password_required => 'وشەی نهێنی پێویستە';
	@override String get password_too_short => 'وشەی نهێنی دەبێت کەمتر نەبێت لە ٦ پیت';
	@override String get confirm_password_required => 'تکایە وشەی نهێنی پشتڕاست بکەرەوە';
	@override String get passwords_dont_match => 'وشە نهێنییەکان وەک یەک نین';
}

// Path: auth.guest
class _Translations$auth$guest$ku extends Translations$auth$guest$en {
	_Translations$auth$guest$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get kContinue => 'بەردەوامبە وەک میوان';
	@override String get get_started => 'دەستپێبکە / چوونەژوورەوە';
}

// Path: onboarding.features
class _Translations$onboarding$features$ku extends Translations$onboarding$features$en {
	_Translations$onboarding$features$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$features$browse$ku browse = _Translations$onboarding$features$browse$ku._(_root);
	@override late final _Translations$onboarding$features$recommend$ku recommend = _Translations$onboarding$features$recommend$ku._(_root);
	@override late final _Translations$onboarding$features$favorites$ku favorites = _Translations$onboarding$features$favorites$ku._(_root);
	@override late final _Translations$onboarding$features$watch_later$ku watch_later = _Translations$onboarding$features$watch_later$ku._(_root);
}

// Path: onboarding.tooltips
class _Translations$onboarding$tooltips$ku extends Translations$onboarding$tooltips$en {
	_Translations$onboarding$tooltips$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$tooltips$browse$ku browse = _Translations$onboarding$tooltips$browse$ku._(_root);
	@override late final _Translations$onboarding$tooltips$recommend$ku recommend = _Translations$onboarding$tooltips$recommend$ku._(_root);
	@override late final _Translations$onboarding$tooltips$search$ku search = _Translations$onboarding$tooltips$search$ku._(_root);
	@override late final _Translations$onboarding$tooltips$settings$ku settings = _Translations$onboarding$tooltips$settings$ku._(_root);
	@override late final _Translations$onboarding$tooltips$profile$ku profile = _Translations$onboarding$tooltips$profile$ku._(_root);
}

// Path: guest_features.favorites
class _Translations$guest_features$favorites$ku extends Translations$guest_features$favorites$en {
	_Translations$guest_features$favorites$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'دڵخوازەکان ڕێکبخە';
	@override String get desc => 'ئەو فیلمانەی حەزت لێیەتی بپارێزە.';
}

// Path: guest_features.rate
class _Translations$guest_features$rate$ku extends Translations$guest_features$rate$en {
	_Translations$guest_features$rate$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'نمرە بدە و ڕا دەرببڕە';
	@override String get desc => 'بۆچوونی خۆت بڵاو بکەرەوە.';
}

// Path: guest_features.watch_later
class _Translations$guest_features$watch_later$ku extends Translations$guest_features$watch_later$en {
	_Translations$guest_features$watch_later$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'سەیرکردنی دواتر';
	@override String get desc => 'هەرگیز ئەو فیلمانە مەدۆڕێنە کە دەتەوێت بیبینیت.';
}

// Path: guest_features.sync
class _Translations$guest_features$sync$ku extends Translations$guest_features$sync$en {
	_Translations$guest_features$sync$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'هاوکاتکردن لە هەموو شوێنێک';
	@override String get desc => 'زانیارییەکانت بە پارێزراوی دەمێننەوە لە هەموو ئامێرەکانتدا.';
}

// Path: movie_detail.prompts
class _Translations$movie_detail$prompts$ku extends Translations$movie_detail$prompts$en {
	_Translations$movie_detail$prompts$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get login_required => 'چوونەژوورەوە پێویستە';
	@override String get please_sign_in => 'تکایە بچۆ ژوورەوە بۆ ';
	@override String get go_to_login => 'بڕۆ بۆ لاپەڕەی چوونەژوورەوە';
	@override String get rate_title => 'نمرە بدە بەم فیلمە';
	@override String get slide_to_rate => 'ڕایبکێشە بۆ دیاریکردنی نمرەکەت';
}

// Path: movie_detail.actions
class _Translations$movie_detail$actions$ku extends Translations$movie_detail$actions$en {
	_Translations$movie_detail$actions$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get add_watch_later => 'زیادکردن بۆ سەیرکردنی دواتر';
	@override String get rate_movies => 'نمرەدان بە فیلمەکان';
}

// Path: connectivity.tips
class _Translations$connectivity$tips$ku extends Translations$connectivity$tips$en {
	_Translations$connectivity$tips$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get airplane_mode => '✓ مۆدی هەوڵیهۆڕ دەستپێببکە';
	@override String get check_data => '✓ WiFi یان داتای مۆبایل بپشک کن';
	@override String get move_closer => '✓ نزیکتر بچۆ بە دەست گریتنی WiFi';
	@override String get restart_device => '✓ دوبارە جیهانێت کار پێ بکە';
}

// Path: swipe.sort_options
class _Translations$swipe$sort_options$ku extends Translations$swipe$sort_options$en {
	_Translations$swipe$sort_options$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get most_popular => 'بەناوبانگترین';
	@override String get highest_rated => 'بەرزترین نمرە';
	@override String get newest_first => 'نوێترین';
	@override String get oldest_first => 'کۆنترین';
	@override String get highest_revenue => 'بەرزترین داهات';
}

// Path: onboarding.features.browse
class _Translations$onboarding$features$browse$ku extends Translations$onboarding$features$browse$en {
	_Translations$onboarding$features$browse$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'گەڕان و دۆزینەوە';
	@override String get desc => 'فیلمە باو و بەرزترین نمرەکان و داهاتووکان ببینە.';
}

// Path: onboarding.features.recommend
class _Translations$onboarding$features$recommend$ku extends Translations$onboarding$features$recommend$en {
	_Translations$onboarding$features$recommend$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'پێشنیاری زیرەک';
	@override String get desc => 'بە سوایپ بەدوای پێشنیاری فیلمی تایبەت بەخۆتدا بگەڕێ.';
}

// Path: onboarding.features.favorites
class _Translations$onboarding$features$favorites$ku extends Translations$onboarding$features$favorites$en {
	_Translations$onboarding$features$favorites$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'دڵخوازەکان و نمرەکان';
	@override String get desc => 'ئەو فیلمانەی خۆشت دەوێت بیپارێزە و نمرەکانی خۆت تۆمار بکە.';
}

// Path: onboarding.features.watch_later
class _Translations$onboarding$features$watch_later$ku extends Translations$onboarding$features$watch_later$en {
	_Translations$onboarding$features$watch_later$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'سەیرکردنی دواتر';
	@override String get desc => 'لیستی تایبەت بە فیلمەکانی دواتر دروست بکە.';
}

// Path: onboarding.tooltips.browse
class _Translations$onboarding$tooltips$browse$ku extends Translations$onboarding$tooltips$browse$en {
	_Translations$onboarding$tooltips$browse$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'سینەما';
	@override String get desc => 'فیلمە نوێکان ببینە و ئەوەی ئێستا پەخش دەکرێت بدۆزەرەوە';
}

// Path: onboarding.tooltips.recommend
class _Translations$onboarding$tooltips$recommend$ku extends Translations$onboarding$tooltips$recommend$en {
	_Translations$onboarding$tooltips$recommend$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'چی سەیر بکەم';
	@override String get desc => 'بە سوایپ بەدوای پێشنیاری فیلمی تایبەتدا بگەڕێ';
}

// Path: onboarding.tooltips.search
class _Translations$onboarding$tooltips$search$ku extends Translations$onboarding$tooltips$search$en {
	_Translations$onboarding$tooltips$search$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'دۆزینەوە';
	@override String get desc => 'بگەڕێ بۆ فیلم و زنجیرە و ئەکتەرەکان';
}

// Path: onboarding.tooltips.settings
class _Translations$onboarding$tooltips$settings$ku extends Translations$onboarding$tooltips$settings$en {
	_Translations$onboarding$tooltips$settings$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'ڕێکخستن';
	@override String get desc => 'زمان و دۆخی ڕووکار و ڕێکخستنەکانی ئەپ بەڕێوەببە';
}

// Path: onboarding.tooltips.profile
class _Translations$onboarding$tooltips$profile$ku extends Translations$onboarding$tooltips$profile$en {
	_Translations$onboarding$tooltips$profile$ku._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'پڕۆفایل';
	@override String get desc => 'لیستی سەیرکردنی دواتر و دڵخوازەکان و ڕێکخستنەکانت بەڕێوەببە';
}

/// The flat map containing all translations for locale <ku>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsKu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'home.trending' => 'ئێستا باوە',
			'home.top_rated' => 'فیلمە خاوەن بەرزترین نمرەکان',
			'home.now_playing' => 'ئێستا پەخش دەکرێت',
			'home.popular' => 'بەناوبانگ',
			'home.upcoming' => 'بەم زووانە',
			'home.action' => 'ئەکشن و هەستبزوێن',
			'home.sci_fi' => 'خەیاڵی زانستی',
			'home.horror' => 'ترسناک و دڵەڕاوکێ',
			'home.drama' => 'دراما',
			'home.comedy' => 'کۆمیدی',
			'home.romance' => 'ڕۆمانسی',
			'home.thriller' => 'هەستبزوێن',
			'home.animation' => 'ئەنیمەیشن',
			'home.mystery' => 'نهێنی',
			'search.explore' => 'دۆزینەوە',
			'search.explore_caps' => 'دۆزینەوە',
			'search.hint' => 'بگەڕێ بۆ فیلمەکان...',
			'search.no_results' => 'هیچ ئەنجامێک نەدۆزرایەوە.',
			'search.filters.all' => 'هەمووی',
			'search.filters.movies' => 'فیلمەکان',
			'search.filters.tv_shows' => 'زنجیرەکان',
			'search.filters.actors' => 'ئەکتەرەکان',
			'search.no_results_subtitle' => 'هەوڵی گەڕان بدە بۆ شتێکی تر',
			'search.discover_title' => 'فیلمەکان بدۆزەرەوە',
			'search.discover_subtitle' => 'دەست بکە بە نووسین بۆ گەڕان لە ملیۆنان فیلم و زنجیرە',
			'search.recent_searches' => 'گەڕانەکانی پێشوو',
			'search.clear' => 'سڕینەوە',
			'search.browse_categories' => 'گەڕان بەپێی پۆلەکان',
			'search.browse_all' => 'گەڕان بە هەمووی',
			'search.top_rated_badge' => 'بەرزترین نمرە',
			'search.browse' => 'گەڕان',
			'profile.title' => 'پڕۆفایل',
			'profile.my_activity' => 'چالاکییەکانم',
			'profile.watch_later' => 'سەیرکردنی دواتر',
			'profile.favorites' => 'دڵخوازەکانم',
			'profile.my_favorites' => 'دڵخوازەکانم',
			'profile.ratings' => 'هەڵسەنگاندنەکانم',
			'profile.my_ratings' => 'هەڵسەنگاندنەکانم',
			'profile.account' => 'هەژمار',
			'profile.logout' => 'چوونەدەرەوە',
			'profile.logout_confirm' => 'دڵنیای لە چوونەدەرەوە؟',
			'profile.default_name' => 'خۆشەویستی فیلم',
			'settings.title' => 'ڕێکخستن',
			'settings.language' => 'زمان',
			'settings.dark_mode' => 'دۆخی تاریک',
			'settings.lang_en' => 'ئینگلیزی',
			'settings.lang_ku' => 'کوردی',
			'settings.lang_ar' => 'عەرەبی',
			'settings.privacy_policy' => 'سیاسەی تایبەتی',
			'settings.legal' => 'یاسایی',
			'settings.support' => 'پاڵپشتی',
			'settings.contact_us' => 'پەیوەندیمان پێوە بکە',
			'settings.email' => 'mahamadbarznji712@gmail.com',
			'privacy.title' => 'سیاسەی تایبەتی',
			'privacy.last_updated' => 'دوایین نوێکردنەوە: حوزەیرانی 26, 2026',
			'privacy.introduction' => 'My Movies ڕێزی لە تایبەتی تۆ دەگرێت. ئەم سیاسەتە ڕوون دەکاتەوە کە چۆن زانیارییەکانی تۆ کۆدەکەینەوە، بەکاری دەهێنین، و پاراستنی دەکەین.',
			'privacy.info_collect_title' => 'زانیارییەکانی کۆی دەکەینەوە',
			'privacy.info_collect' => 'ئێمە کەمترین زانیاری پێویست کۆدەکەینەوە بۆ دابینکردنی خزمەتگوزارییەکانمان. ئەمە ڕەنگە ئیمەیڵەکەت لەخۆبگرێت ئەگەر هەژمارێک دروست بکەیت، و زانیاری بەکارهێنانی سادە وەک ئەو فیلمانەی کە دەیپارێزیت بۆ دواتر یان دڵخوازەکانت. ئێمە زانیاری تایبەتی هەستیار کۆناکەینەوە.',
			'privacy.how_use_title' => 'چۆن زانیارییەکانی تۆ بەکار دەهێنین',
			'privacy.how_use' => 'زانیارییەکانی تۆ تەنها بۆ تایبەتکردنی ئەزموونەکەت، پاراستنی هەڵبژاردنەکانت، و دابینکردنی بنەڕەتی کارەکانی ئەپەکە بەکار دەهێنرێت. ئێمە زانیارییەکانی تۆ بە لایەنی سێیەم نافرۆشین.',
			'privacy.data_security_title' => 'پاراستنی زانیاری',
			'privacy.data_security' => 'ئێمە پێوانەکانی ئاسایشی پیشەسازی جێبەجێ دەکەین بۆ پاراستنی زانیارییەکانت. بەڵام هیچ ڕێگەیەکی هەڵگرتنی ئەلیکترۆنی 100%% پارێزراو نییە.',
			'privacy.contact_title' => 'پەیوەندیمان پێوە بکە',
			'privacy.contact' => 'ئەگەر پرسیارت هەیە دەربارەی ئەم سیاسەتە، تکایە پەیوەندیمان پێوە بکە لە support@mymovies.app',
			'auth.login' => 'چوونەژوورەوە',
			'auth.signup' => 'ناونووسین',
			'auth.create_account' => 'دروستکردنی هەژمار',
			'auth.welcome_back' => 'بەخێربێیتەوە',
			'auth.login_subtitle' => 'بچۆ ناو هەژمارەکەت',
			'auth.join_community' => 'ببە بە ئەندام',
			'auth.join_subtitle' => 'بچۆ ژوورەوە بۆ دەستگەیشتن بە هەموو تایبەتمەندییەکانی My Movies.',
			'auth.email' => 'ئیمەیڵ',
			'auth.email_hint' => 'ئیمەیڵەکەت بنووسە',
			'auth.password' => 'وشەی نهێنی',
			'auth.password_hint' => 'وشەی نهێنییەکەت بنووسە',
			'auth.confirm_password' => 'وشەی نهێنی پشتڕاست بکەرەوە',
			'auth.confirm_password_hint' => 'وشەی نهێنی دووبارە بنووسەوە',
			'auth.no_account' => 'هەژمارت نییە؟ ',
			'auth.already_account' => 'پێشتر هەژمارت دروست کردووە؟ ',
			'auth.join_us_subtitle' => 'بەشداربە بۆ نمرەدان و پاراستنی فیلمەکان',
			'auth.onboarding_subtitle' => 'بەدوای ملیۆنان فیلمدا بگەڕێ، لیستی تایبەت بەخۆت دروست بکە، و بە ئاسانی نمرە بە فیلمە دڵخوازەکانت بدە.',
			'auth.get_started' => 'دەستپێبکە',
			'auth.continue_guest' => 'بەردەوامبە وەک میوان',
			'auth.login_required_desc' => 'تکایە بچۆ ژوورەوە بۆ بینینی لیستەکانت',
			'auth.welcome_title' => 'بەخێربێیت بۆ My Movies',
			'auth.onboarding_settings' => 'ئەزموونەکەت بگونجێنە',
			'auth.errors.email_required' => 'ئیمەیڵ پێویستە',
			'auth.errors.invalid_email' => 'ئیمەیڵێکی دروست بنووسە',
			'auth.errors.password_required' => 'وشەی نهێنی پێویستە',
			'auth.errors.password_too_short' => 'وشەی نهێنی دەبێت کەمتر نەبێت لە ٦ پیت',
			'auth.errors.confirm_password_required' => 'تکایە وشەی نهێنی پشتڕاست بکەرەوە',
			'auth.errors.passwords_dont_match' => 'وشە نهێنییەکان وەک یەک نین',
			'auth.guest.kContinue' => 'بەردەوامبە وەک میوان',
			'auth.guest.get_started' => 'دەستپێبکە / چوونەژوورەوە',
			'auth.reset_password' => 'ڕێستکردنی وشەی نهێنی',
			'auth.reset_subtitle' => 'ئیمەیڵەکەت بنووسە بۆ ناردنی لینکی ڕێستکردنی وشەی نهێنی.',
			'auth.send_reset_link' => 'ناردنی لینکی ڕێستکردن',
			'auth.reset_sent' => 'لینکی ڕێستکردن نێردرا! ئیمەیڵەکەت بپشکنە.',
			'auth.back_to_login' => 'گەڕانەوە بۆ چوونەژوورەوە',
			'onboarding.subtitle' => 'بەدوای ملیۆنان فیلمدا بگەڕێ، لیستی تایبەت بەخۆت دروست بکە، و بە ئاسانی نمرە بە فیلمە دڵخوازەکانت بدە.',
			'onboarding.features.browse.title' => 'گەڕان و دۆزینەوە',
			'onboarding.features.browse.desc' => 'فیلمە باو و بەرزترین نمرەکان و داهاتووکان ببینە.',
			'onboarding.features.recommend.title' => 'پێشنیاری زیرەک',
			'onboarding.features.recommend.desc' => 'بە سوایپ بەدوای پێشنیاری فیلمی تایبەت بەخۆتدا بگەڕێ.',
			'onboarding.features.favorites.title' => 'دڵخوازەکان و نمرەکان',
			'onboarding.features.favorites.desc' => 'ئەو فیلمانەی خۆشت دەوێت بیپارێزە و نمرەکانی خۆت تۆمار بکە.',
			'onboarding.features.watch_later.title' => 'سەیرکردنی دواتر',
			'onboarding.features.watch_later.desc' => 'لیستی تایبەت بە فیلمەکانی دواتر دروست بکە.',
			'onboarding.tooltips.browse.title' => 'سینەما',
			'onboarding.tooltips.browse.desc' => 'فیلمە نوێکان ببینە و ئەوەی ئێستا پەخش دەکرێت بدۆزەرەوە',
			'onboarding.tooltips.recommend.title' => 'چی سەیر بکەم',
			'onboarding.tooltips.recommend.desc' => 'بە سوایپ بەدوای پێشنیاری فیلمی تایبەتدا بگەڕێ',
			'onboarding.tooltips.search.title' => 'دۆزینەوە',
			'onboarding.tooltips.search.desc' => 'بگەڕێ بۆ فیلم و زنجیرە و ئەکتەرەکان',
			'onboarding.tooltips.settings.title' => 'ڕێکخستن',
			'onboarding.tooltips.settings.desc' => 'زمان و دۆخی ڕووکار و ڕێکخستنەکانی ئەپ بەڕێوەببە',
			'onboarding.tooltips.profile.title' => 'پڕۆفایل',
			'onboarding.tooltips.profile.desc' => 'لیستی سەیرکردنی دواتر و دڵخوازەکان و ڕێکخستنەکانت بەڕێوەببە',
			'guest_features.favorites.title' => 'دڵخوازەکان ڕێکبخە',
			'guest_features.favorites.desc' => 'ئەو فیلمانەی حەزت لێیەتی بپارێزە.',
			'guest_features.rate.title' => 'نمرە بدە و ڕا دەرببڕە',
			'guest_features.rate.desc' => 'بۆچوونی خۆت بڵاو بکەرەوە.',
			'guest_features.watch_later.title' => 'سەیرکردنی دواتر',
			'guest_features.watch_later.desc' => 'هەرگیز ئەو فیلمانە مەدۆڕێنە کە دەتەوێت بیبینیت.',
			'guest_features.sync.title' => 'هاوکاتکردن لە هەموو شوێنێک',
			'guest_features.sync.desc' => 'زانیارییەکانت بە پارێزراوی دەمێننەوە لە هەموو ئامێرەکانتدا.',
			'movie_detail.overview' => 'کورتە',
			'movie_detail.watch_later' => 'سەیرکردنی دواتر',
			'movie_detail.saved' => 'پاشەکەوتکرا',
			'movie_detail.rate_movie' => 'نمرە بدە بە فیلمەکە',
			'movie_detail.added_to_favorites' => 'بۆ دڵخوازەکان زیادکرا',
			'movie_detail.removed_from_favorites' => 'لە دڵخوازەکان سڕایەوە',
			'movie_detail.saved_rating' => 'نمرەکە پاشەکەوتکرا: ',
			'movie_detail.prompts.login_required' => 'چوونەژوورەوە پێویستە',
			'movie_detail.prompts.please_sign_in' => 'تکایە بچۆ ژوورەوە بۆ ',
			'movie_detail.prompts.go_to_login' => 'بڕۆ بۆ لاپەڕەی چوونەژوورەوە',
			'movie_detail.prompts.rate_title' => 'نمرە بدە بەم فیلمە',
			'movie_detail.prompts.slide_to_rate' => 'ڕایبکێشە بۆ دیاریکردنی نمرەکەت',
			'movie_detail.actions.add_watch_later' => 'زیادکردن بۆ سەیرکردنی دواتر',
			'movie_detail.actions.rate_movies' => 'نمرەدان بە فیلمەکان',
			'movie_detail.play_trailer' => 'پەخشکردنی ترەیلەر',
			'movie_detail.watch_trailer' => 'سەیرکردنی ترەیلەر',
			'movie_detail.on_youtube' => 'لە یوتیوب',
			'movie_detail.favorite' => 'دڵخواز',
			'movie_detail.watch' => 'سەیرکە',
			'movie_detail.release_today' => 'ئەمڕۆ',
			'movie_detail.release_1_day' => '١ ڕۆژ',
			'movie_detail.release_days' => 'ڕۆژ',
			'movie_detail.added_to_watch_later' => 'بۆ سەیرکردنی دواتر زیادکرا',
			'movie_detail.director' => 'دەرهێنەر',
			'movie_detail.cast' => 'ئەکتەرەکان',
			'movie_detail.you_might_also_like' => 'لەوانەیە ئەمانەشت بەدڵ بێت',
			'actor.born' => 'لەدایکبوون:',
			'actor.biography' => 'ژیاننامە',
			'actor.filmography' => 'فیلمۆگرافی',
			'director.born' => 'لەدایکبوون:',
			'director.biography' => 'ژیاننامە',
			'director.filmography' => 'فیلمۆگرافی',
			'tv.popular' => 'زنجیرە بەناوبانگەکان',
			'tv.top_rated' => 'زنجیرە خاوەن بەرزترین نمرەکان',
			'tv.airing_today' => 'ئەمڕۆ پەخش دەکرێت',
			'tv.on_the_air' => 'ئێستا پەخش دەکرێت',
			'tv.action' => 'زنجیرەی ئەکشن',
			'tv.comedy' => 'زنجیرەی کۆمیدی',
			'tv.drama' => 'زنجیرەی دراما',
			'tv.sci_fi_fantasy' => 'خەیاڵی زانستی و فەنتازیا',
			'tv.mystery' => 'زنجیرەی نهێنی',
			'tv.animation' => 'زنجیرەی ئەنیمەیشن',
			'tv.reality' => 'زنجیرەی ڕاستەقینە',
			'tv.horror' => 'زنجیرەی ترسناک',
			'common.cancel' => 'هەڵوەشاندنەوە',
			'common.submit' => 'نمرەکە بنێرە',
			'common.cinema' => 'سینەما',
			'common.app_name' => 'My Movies',
			'common.empty_list' => 'لیستەکەت لە ئێستادا بەتاڵە',
			'common.cine_stream' => 'My Movies',
			'common.retry' => 'دووبارە هەوڵبدەرەوە',
			'common.error_title' => 'هەڵەیەک ڕوویدا',
			'common.see_all' => 'هەمووی ببینە',
			'common.back_to_browse' => 'گەڕانەوە بۆ گەڕان',
			'common.collection' => 'کۆمەڵە',
			'common.my_movie' => 'My Movies',
			'genres.g_28' => 'ئەکشن',
			'genres.g_12' => 'سەرگەرمی',
			'genres.g_16' => 'ئەنیمەیشن',
			'genres.g_35' => 'کۆمیدی',
			'genres.g_80' => 'تاوان',
			'genres.g_99' => 'دۆکیومێنتەری',
			'genres.g_18' => 'دراما',
			'genres.g_10751' => 'خێزانی',
			'genres.g_14' => 'فەنتازیا',
			'genres.g_36' => 'مێژوویی',
			'genres.g_27' => 'ترسناک',
			'genres.g_10402' => 'موزیک',
			'genres.g_9648' => 'نهێنی',
			'genres.g_10749' => 'ڕۆمانسی',
			'genres.g_878' => 'خەیاڵی زانستی',
			'genres.g_10770' => 'فیلمی تەلەفزیۆنی',
			'genres.g_53' => 'هەستبزوێن',
			'genres.g_10752' => 'جەنگ',
			'genres.g_37' => 'ڕۆژئاوایی',
			'genres_tv.g_10759' => 'ئەکشن و سەرگەرمی',
			'genres_tv.g_10762' => 'منداڵان',
			'genres_tv.g_10763' => 'هەواڵ',
			'genres_tv.g_10764' => 'ڕاستەقینە',
			'genres_tv.g_10765' => 'خەیاڵی زانستی و فەنتازیا',
			'genres_tv.g_10766' => 'زنجیرەی ڕۆژانە',
			'genres_tv.g_10767' => 'وتووێژ',
			'genres_tv.g_10768' => 'جەنگ و سیاسەت',
			'errors.search_failed' => 'گەڕان سەرکەوتوو نەبوو. تکایە دووبارە هەوڵبدەرەوە.',
			'errors.search_tv_failed' => 'گەڕانی زنجیرەکان سەرکەوتوو نەبوو. تکایە دووبارە هەوڵبدەرەوە.',
			'errors.load_failed' => 'بارکردنی ناوەڕۆک سەرکەوتوو نەبوو.',
			'errors.network_timeout' => 'کاتی تۆڕ تەواو بوو. تکایە پەیوەندییەکەت بپشکنە.',
			'errors.server_error' => 'هەڵەی ڕاژەکار. تکایە دووبارە هەوڵبدەرەوە.',
			'errors.network_error' => 'هەڵەیەکی چاوەڕواننەکراوی تۆڕ.',
			'errors.request_failed' => 'داواکاری سەرکەوتوو نەبوو.',
			'errors.sign_up_failed' => 'ناونووسین سەرکەوتوو نەبوو.',
			'errors.auth_failed' => 'چوونەژوورەوە سەرکەوتوو نەبوو.',
			'connectivity.title' => 'پەیوەندیدانی ئەنتەرنێت نییە',
			'connectivity.description' => 'تکایە پەیوەندی ئەنتەرنێتت بسەرببە و دوبارە هەوڵبدەرەوە. تطبيق My Movies پێویست بە پەیوەندی کاراکێی ئەنتەرنێتی هەیە بۆ کارکردن بە شێوەیەکی ڕاست.',
			'connectivity.troubleshooting_title' => 'ڕاهێنان بۆ چارەسەرکردنی کێشه:',
			'connectivity.tips.airplane_mode' => '✓ مۆدی هەوڵیهۆڕ دەستپێببکە',
			'connectivity.tips.check_data' => '✓ WiFi یان داتای مۆبایل بپشک کن',
			'connectivity.tips.move_closer' => '✓ نزیکتر بچۆ بە دەست گریتنی WiFi',
			'connectivity.tips.restart_device' => '✓ دوبارە جیهانێت کار پێ بکە',
			'connectivity.check_connection' => 'پەیوەندیدان دابین دەکرێت...',
			'connectivity.retry' => 'دووبارە هەوڵبدەرەوە',
			'connectivity.offline_banner' => 'تۆ بە ئۆفلاینیت — هەندێک خزمەتگوزاری سنووردارن',
			'connectivity.browse_watch_later' => 'بگەڕێ بۆ دواتر سەیرکردن',
			'not_found.title' => 'پەڕەکە نەدۆزرایەوە',
			'not_found.title_404' => '404 - پەڕەکە نەدۆزرایەوە',
			'not_found.subtitle' => 'ئەو پەڕەیەی بەدوایدا دەگەڕێیت بوونی نییە یان گواستراوەتەوە.',
			'not_found.return_home' => 'بگەڕێوە بۆ سەرەتا',
			'what_to_watch_dialog.title' => 'بەخێربێیت بۆ چی سەیر بکەم',
			'what_to_watch_dialog.step1_title' => 'ڕێکخستنەکانت دیاری بکە',
			'what_to_watch_dialog.step1_desc' => 'جۆر، مەودای نمرە، ساڵی بڵاوکردنەوە، و ڕێکخستنی ڕیزکردن هەڵبژێرە بۆ دۆزینەوەی ئەوەی کە حەزت پێیەتی.',
			'what_to_watch_dialog.step2_title' => 'بەناو فیلمەکاندا سوایپ بکە',
			'what_to_watch_dialog.step2_desc' => 'بە ڕاستدا سوایپ بکە بۆ پاشەکەوتکردنی فیلم یان بە چەپدا بۆ پەڕاندنی. لەسەر کارتەکە بدا بۆ وردەکاری.',
			'what_to_watch_dialog.step3_title' => 'سەیرکردنی دواتر',
			'what_to_watch_dialog.step3_desc' => 'هەموو فیلمە پاشەکەوتکراوەکان لە پڕۆفایلەکەتدا دەردەکەون لەژێر سەیرکردنی دواتر.',
			'what_to_watch_dialog.got_it' => 'باشە!',
			'swipe.title' => 'چی سەیر بکەم',
			'swipe.save_label' => 'پاشەکەوتکردن',
			'swipe.skip_label' => 'پەڕاندن',
			'swipe.nope_label' => 'نەخێر',
			'swipe.watch_later_label' => 'سەیرکردنی دواتر',
			'swipe.hint' => 'بۆ پاشەکەوتکردن بە ڕاستدا سوایپ بکە',
			'swipe.error_title' => 'هەڵەیەک ڕوویدا',
			'swipe.retry' => 'دووبارە هەوڵبدەرەوە',
			'swipe.empty_no_movies' => 'هیچ فیلمێک نەدۆزرایەوە. فیلتەری جیاواز تاقی بکەرەوە.',
			'swipe.change_filters' => 'فیلتەرەکان بگۆڕە',
			'swipe.all_caught_up' => 'هەموو فیلمەکانت بینی!',
			'swipe.no_movies_added' => 'هیچ فیلمێک بۆ سەیرکردنی دواتر زیاد نەکرا.',
			'swipe.movie_added' => 'فیلم بۆ سەیرکردنی دواتر زیادکرا!',
			'swipe.movies_added' => 'فیلم بۆ سەیرکردنی دواتر زیادکران!',
			'swipe.view_watch_later' => 'سەیرکردنی دواتر ببینە',
			'swipe.skip' => 'پەڕاندن',
			'swipe.save' => 'پاشەکەوتکردن',
			'swipe.genres' => 'جۆرەکان',
			'swipe.selected' => 'هەڵبژێردرا',
			'swipe.select_genres' => 'جۆرەکان هەڵبژێرە',
			'swipe.minimum_rating' => 'کەمترین نمرە',
			'swipe.release_year' => 'ساڵی بڵاوکردنەوە',
			'swipe.sort_by' => 'ڕێکخستن بەپێی',
			'swipe.shuffle' => 'هەڕەمەکی کردن',
			'swipe.start_swiping' => ' دەستپێبکە بە سوایپکردن',
			'swipe.year_from' => 'لە',
			'swipe.year_to' => 'بۆ',
			'swipe.year_any' => 'هەر',
			'swipe.sort_options.most_popular' => 'بەناوبانگترین',
			'swipe.sort_options.highest_rated' => 'بەرزترین نمرە',
			'swipe.sort_options.newest_first' => 'نوێترین',
			'swipe.sort_options.oldest_first' => 'کۆنترین',
			'swipe.sort_options.highest_revenue' => 'بەرزترین داهات',
			_ => null,
		};
	}
}
