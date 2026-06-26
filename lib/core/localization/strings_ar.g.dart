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
	@override late final _Translations$home$ar home = _Translations$home$ar._(_root);
	@override late final _Translations$search$ar search = _Translations$search$ar._(_root);
	@override late final _Translations$profile$ar profile = _Translations$profile$ar._(_root);
	@override late final _Translations$settings$ar settings = _Translations$settings$ar._(_root);
	@override late final _Translations$privacy$ar privacy = _Translations$privacy$ar._(_root);
	@override late final _Translations$auth$ar auth = _Translations$auth$ar._(_root);
	@override late final _Translations$onboarding$ar onboarding = _Translations$onboarding$ar._(_root);
	@override late final _Translations$guest_features$ar guest_features = _Translations$guest_features$ar._(_root);
	@override late final _Translations$movie_detail$ar movie_detail = _Translations$movie_detail$ar._(_root);
	@override late final _Translations$actor$ar actor = _Translations$actor$ar._(_root);
	@override late final _Translations$tv$ar tv = _Translations$tv$ar._(_root);
	@override late final _Translations$common$ar common = _Translations$common$ar._(_root);
	@override late final _Translations$connectivity$ar connectivity = _Translations$connectivity$ar._(_root);
	@override late final _Translations$not_found$ar not_found = _Translations$not_found$ar._(_root);
}

// Path: home
class _Translations$home$ar extends Translations$home$en {
	_Translations$home$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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
class _Translations$search$ar extends Translations$search$en {
	_Translations$search$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get explore => 'استكشف';
	@override String get explore_caps => 'استكشف';
	@override String get hint => 'ابحث عن أفلام...';
	@override String get no_results => 'لم يتم العثور على نتائج.';
	@override late final _Translations$search$filters$ar filters = _Translations$search$filters$ar._(_root);
	@override String get no_results_subtitle => 'حاول البحث عن شيء آخر';
	@override String get discover_title => 'اكتشف الأفلام';
	@override String get discover_subtitle => 'ابدأ الكتابة لاستكشاف ملايين الأفلام والبرامج التلفزيونية';
	@override String get recent_searches => 'عمليات البحث الأخيرة';
	@override String get clear => 'مسح';
	@override String get browse_categories => 'تصفح الفئات';
	@override String get browse_all => 'تصفح الكل';
	@override String get top_rated_badge => 'الأعلى تقييماً';
	@override String get browse => 'تصفح';
}

// Path: profile
class _Translations$profile$ar extends Translations$profile$en {
	_Translations$profile$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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
	@override String get logout_confirm => 'هل أنت متأكد من تسجيل الخروج؟';
	@override String get default_name => 'مشاهد CineVault';
}

// Path: settings
class _Translations$settings$ar extends Translations$settings$en {
	_Translations$settings$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الإعدادات';
	@override String get language => 'اللغة';
	@override String get dark_mode => 'الوضع الليلي';
	@override String get lang_en => 'الإنجليزية';
	@override String get lang_ku => 'الكردية';
	@override String get lang_ar => 'العربية';
	@override String get privacy_policy => 'سياسة الخصوصية';
	@override String get legal => 'قانوني';
}

// Path: privacy
class _Translations$privacy$ar extends Translations$privacy$en {
	_Translations$privacy$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'سياسة الخصوصية';
	@override String get last_updated => 'آخر تحديث: 26 يونيو 2026';
	@override String get introduction => 'My Movies تحترم خصوصيتك. توضح سياسة الخصوصية هذه كيفية جمع وحماية واستخدام معلوماتك عند استخدام تطبيقنا.';
	@override String get info_collect_title => 'المعلومات التي نجمعها';
	@override String get info_collect => 'نجمع الحد الأدنى من المعلومات اللازمة لتقديم خدماتنا. قد يشمل ذلك عنوان بريدك الإلكتروني إذا قمت بإنشاء حساب، وبيانات الاستخدام الأساسية مثل الأفلام التي تحفظها في قائمة المشاهدة لاحقاً أو المفضلة. لا نجمع معلومات شخصية حساسة.';
	@override String get how_use_title => 'كيف نستخدم معلوماتك';
	@override String get how_use => 'تُستخدم معلوماتك فقط لتخصيص تجربتك وحفظ تفضيلاتك وتوفير الوظائف الأساسية للتطبيق. لا نبيع بياناتك لأطراف ثالثة.';
	@override String get data_security_title => 'أمن البيانات';
	@override String get data_security => 'نطبق معايير أمان على مستوى الصناعة لحماية معلوماتك. ومع ذلك، لا توجد طريقة تخزين إلكترونية آمنة بنسبة 100%.';
	@override String get contact_title => 'اتصل بنا';
	@override String get contact => 'إذا كانت لديك أسئلة حول سياسة الخصوصية هذه، يرجى الاتصال بنا على support@mymovies.app';
}

// Path: auth
class _Translations$auth$ar extends Translations$auth$en {
	_Translations$auth$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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
	@override String get welcome_title => 'مرحباً بك في CineStream';
	@override String get onboarding_settings => 'خصص تجربتك';
	@override late final _Translations$auth$errors$ar errors = _Translations$auth$errors$ar._(_root);
	@override late final _Translations$auth$guest$ar guest = _Translations$auth$guest$ar._(_root);
	@override String get reset_password => 'إعادة تعيين كلمة المرور';
	@override String get reset_subtitle => 'أدخل بريدك الإلكتروني وسنرسل لك رابطاً لإعادة تعيين كلمة المرور.';
	@override String get send_reset_link => 'إرسال رابط إعادة التعيين';
	@override String get reset_sent => 'تم إرسال رابط إعادة التعيين! تحقق من بريدك الإلكتروني.';
	@override String get back_to_login => 'العودة إلى تسجيل الدخول';
}

// Path: onboarding
class _Translations$onboarding$ar extends Translations$onboarding$en {
	_Translations$onboarding$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'اكتشف ملايين الأفلام، وأنشئ قوائم مخصصة، وقيم عناوينك المفضلة بسهولة.';
}

// Path: guest_features
class _Translations$guest_features$ar extends Translations$guest_features$en {
	_Translations$guest_features$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$guest_features$favorites$ar favorites = _Translations$guest_features$favorites$ar._(_root);
	@override late final _Translations$guest_features$rate$ar rate = _Translations$guest_features$rate$ar._(_root);
	@override late final _Translations$guest_features$watch_later$ar watch_later = _Translations$guest_features$watch_later$ar._(_root);
	@override late final _Translations$guest_features$sync$ar sync = _Translations$guest_features$sync$ar._(_root);
}

// Path: movie_detail
class _Translations$movie_detail$ar extends Translations$movie_detail$en {
	_Translations$movie_detail$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get overview => 'نبذة عامة';
	@override String get watch_later => 'شاهد لاحقاً';
	@override String get saved => 'تم الحفظ';
	@override String get rate_movie => 'قيم الفيلم';
	@override String get added_to_favorites => 'تمت الإضافة إلى المفضلات';
	@override String get removed_from_favorites => 'تمت الإزالة من المفضلات';
	@override String get saved_rating => 'تم حفظ التقييم: ';
	@override late final _Translations$movie_detail$prompts$ar prompts = _Translations$movie_detail$prompts$ar._(_root);
	@override late final _Translations$movie_detail$actions$ar actions = _Translations$movie_detail$actions$ar._(_root);
	@override String get play_trailer => 'تشغيل المقطع الدعائي';
	@override String get watch_trailer => 'مشاهدة المقطع الدعائي';
	@override String get on_youtube => 'على يوتيوب';
	@override String get favorite => 'مفضلة';
	@override String get watch => 'مشاهدة';
	@override String get release_today => 'اليوم';
	@override String get release_1_day => 'يوم واحد';
	@override String get release_days => 'أيام';
	@override String get added_to_watch_later => 'تمت الإضافة إلى شاهد لاحقاً';
	@override String get director => 'المخرج';
	@override String get cast => 'طاقم التمثيل';
	@override String get you_might_also_like => 'قد يعجبك أيضاً';
}

// Path: actor
class _Translations$actor$ar extends Translations$actor$en {
	_Translations$actor$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get born => 'تاريخ الميلاد:';
	@override String get biography => 'السيرة الذاتية';
	@override String get filmography => 'قائمة الأفلام';
}

// Path: tv
class _Translations$tv$ar extends Translations$tv$en {
	_Translations$tv$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get popular => 'الشائع';
	@override String get top_rated => 'الأعلى تقييماً';
	@override String get airing_today => 'يُعرض اليوم';
	@override String get on_the_air => 'يُعرض الآن';
	@override String get action => 'أكشن';
	@override String get comedy => 'كوميديا';
	@override String get drama => 'دراما';
	@override String get sci_fi_fantasy => 'خيال علمي وفانتازيا';
}

// Path: common
class _Translations$common$ar extends Translations$common$en {
	_Translations$common$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'إلغاء';
	@override String get submit => 'إرسال التقييم';
	@override String get cinema => 'السينما';
	@override String get app_name => 'CineStream';
	@override String get empty_list => 'قائمتك فارغة حالياً';
	@override String get cine_stream => 'CineStream';
	@override String get retry => 'إعادة المحاولة';
	@override String get error_title => 'حدث خطأ ما';
	@override String get see_all => 'عرض الكل';
	@override String get back_to_browse => 'العودة للتصفح';
	@override String get collection => 'المجموعة';
	@override String get my_movie => 'My Movie';
}

// Path: connectivity
class _Translations$connectivity$ar extends Translations$connectivity$en {
	_Translations$connectivity$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'لا يوجد اتصال بالإنترنت';
	@override String get description => 'يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى. تطبيق My Movie يتطلب اتصالًا نشطًا بالإنترنت للعمل بشكل صحيح.';
	@override String get troubleshooting_title => 'نصائح لاستكشاف الأخطاء وإصلاحها:';
	@override late final _Translations$connectivity$tips$ar tips = _Translations$connectivity$tips$ar._(_root);
	@override String get check_connection => 'جارٍ التحقق من الاتصال...';
	@override String get retry => 'إعادة المحاولة';
	@override String get offline_banner => 'أنت غير متصل — قد تكون بعض الميزات محدودة';
	@override String get browse_watch_later => 'تصفح شاهد لاحقاً';
}

// Path: not_found
class _Translations$not_found$ar extends Translations$not_found$en {
	_Translations$not_found$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الصفحة غير موجودة';
	@override String get title_404 => '404 - الصفحة غير موجودة';
	@override String get subtitle => 'الصفحة التي تبحث عنها غير موجودة أو تم نقلها.';
	@override String get return_home => 'العودة إلى الرئيسية';
}

// Path: search.filters
class _Translations$search$filters$ar extends Translations$search$filters$en {
	_Translations$search$filters$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get all => 'الكل';
	@override String get movies => 'أفلام';
	@override String get tv_shows => 'برامج تلفزيونية';
	@override String get actors => 'ممثلون';
}

// Path: auth.errors
class _Translations$auth$errors$ar extends Translations$auth$errors$en {
	_Translations$auth$errors$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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
class _Translations$auth$guest$ar extends Translations$auth$guest$en {
	_Translations$auth$guest$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get kContinue => 'المتابعة كضيف';
	@override String get get_started => 'ابدأ الآن / تسجيل الدخول';
}

// Path: guest_features.favorites
class _Translations$guest_features$favorites$ar extends Translations$guest_features$favorites$en {
	_Translations$guest_features$favorites$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'قائمة المفضلات';
	@override String get desc => 'تتبع الأفلام التي تحبها أكثر.';
}

// Path: guest_features.rate
class _Translations$guest_features$rate$ar extends Translations$guest_features$rate$en {
	_Translations$guest_features$rate$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'قيم وراجع';
	@override String get desc => 'شارك أفكارك وأثر على الآخرين.';
}

// Path: guest_features.watch_later
class _Translations$guest_features$watch_later$ar extends Translations$guest_features$watch_later$en {
	_Translations$guest_features$watch_later$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'شاهد لاحقاً';
	@override String get desc => 'لا تفقد أبداً الأفلام التي تريد مشاهدتها.';
}

// Path: guest_features.sync
class _Translations$guest_features$sync$ar extends Translations$guest_features$sync$en {
	_Translations$guest_features$sync$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مزامنة في كل مكان';
	@override String get desc => 'بياناتك محفوظة بأمان ومزامنة عبر جميع أجهزتك.';
}

// Path: movie_detail.prompts
class _Translations$movie_detail$prompts$ar extends Translations$movie_detail$prompts$en {
	_Translations$movie_detail$prompts$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get login_required => 'تسجيل الدخول مطلوب';
	@override String get please_sign_in => 'يرجى تسجيل الدخول لـ ';
	@override String get go_to_login => 'الذهاب لتسجيل الدخول';
	@override String get rate_title => 'قيم هذا الفيلم';
	@override String get slide_to_rate => 'اسحب لتحديد تقييمك';
}

// Path: movie_detail.actions
class _Translations$movie_detail$actions$ar extends Translations$movie_detail$actions$en {
	_Translations$movie_detail$actions$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get add_watch_later => 'الإضافة إلى قائمة المشاهدة لاحقاً';
	@override String get rate_movies => 'تقييم الأفلام';
}

// Path: connectivity.tips
class _Translations$connectivity$tips$ar extends Translations$connectivity$tips$en {
	_Translations$connectivity$tips$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get airplane_mode => '✓ أطفل وضع الطائرة';
	@override String get check_data => '✓ تحقق من بيانات WiFi أو الهاتف';
	@override String get move_closer => '✓ اقترب من جهاز التوجيه';
	@override String get restart_device => '✓ أعد تشغيل جهازك';
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
			'search.filters.tv_shows' => 'برامج تلفزيونية',
			'search.filters.actors' => 'ممثلون',
			'search.no_results_subtitle' => 'حاول البحث عن شيء آخر',
			'search.discover_title' => 'اكتشف الأفلام',
			'search.discover_subtitle' => 'ابدأ الكتابة لاستكشاف ملايين الأفلام والبرامج التلفزيونية',
			'search.recent_searches' => 'عمليات البحث الأخيرة',
			'search.clear' => 'مسح',
			'search.browse_categories' => 'تصفح الفئات',
			'search.browse_all' => 'تصفح الكل',
			'search.top_rated_badge' => 'الأعلى تقييماً',
			'search.browse' => 'تصفح',
			'profile.title' => 'الملف الشخصي',
			'profile.my_activity' => 'نشاطي',
			'profile.watch_later' => 'شاهد لاحقاً',
			'profile.favorites' => 'مفضلاتي',
			'profile.my_favorites' => 'مفضلاتي',
			'profile.ratings' => 'تقييماتي',
			'profile.my_ratings' => 'تقييماتي',
			'profile.account' => 'الحساب',
			'profile.logout' => 'تسجيل الخروج',
			'profile.logout_confirm' => 'هل أنت متأكد من تسجيل الخروج؟',
			'profile.default_name' => 'مشاهد CineVault',
			'settings.title' => 'الإعدادات',
			'settings.language' => 'اللغة',
			'settings.dark_mode' => 'الوضع الليلي',
			'settings.lang_en' => 'الإنجليزية',
			'settings.lang_ku' => 'الكردية',
			'settings.lang_ar' => 'العربية',
			'settings.privacy_policy' => 'سياسة الخصوصية',
			'settings.legal' => 'قانوني',
			'privacy.title' => 'سياسة الخصوصية',
			'privacy.last_updated' => 'آخر تحديث: 26 يونيو 2026',
			'privacy.introduction' => 'My Movies تحترم خصوصيتك. توضح سياسة الخصوصية هذه كيفية جمع وحماية واستخدام معلوماتك عند استخدام تطبيقنا.',
			'privacy.info_collect_title' => 'المعلومات التي نجمعها',
			'privacy.info_collect' => 'نجمع الحد الأدنى من المعلومات اللازمة لتقديم خدماتنا. قد يشمل ذلك عنوان بريدك الإلكتروني إذا قمت بإنشاء حساب، وبيانات الاستخدام الأساسية مثل الأفلام التي تحفظها في قائمة المشاهدة لاحقاً أو المفضلة. لا نجمع معلومات شخصية حساسة.',
			'privacy.how_use_title' => 'كيف نستخدم معلوماتك',
			'privacy.how_use' => 'تُستخدم معلوماتك فقط لتخصيص تجربتك وحفظ تفضيلاتك وتوفير الوظائف الأساسية للتطبيق. لا نبيع بياناتك لأطراف ثالثة.',
			'privacy.data_security_title' => 'أمن البيانات',
			'privacy.data_security' => 'نطبق معايير أمان على مستوى الصناعة لحماية معلوماتك. ومع ذلك، لا توجد طريقة تخزين إلكترونية آمنة بنسبة 100%.',
			'privacy.contact_title' => 'اتصل بنا',
			'privacy.contact' => 'إذا كانت لديك أسئلة حول سياسة الخصوصية هذه، يرجى الاتصال بنا على support@mymovies.app',
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
			'auth.welcome_title' => 'مرحباً بك في CineStream',
			'auth.onboarding_settings' => 'خصص تجربتك',
			'auth.errors.email_required' => 'البريد الإلكتروني مطلوب',
			'auth.errors.invalid_email' => 'أدخل بريد إلكتروني صحيح',
			'auth.errors.password_required' => 'كلمة المرور مطلوبة',
			'auth.errors.password_too_short' => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
			'auth.errors.confirm_password_required' => 'يرجى تأكيد كلمة المرور',
			'auth.errors.passwords_dont_match' => 'كلمات المرور غير متطابقة',
			'auth.guest.kContinue' => 'المتابعة كضيف',
			'auth.guest.get_started' => 'ابدأ الآن / تسجيل الدخول',
			'auth.reset_password' => 'إعادة تعيين كلمة المرور',
			'auth.reset_subtitle' => 'أدخل بريدك الإلكتروني وسنرسل لك رابطاً لإعادة تعيين كلمة المرور.',
			'auth.send_reset_link' => 'إرسال رابط إعادة التعيين',
			'auth.reset_sent' => 'تم إرسال رابط إعادة التعيين! تحقق من بريدك الإلكتروني.',
			'auth.back_to_login' => 'العودة إلى تسجيل الدخول',
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
			'movie_detail.play_trailer' => 'تشغيل المقطع الدعائي',
			'movie_detail.watch_trailer' => 'مشاهدة المقطع الدعائي',
			'movie_detail.on_youtube' => 'على يوتيوب',
			'movie_detail.favorite' => 'مفضلة',
			'movie_detail.watch' => 'مشاهدة',
			'movie_detail.release_today' => 'اليوم',
			'movie_detail.release_1_day' => 'يوم واحد',
			'movie_detail.release_days' => 'أيام',
			'movie_detail.added_to_watch_later' => 'تمت الإضافة إلى شاهد لاحقاً',
			'movie_detail.director' => 'المخرج',
			'movie_detail.cast' => 'طاقم التمثيل',
			'movie_detail.you_might_also_like' => 'قد يعجبك أيضاً',
			'actor.born' => 'تاريخ الميلاد:',
			'actor.biography' => 'السيرة الذاتية',
			'actor.filmography' => 'قائمة الأفلام',
			'tv.popular' => 'الشائع',
			'tv.top_rated' => 'الأعلى تقييماً',
			'tv.airing_today' => 'يُعرض اليوم',
			'tv.on_the_air' => 'يُعرض الآن',
			'tv.action' => 'أكشن',
			'tv.comedy' => 'كوميديا',
			'tv.drama' => 'دراما',
			'tv.sci_fi_fantasy' => 'خيال علمي وفانتازيا',
			'common.cancel' => 'إلغاء',
			'common.submit' => 'إرسال التقييم',
			'common.cinema' => 'السينما',
			'common.app_name' => 'CineStream',
			'common.empty_list' => 'قائمتك فارغة حالياً',
			'common.cine_stream' => 'CineStream',
			'common.retry' => 'إعادة المحاولة',
			'common.error_title' => 'حدث خطأ ما',
			'common.see_all' => 'عرض الكل',
			'common.back_to_browse' => 'العودة للتصفح',
			'common.collection' => 'المجموعة',
			'common.my_movie' => 'My Movie',
			'connectivity.title' => 'لا يوجد اتصال بالإنترنت',
			'connectivity.description' => 'يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى. تطبيق My Movie يتطلب اتصالًا نشطًا بالإنترنت للعمل بشكل صحيح.',
			'connectivity.troubleshooting_title' => 'نصائح لاستكشاف الأخطاء وإصلاحها:',
			'connectivity.tips.airplane_mode' => '✓ أطفل وضع الطائرة',
			'connectivity.tips.check_data' => '✓ تحقق من بيانات WiFi أو الهاتف',
			'connectivity.tips.move_closer' => '✓ اقترب من جهاز التوجيه',
			'connectivity.tips.restart_device' => '✓ أعد تشغيل جهازك',
			'connectivity.check_connection' => 'جارٍ التحقق من الاتصال...',
			'connectivity.retry' => 'إعادة المحاولة',
			'connectivity.offline_banner' => 'أنت غير متصل — قد تكون بعض الميزات محدودة',
			'connectivity.browse_watch_later' => 'تصفح شاهد لاحقاً',
			'not_found.title' => 'الصفحة غير موجودة',
			'not_found.title_404' => '404 - الصفحة غير موجودة',
			'not_found.subtitle' => 'الصفحة التي تبحث عنها غير موجودة أو تم نقلها.',
			'not_found.return_home' => 'العودة إلى الرئيسية',
			_ => null,
		};
	}
}
