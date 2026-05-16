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
class TranslationsAr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsHomeAr home = _TranslationsHomeAr._(_root);
	@override late final _TranslationsSearchAr search = _TranslationsSearchAr._(_root);
	@override late final _TranslationsProfileAr profile = _TranslationsProfileAr._(_root);
	@override late final _TranslationsSettingsAr settings = _TranslationsSettingsAr._(_root);
	@override late final _TranslationsAuthAr auth = _TranslationsAuthAr._(_root);
	@override late final _TranslationsOnboardingAr onboarding = _TranslationsOnboardingAr._(_root);
	@override late final _TranslationsGuestFeaturesAr guest_features = _TranslationsGuestFeaturesAr._(_root);
	@override late final _TranslationsMovieDetailAr movie_detail = _TranslationsMovieDetailAr._(_root);
	@override late final _TranslationsCommonAr common = _TranslationsCommonAr._(_root);
}

// Path: home
class _TranslationsHomeAr extends TranslationsHomeEn {
	_TranslationsHomeAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get trending => 'الأكثر تداولاً';
	@override String get top_rated => 'الأعلى تقييماً';
	@override String get now_playing => 'يُعرض حالياً';
	@override String get popular => 'الأكثر شعبية';
	@override String get upcoming => 'قادم قريباً';
	@override String get action => 'أفلام حركة وإثارة';
	@override String get sci_fi => 'خيال علمي';
	@override String get horror => 'رعب وتشويق';
	@override String get drama => 'أفلام درامية';
	@override String get comedy => 'أفلام كوميدية';
	@override String get romance => 'أفلام رومانسية';
	@override String get thriller => 'أفلام إثارة';
	@override String get animation => 'أفلام رسوم متحركة';
	@override String get mystery => 'غموض وتحقيق';
}

// Path: search
class _TranslationsSearchAr extends TranslationsSearchEn {
	_TranslationsSearchAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get explore => 'استكشف';
	@override String get explore_caps => 'استكشف';
	@override String get hint => 'ابحث عن أفلام...';
	@override String get no_results => 'لم يتم العثور على نتائج.';
	@override late final _TranslationsSearchFiltersAr filters = _TranslationsSearchFiltersAr._(_root);
}

// Path: profile
class _TranslationsProfileAr extends TranslationsProfileEn {
	_TranslationsProfileAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الملف الشخصي';
	@override String get my_activity => 'نشاطي';
	@override String get watch_later => 'شاهد لاحقاً';
	@override String get favorites => 'مفضلاتي';
	@override String get my_favorites => 'مفضلاتي';
	@override String get ratings => 'تقييماتي';
	@override String get my_ratings => 'تقييماتي';
	@override String get account => 'الحساب';
	@override String get logout => 'تسجيل الخروج';
}

// Path: settings
class _TranslationsSettingsAr extends TranslationsSettingsEn {
	_TranslationsSettingsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الإعدادات';
	@override String get language => 'اللغة';
	@override String get dark_mode => 'الوضع الليلي';
}

// Path: auth
class _TranslationsAuthAr extends TranslationsAuthEn {
	_TranslationsAuthAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get login => 'تسجيل الدخول';
	@override String get signup => 'إنشاء حساب';
	@override String get create_account => 'إنشاء حساب';
	@override String get welcome_back => 'مرحباً بعودتك';
	@override String get login_subtitle => 'سجل الدخول إلى حسابك';
	@override String get join_community => 'انضم إلى المجتمع';
	@override String get join_subtitle => 'سجل الدخول لفتح كامل إمكانيات CineStream وتخصيص تجربتك السينمائية.';
	@override String get email => 'البريد الإلكتروني';
	@override String get email_hint => 'أدخل بريدك الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get password_hint => 'أدخل كلمة المرور';
	@override String get confirm_password => 'تأكيد كلمة المرور';
	@override String get confirm_password_hint => 'أعد إدخال كلمة المرور';
	@override String get no_account => 'ليس لديك حساب؟ ';
	@override String get already_account => 'لديك حساب بالفعل؟ ';
	@override String get join_us_subtitle => 'انضم إلينا لتقييم وحفظ الأفلام';
	@override String get onboarding_subtitle => 'اكتشف ملايين الأفلام، وأنشئ قوائم مخصصة، وقيم عناوينك المفضلة بسهولة.';
	@override String get get_started => 'ابدأ الآن';
	@override String get continue_guest => 'المتابعة كضيف';
	@override String get login_required_desc => 'يرجى تسجيل الدخول لعرض مجموعتك';
	@override late final _TranslationsAuthErrorsAr errors = _TranslationsAuthErrorsAr._(_root);
	@override late final _TranslationsAuthGuestAr guest = _TranslationsAuthGuestAr._(_root);
}

// Path: onboarding
class _TranslationsOnboardingAr extends TranslationsOnboardingEn {
	_TranslationsOnboardingAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'اكتشف ملايين الأفلام، وأنشئ قوائم مخصصة، وقيم عناوينك المفضلة بسهولة.';
}

// Path: guest_features
class _TranslationsGuestFeaturesAr extends TranslationsGuestFeaturesEn {
	_TranslationsGuestFeaturesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsGuestFeaturesFavoritesAr favorites = _TranslationsGuestFeaturesFavoritesAr._(_root);
	@override late final _TranslationsGuestFeaturesRateAr rate = _TranslationsGuestFeaturesRateAr._(_root);
	@override late final _TranslationsGuestFeaturesWatchLaterAr watch_later = _TranslationsGuestFeaturesWatchLaterAr._(_root);
	@override late final _TranslationsGuestFeaturesSyncAr sync = _TranslationsGuestFeaturesSyncAr._(_root);
}

// Path: movie_detail
class _TranslationsMovieDetailAr extends TranslationsMovieDetailEn {
	_TranslationsMovieDetailAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get overview => 'نبذة عامة';
	@override String get watch_later => 'شاهد لاحقاً';
	@override String get saved => 'تم الحفظ';
	@override String get rate_movie => 'قيم الفيلم';
	@override String get added_to_favorites => 'تمت الإضافة إلى المفضلات';
	@override String get removed_from_favorites => 'تمت الإزالة من المفضلات';
	@override String get saved_rating => 'تم حفظ التقييم: ';
	@override late final _TranslationsMovieDetailPromptsAr prompts = _TranslationsMovieDetailPromptsAr._(_root);
	@override late final _TranslationsMovieDetailActionsAr actions = _TranslationsMovieDetailActionsAr._(_root);
}

// Path: common
class _TranslationsCommonAr extends TranslationsCommonEn {
	_TranslationsCommonAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'إلغاء';
	@override String get submit => 'إرسال التقييم';
	@override String get cinema => 'السينما';
	@override String get app_name => 'CineStream';
	@override String get empty_list => 'قائمتك فارغة حالياً';
	@override String get cine_stream => 'CineStream';
}

// Path: search.filters
class _TranslationsSearchFiltersAr extends TranslationsSearchFiltersEn {
	_TranslationsSearchFiltersAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get all => 'الكل';
	@override String get movies => 'أفلام';
	@override String get tv_shows => 'مسلسلات';
	@override String get actors => 'ممثلون';
}

// Path: auth.errors
class _TranslationsAuthErrorsAr extends TranslationsAuthErrorsEn {
	_TranslationsAuthErrorsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get email_required => 'البريد الإلكتروني مطلوب';
	@override String get invalid_email => 'أدخل بريد إلكتروني صحيح';
	@override String get password_required => 'كلمة المرور مطلوبة';
	@override String get password_too_short => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
	@override String get confirm_password_required => 'يرجى تأكيد كلمة المرور';
	@override String get passwords_dont_match => 'كلمات المرور غير متطابقة';
}

// Path: auth.guest
class _TranslationsAuthGuestAr extends TranslationsAuthGuestEn {
	_TranslationsAuthGuestAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get kContinue => 'المتابعة كضيف';
	@override String get get_started => 'ابدأ الآن / تسجيل الدخول';
}

// Path: guest_features.favorites
class _TranslationsGuestFeaturesFavoritesAr extends TranslationsGuestFeaturesFavoritesEn {
	_TranslationsGuestFeaturesFavoritesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'قائمة المفضلات';
	@override String get desc => 'تتبع الأفلام التي تحبها أكثر.';
}

// Path: guest_features.rate
class _TranslationsGuestFeaturesRateAr extends TranslationsGuestFeaturesRateEn {
	_TranslationsGuestFeaturesRateAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'قيم وراجع';
	@override String get desc => 'شارك أفكارك وأثر على الآخرين.';
}

// Path: guest_features.watch_later
class _TranslationsGuestFeaturesWatchLaterAr extends TranslationsGuestFeaturesWatchLaterEn {
	_TranslationsGuestFeaturesWatchLaterAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'شاهد لاحقاً';
	@override String get desc => 'لا تفقد أبداً الأفلام التي تريد مشاهدتها.';
}

// Path: guest_features.sync
class _TranslationsGuestFeaturesSyncAr extends TranslationsGuestFeaturesSyncEn {
	_TranslationsGuestFeaturesSyncAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مزامنة في كل مكان';
	@override String get desc => 'بياناتك محفوظة بأمان ومزامنة عبر جميع أجهزتك.';
}

// Path: movie_detail.prompts
class _TranslationsMovieDetailPromptsAr extends TranslationsMovieDetailPromptsEn {
	_TranslationsMovieDetailPromptsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get login_required => 'تسجيل الدخول مطلوب';
	@override String get please_sign_in => 'يرجى تسجيل الدخول لـ ';
	@override String get go_to_login => 'الذهاب لتسجيل الدخول';
	@override String get rate_title => 'قيم هذا الفيلم';
	@override String get slide_to_rate => 'اسحب لتحديد تقييمك';
}

// Path: movie_detail.actions
class _TranslationsMovieDetailActionsAr extends TranslationsMovieDetailActionsEn {
	_TranslationsMovieDetailActionsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get add_watch_later => 'الإضافة إلى قائمة المشاهدة لاحقاً';
	@override String get rate_movies => 'تقييم الأفلام';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'home.trending' => 'الأكثر تداولاً',
			'home.top_rated' => 'الأعلى تقييماً',
			'home.now_playing' => 'يُعرض حالياً',
			'home.popular' => 'الأكثر شعبية',
			'home.upcoming' => 'قادم قريباً',
			'home.action' => 'أفلام حركة وإثارة',
			'home.sci_fi' => 'خيال علمي',
			'home.horror' => 'رعب وتشويق',
			'home.drama' => 'أفلام درامية',
			'home.comedy' => 'أفلام كوميدية',
			'home.romance' => 'أفلام رومانسية',
			'home.thriller' => 'أفلام إثارة',
			'home.animation' => 'أفلام رسوم متحركة',
			'home.mystery' => 'غموض وتحقيق',
			'search.explore' => 'استكشف',
			'search.explore_caps' => 'استكشف',
			'search.hint' => 'ابحث عن أفلام...',
			'search.no_results' => 'لم يتم العثور على نتائج.',
			'search.filters.all' => 'الكل',
			'search.filters.movies' => 'أفلام',
			'search.filters.tv_shows' => 'مسلسلات',
			'search.filters.actors' => 'ممثلون',
			'profile.title' => 'الملف الشخصي',
			'profile.my_activity' => 'نشاطي',
			'profile.watch_later' => 'شاهد لاحقاً',
			'profile.favorites' => 'مفضلاتي',
			'profile.my_favorites' => 'مفضلاتي',
			'profile.ratings' => 'تقييماتي',
			'profile.my_ratings' => 'تقييماتي',
			'profile.account' => 'الحساب',
			'profile.logout' => 'تسجيل الخروج',
			'settings.title' => 'الإعدادات',
			'settings.language' => 'اللغة',
			'settings.dark_mode' => 'الوضع الليلي',
			'auth.login' => 'تسجيل الدخول',
			'auth.signup' => 'إنشاء حساب',
			'auth.create_account' => 'إنشاء حساب',
			'auth.welcome_back' => 'مرحباً بعودتك',
			'auth.login_subtitle' => 'سجل الدخول إلى حسابك',
			'auth.join_community' => 'انضم إلى المجتمع',
			'auth.join_subtitle' => 'سجل الدخول لفتح كامل إمكانيات CineStream وتخصيص تجربتك السينمائية.',
			'auth.email' => 'البريد الإلكتروني',
			'auth.email_hint' => 'أدخل بريدك الإلكتروني',
			'auth.password' => 'كلمة المرور',
			'auth.password_hint' => 'أدخل كلمة المرور',
			'auth.confirm_password' => 'تأكيد كلمة المرور',
			'auth.confirm_password_hint' => 'أعد إدخال كلمة المرور',
			'auth.no_account' => 'ليس لديك حساب؟ ',
			'auth.already_account' => 'لديك حساب بالفعل؟ ',
			'auth.join_us_subtitle' => 'انضم إلينا لتقييم وحفظ الأفلام',
			'auth.onboarding_subtitle' => 'اكتشف ملايين الأفلام، وأنشئ قوائم مخصصة، وقيم عناوينك المفضلة بسهولة.',
			'auth.get_started' => 'ابدأ الآن',
			'auth.continue_guest' => 'المتابعة كضيف',
			'auth.login_required_desc' => 'يرجى تسجيل الدخول لعرض مجموعتك',
			'auth.errors.email_required' => 'البريد الإلكتروني مطلوب',
			'auth.errors.invalid_email' => 'أدخل بريد إلكتروني صحيح',
			'auth.errors.password_required' => 'كلمة المرور مطلوبة',
			'auth.errors.password_too_short' => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
			'auth.errors.confirm_password_required' => 'يرجى تأكيد كلمة المرور',
			'auth.errors.passwords_dont_match' => 'كلمات المرور غير متطابقة',
			'auth.guest.kContinue' => 'المتابعة كضيف',
			'auth.guest.get_started' => 'ابدأ الآن / تسجيل الدخول',
			'onboarding.subtitle' => 'اكتشف ملايين الأفلام، وأنشئ قوائم مخصصة، وقيم عناوينك المفضلة بسهولة.',
			'guest_features.favorites.title' => 'قائمة المفضلات',
			'guest_features.favorites.desc' => 'تتبع الأفلام التي تحبها أكثر.',
			'guest_features.rate.title' => 'قيم وراجع',
			'guest_features.rate.desc' => 'شارك أفكارك وأثر على الآخرين.',
			'guest_features.watch_later.title' => 'شاهد لاحقاً',
			'guest_features.watch_later.desc' => 'لا تفقد أبداً الأفلام التي تريد مشاهدتها.',
			'guest_features.sync.title' => 'مزامنة في كل مكان',
			'guest_features.sync.desc' => 'بياناتك محفوظة بأمان ومزامنة عبر جميع أجهزتك.',
			'movie_detail.overview' => 'نبذة عامة',
			'movie_detail.watch_later' => 'شاهد لاحقاً',
			'movie_detail.saved' => 'تم الحفظ',
			'movie_detail.rate_movie' => 'قيم الفيلم',
			'movie_detail.added_to_favorites' => 'تمت الإضافة إلى المفضلات',
			'movie_detail.removed_from_favorites' => 'تمت الإزالة من المفضلات',
			'movie_detail.saved_rating' => 'تم حفظ التقييم: ',
			'movie_detail.prompts.login_required' => 'تسجيل الدخول مطلوب',
			'movie_detail.prompts.please_sign_in' => 'يرجى تسجيل الدخول لـ ',
			'movie_detail.prompts.go_to_login' => 'الذهاب لتسجيل الدخول',
			'movie_detail.prompts.rate_title' => 'قيم هذا الفيلم',
			'movie_detail.prompts.slide_to_rate' => 'اسحب لتحديد تقييمك',
			'movie_detail.actions.add_watch_later' => 'الإضافة إلى قائمة المشاهدة لاحقاً',
			'movie_detail.actions.rate_movies' => 'تقييم الأفلام',
			'common.cancel' => 'إلغاء',
			'common.submit' => 'إرسال التقييم',
			'common.cinema' => 'السينما',
			'common.app_name' => 'CineStream',
			'common.empty_list' => 'قائمتك فارغة حالياً',
			'common.cine_stream' => 'CineStream',
			_ => null,
		};
	}
}
