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
	@override late final _TranslationsHomeKu home = _TranslationsHomeKu._(_root);
	@override late final _TranslationsSearchKu search = _TranslationsSearchKu._(_root);
	@override late final _TranslationsProfileKu profile = _TranslationsProfileKu._(_root);
	@override late final _TranslationsSettingsKu settings = _TranslationsSettingsKu._(_root);
	@override late final _TranslationsAuthKu auth = _TranslationsAuthKu._(_root);
	@override late final _TranslationsOnboardingKu onboarding = _TranslationsOnboardingKu._(_root);
	@override late final _TranslationsGuestFeaturesKu guest_features = _TranslationsGuestFeaturesKu._(_root);
	@override late final _TranslationsMovieDetailKu movie_detail = _TranslationsMovieDetailKu._(_root);
	@override late final _TranslationsCommonKu common = _TranslationsCommonKu._(_root);
}

// Path: home
class _TranslationsHomeKu extends TranslationsHomeEn {
	_TranslationsHomeKu._(TranslationsKu root) : this._root = root, super.internal(root);

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
	@override String get drama => 'درامی';
	@override String get comedy => 'کۆمیدی';
	@override String get romance => 'ڕۆمانسی';
	@override String get thriller => 'هەستبزوێن';
	@override String get animation => 'ئەنیمەیشن';
	@override String get mystery => 'مشتومڕاوی';
}

// Path: search
class _TranslationsSearchKu extends TranslationsSearchEn {
	_TranslationsSearchKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get explore => 'دۆزینەوە';
	@override String get explore_caps => 'دۆزینەوە';
	@override String get hint => 'بگەڕێ بۆ فیلمەکان...';
	@override String get no_results => 'هیچ ئەنجامێک نەدۆزرایەوە.';
	@override late final _TranslationsSearchFiltersKu filters = _TranslationsSearchFiltersKu._(_root);
}

// Path: profile
class _TranslationsProfileKu extends TranslationsProfileEn {
	_TranslationsProfileKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'پڕۆفایل';
	@override String get my_activity => 'چالاکییەکانم';
	@override String get watch_later => 'سەيرکردنی دواتر';
	@override String get favorites => 'دڵخوازەکانم';
	@override String get my_favorites => 'دڵخوازەکانم';
	@override String get ratings => 'هەڵسەنگاندنەکانم';
	@override String get my_ratings => 'هەڵسەنگاندنەکانم';
	@override String get account => 'هەژمار';
	@override String get logout => 'چوونەدەرەوە';
}

// Path: settings
class _TranslationsSettingsKu extends TranslationsSettingsEn {
	_TranslationsSettingsKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'ڕێکخستن';
	@override String get language => 'زمان';
	@override String get dark_mode => 'دۆخی تاریک';
}

// Path: auth
class _TranslationsAuthKu extends TranslationsAuthEn {
	_TranslationsAuthKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get login => 'چوونەژوورەوە';
	@override String get signup => 'ناونووسین';
	@override String get create_account => 'دروستکردنی هەژمار';
	@override String get welcome_back => 'بەخێربێیتەوە';
	@override String get login_subtitle => 'بچۆ ناو هەژمارەکەت';
	@override String get join_community => 'ببە بە ئەندام';
	@override String get join_subtitle => 'بچۆ ژوورەوە بۆ دەستگەیشتن بە هەموو تایبەتمەندییەکانی سینەستریم.';
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
	@override late final _TranslationsAuthErrorsKu errors = _TranslationsAuthErrorsKu._(_root);
	@override late final _TranslationsAuthGuestKu guest = _TranslationsAuthGuestKu._(_root);
}

// Path: onboarding
class _TranslationsOnboardingKu extends TranslationsOnboardingEn {
	_TranslationsOnboardingKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'بەدوای ملیۆنان فیلمدا بگەڕێ، لیستی تایبەت بەخۆت دروست بکە، و بە ئاسانی نمرە بە فیلمە دڵخوازەکانت بدە.';
}

// Path: guest_features
class _TranslationsGuestFeaturesKu extends TranslationsGuestFeaturesEn {
	_TranslationsGuestFeaturesKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsGuestFeaturesFavoritesKu favorites = _TranslationsGuestFeaturesFavoritesKu._(_root);
	@override late final _TranslationsGuestFeaturesRateKu rate = _TranslationsGuestFeaturesRateKu._(_root);
	@override late final _TranslationsGuestFeaturesWatchLaterKu watch_later = _TranslationsGuestFeaturesWatchLaterKu._(_root);
	@override late final _TranslationsGuestFeaturesSyncKu sync = _TranslationsGuestFeaturesSyncKu._(_root);
}

// Path: movie_detail
class _TranslationsMovieDetailKu extends TranslationsMovieDetailEn {
	_TranslationsMovieDetailKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get overview => 'کورتە';
	@override String get watch_later => 'سەيرکردنی دواتر';
	@override String get saved => 'پاشەکەوتکرا';
	@override String get rate_movie => 'نمرە بدە بە فیلمەکە';
	@override String get added_to_favorites => 'بۆ دڵخوازەکان زیادکرا';
	@override String get removed_from_favorites => 'لە دڵخوازەکان سڕایەوە';
	@override String get saved_rating => 'نمرەکە پاشەکەوتکرا: ';
	@override late final _TranslationsMovieDetailPromptsKu prompts = _TranslationsMovieDetailPromptsKu._(_root);
	@override late final _TranslationsMovieDetailActionsKu actions = _TranslationsMovieDetailActionsKu._(_root);
}

// Path: common
class _TranslationsCommonKu extends TranslationsCommonEn {
	_TranslationsCommonKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'پاشگەزبوونەوە';
	@override String get submit => 'نمرەکە بنێرە';
	@override String get cinema => 'سینەما';
	@override String get app_name => 'CineStream';
	@override String get empty_list => 'قائمتک فارغة حالياً';
	@override String get cine_stream => 'CineStream';
}

// Path: search.filters
class _TranslationsSearchFiltersKu extends TranslationsSearchFiltersEn {
	_TranslationsSearchFiltersKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get all => 'هەمووی';
	@override String get movies => 'فیلمەکان';
	@override String get tv_shows => 'بەرنامەکان';
	@override String get actors => 'ئەکتەرەکان';
}

// Path: auth.errors
class _TranslationsAuthErrorsKu extends TranslationsAuthErrorsEn {
	_TranslationsAuthErrorsKu._(TranslationsKu root) : this._root = root, super.internal(root);

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
class _TranslationsAuthGuestKu extends TranslationsAuthGuestEn {
	_TranslationsAuthGuestKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get kContinue => 'بەردەوامبە وەک میوان';
	@override String get get_started => 'دەستپێبکە / چوونەژوورەوە';
}

// Path: guest_features.favorites
class _TranslationsGuestFeaturesFavoritesKu extends TranslationsGuestFeaturesFavoritesEn {
	_TranslationsGuestFeaturesFavoritesKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'دڵخوازەکان ڕێکبخە';
	@override String get desc => 'ئەو فیلمانەی حەزت لێیەتی بپارێزە.';
}

// Path: guest_features.rate
class _TranslationsGuestFeaturesRateKu extends TranslationsGuestFeaturesRateEn {
	_TranslationsGuestFeaturesRateKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'نمرە بدە و ڕا دەرببڕە';
	@override String get desc => 'بۆچوونی خۆت بڵاو بکەرەوە.';
}

// Path: guest_features.watch_later
class _TranslationsGuestFeaturesWatchLaterKu extends TranslationsGuestFeaturesWatchLaterEn {
	_TranslationsGuestFeaturesWatchLaterKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'سەيرکردنی دواتر';
	@override String get desc => 'هەرگیز ئەو فیلمانە مەدۆڕێنە کە دەتەوێت بیبینیت.';
}

// Path: guest_features.sync
class _TranslationsGuestFeaturesSyncKu extends TranslationsGuestFeaturesSyncEn {
	_TranslationsGuestFeaturesSyncKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get title => 'هاوکاتکردن لە هەموو شوێنێک';
	@override String get desc => 'زانیارییەکانت بە پارێزراوی دەمێننەوە لە هەموو ئامێرەکانت.';
}

// Path: movie_detail.prompts
class _TranslationsMovieDetailPromptsKu extends TranslationsMovieDetailPromptsEn {
	_TranslationsMovieDetailPromptsKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get login_required => 'چوونەژوورەوە پێویستە';
	@override String get please_sign_in => 'تکایە بچۆ ژوورەوە بۆ ';
	@override String get go_to_login => 'بڕۆ بۆ لاپەڕەی چوونەژوورەوە';
	@override String get rate_title => 'نمرە بدە بەم فیلمە';
	@override String get slide_to_rate => 'ڕایبکێشە بۆ دیاریکردنی نمرەکەت';
}

// Path: movie_detail.actions
class _TranslationsMovieDetailActionsKu extends TranslationsMovieDetailActionsEn {
	_TranslationsMovieDetailActionsKu._(TranslationsKu root) : this._root = root, super.internal(root);

	final TranslationsKu _root; // ignore: unused_field

	// Translations
	@override String get add_watch_later => 'زیادکردن بۆ سەیرکردنی دواتر';
	@override String get rate_movies => 'نمرەدان بە فیلمەکان';
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
			'home.drama' => 'درامی',
			'home.comedy' => 'کۆمیدی',
			'home.romance' => 'ڕۆمانسی',
			'home.thriller' => 'هەستبزوێن',
			'home.animation' => 'ئەنیمەیشن',
			'home.mystery' => 'مشتومڕاوی',
			'search.explore' => 'دۆزینەوە',
			'search.explore_caps' => 'دۆزینەوە',
			'search.hint' => 'بگەڕێ بۆ فیلمەکان...',
			'search.no_results' => 'هیچ ئەنجامێک نەدۆزرایەوە.',
			'search.filters.all' => 'هەمووی',
			'search.filters.movies' => 'فیلمەکان',
			'search.filters.tv_shows' => 'بەرنامەکان',
			'search.filters.actors' => 'ئەکتەرەکان',
			'profile.title' => 'پڕۆفایل',
			'profile.my_activity' => 'چالاکییەکانم',
			'profile.watch_later' => 'سەيرکردنی دواتر',
			'profile.favorites' => 'دڵخوازەکانم',
			'profile.my_favorites' => 'دڵخوازەکانم',
			'profile.ratings' => 'هەڵسەنگاندنەکانم',
			'profile.my_ratings' => 'هەڵسەنگاندنەکانم',
			'profile.account' => 'هەژمار',
			'profile.logout' => 'چوونەدەرەوە',
			'settings.title' => 'ڕێکخستن',
			'settings.language' => 'زمان',
			'settings.dark_mode' => 'دۆخی تاریک',
			'auth.login' => 'چوونەژوورەوە',
			'auth.signup' => 'ناونووسین',
			'auth.create_account' => 'دروستکردنی هەژمار',
			'auth.welcome_back' => 'بەخێربێیتەوە',
			'auth.login_subtitle' => 'بچۆ ناو هەژمارەکەت',
			'auth.join_community' => 'ببە بە ئەندام',
			'auth.join_subtitle' => 'بچۆ ژوورەوە بۆ دەستگەیشتن بە هەموو تایبەتمەندییەکانی سینەستریم.',
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
			'auth.errors.email_required' => 'ئیمەیڵ پێویستە',
			'auth.errors.invalid_email' => 'ئیمەیڵێکی دروست بنووسە',
			'auth.errors.password_required' => 'وشەی نهێنی پێویستە',
			'auth.errors.password_too_short' => 'وشەی نهێنی دەبێت کەمتر نەبێت لە ٦ پیت',
			'auth.errors.confirm_password_required' => 'تکایە وشەی نهێنی پشتڕاست بکەرەوە',
			'auth.errors.passwords_dont_match' => 'وشە نهێنییەکان وەک یەک نین',
			'auth.guest.kContinue' => 'بەردەوامبە وەک میوان',
			'auth.guest.get_started' => 'دەستپێبکە / چوونەژوورەوە',
			'onboarding.subtitle' => 'بەدوای ملیۆنان فیلمدا بگەڕێ، لیستی تایبەت بەخۆت دروست بکە، و بە ئاسانی نمرە بە فیلمە دڵخوازەکانت بدە.',
			'guest_features.favorites.title' => 'دڵخوازەکان ڕێکبخە',
			'guest_features.favorites.desc' => 'ئەو فیلمانەی حەزت لێیەتی بپارێزە.',
			'guest_features.rate.title' => 'نمرە بدە و ڕا دەرببڕە',
			'guest_features.rate.desc' => 'بۆچوونی خۆت بڵاو بکەرەوە.',
			'guest_features.watch_later.title' => 'سەيرکردنی دواتر',
			'guest_features.watch_later.desc' => 'هەرگیز ئەو فیلمانە مەدۆڕێنە کە دەتەوێت بیبینیت.',
			'guest_features.sync.title' => 'هاوکاتکردن لە هەموو شوێنێک',
			'guest_features.sync.desc' => 'زانیارییەکانت بە پارێزراوی دەمێننەوە لە هەموو ئامێرەکانت.',
			'movie_detail.overview' => 'کورتە',
			'movie_detail.watch_later' => 'سەيرکردنی دواتر',
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
			'common.cancel' => 'پاشگەزبوونەوە',
			'common.submit' => 'نمرەکە بنێرە',
			'common.cinema' => 'سینەما',
			'common.app_name' => 'CineStream',
			'common.empty_list' => 'قائمتک فارغة حالياً',
			'common.cine_stream' => 'CineStream',
			_ => null,
		};
	}
}
