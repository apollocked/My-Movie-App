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
	@override late final _Translations$genres$ar genres = _Translations$genres$ar._(_root);
	@override late final _Translations$connectivity$ar connectivity = _Translations$connectivity$ar._(_root);
	@override late final _Translations$not_found$ar not_found = _Translations$not_found$ar._(_root);
	@override late final _Translations$what_to_watch_dialog$ar what_to_watch_dialog = _Translations$what_to_watch_dialog$ar._(_root);
	@override late final _Translations$swipe$ar swipe = _Translations$swipe$ar._(_root);
}

// Path: home
class _Translations$home$ar extends Translations$home$en {
	_Translations$home$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get trending => 'رائج الآن';
	@override String get top_rated => 'الأعلى تقييماً';
	@override String get now_playing => 'يُعرض الآن';
	@override String get popular => 'شائع';
	@override String get upcoming => 'قريباً';
	@override String get action => 'أكشن وإثارة';
	@override String get sci_fi => 'خيال علمي';
	@override String get horror => 'رعب وتشويق';
	@override String get drama => 'دراما';
	@override String get comedy => 'كوميديا';
	@override String get romance => 'رومانسي';
	@override String get thriller => 'إثارة';
	@override String get animation => 'رسوم متحركة';
	@override String get mystery => 'غموض';
}

// Path: search
class _Translations$search$ar extends Translations$search$en {
	_Translations$search$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get explore => 'استكشاف';
	@override String get explore_caps => 'استكشاف';
	@override String get hint => 'ابحث عن الأفلام...';
	@override String get no_results => 'لا توجد نتائج.';
	@override late final _Translations$search$filters$ar filters = _Translations$search$filters$ar._(_root);
	@override String get no_results_subtitle => 'حاول البحث عن شيء آخر';
	@override String get discover_title => 'اكتشف الأفلام';
	@override String get discover_subtitle => 'ابدأ بالكتابة للبحث في ملايين الأفلام والمسلسلات';
	@override String get recent_searches => 'عمليات البحث الأخيرة';
	@override String get clear => 'مسح';
	@override String get browse_categories => 'تصفح حسب الفئات';
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
	@override String get watch_later => 'المشاهدة لاحقاً';
	@override String get favorites => 'مفضلتي';
	@override String get my_favorites => 'مفضلتي';
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
	@override String get dark_mode => 'الوضع المظلم';
	@override String get lang_en => 'English';
	@override String get lang_ku => 'Kurdî';
	@override String get lang_ar => 'العربية';
	@override String get privacy_policy => 'سياسة الخصوصية';
	@override String get legal => 'قانوني';
	@override String get support => 'الدعم';
	@override String get contact_us => 'اتصل بنا';
	@override String get email => 'mahamadbarznji712@gmail.com';
}

// Path: privacy
class _Translations$privacy$ar extends Translations$privacy$en {
	_Translations$privacy$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'سياسة الخصوصية';
	@override String get last_updated => 'آخر تحديث: 26 يونيو 2026';
	@override String get introduction => 'My Movies يحترم خصوصيتك. توضح هذه السياسة كيفية جمع معلوماتك واستخدامها وحمايتها.';
	@override String get info_collect_title => 'المعلومات التي نجمعها';
	@override String get info_collect => 'نجمع فقط الحد الأدنى من المعلومات اللازمة لتقديم خدماتنا. قد يشمل ذلك بريدك الإلكتروني إذا قمت بإنشاء حساب، ومعلومات الاستخدام الأساسية مثل الأفلام التي تحفظها لمشاهدتها لاحقاً أو المفضلة لديك. لا نجمع معلومات شخصية حساسة.';
	@override String get how_use_title => 'كيف نستخدم معلوماتك';
	@override String get how_use => 'يتم استخدام معلوماتك فقط لتخصيص تجربتك، والحفاظ على تفضيلاتك، وتوفير الوظائف الأساسية للتطبيق. نحن لا نبيع معلوماتك لأطراف ثالثة.';
	@override String get data_security_title => 'أمن البيانات';
	@override String get data_security => 'نحن نطبق معايير أمان صناعية لحماية معلوماتك. ومع ذلك، لا توجد طريقة تخزين إلكترونية آمنة بنسبة 100%.';
	@override String get contact_title => 'اتصل بنا';
	@override String get contact => 'إذا كانت لديك أي أسئلة حول هذه السياسة، يرجى الاتصال بنا على support@mymovies.app';
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
	@override String get join_subtitle => 'سجل الدخول للوصول إلى جميع ميزات CineStream.';
	@override String get email => 'البريد الإلكتروني';
	@override String get email_hint => 'أدخل بريدك الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get password_hint => 'أدخل كلمة المرور';
	@override String get confirm_password => 'تأكيد كلمة المرور';
	@override String get confirm_password_hint => 'أعد إدخال كلمة المرور';
	@override String get no_account => 'ليس لديك حساب؟ ';
	@override String get already_account => 'لديك حساب بالفعل؟ ';
	@override String get join_us_subtitle => 'انضم لتقييم وحفظ الأفلام';
	@override String get onboarding_subtitle => 'تصفح ملايين الأفلام، أنشئ قوائمك الخاصة، وقيم أفلامك المفضلة بسهولة.';
	@override String get get_started => 'ابدأ';
	@override String get continue_guest => 'المتابعة كضيف';
	@override String get login_required_desc => 'يرجى تسجيل الدخول لعرض قوائمك';
	@override String get welcome_title => 'مرحباً بك في CineStream';
	@override String get onboarding_settings => 'خصص تجربتك';
	@override late final _Translations$auth$errors$ar errors = _Translations$auth$errors$ar._(_root);
	@override late final _Translations$auth$guest$ar guest = _Translations$auth$guest$ar._(_root);
	@override String get reset_password => 'إعادة تعيين كلمة المرور';
	@override String get reset_subtitle => 'أدخل بريدك الإلكتروني لإرسال رابط إعادة تعيين كلمة المرور.';
	@override String get send_reset_link => 'إرسال رابط إعادة التعيين';
	@override String get reset_sent => 'تم إرسال رابط إعادة التعيين! تحقق من بريدك الإلكتروني.';
	@override String get back_to_login => 'العودة إلى تسجيل الدخول';
}

// Path: onboarding
class _Translations$onboarding$ar extends Translations$onboarding$en {
	_Translations$onboarding$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'تصفح ملايين الأفلام، أنشئ قوائمك الخاصة، وقيم أفلامك المفضلة بسهولة.';
	@override late final _Translations$onboarding$features$ar features = _Translations$onboarding$features$ar._(_root);
	@override late final _Translations$onboarding$tooltips$ar tooltips = _Translations$onboarding$tooltips$ar._(_root);
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
	@override String get overview => 'نظرة عامة';
	@override String get watch_later => 'المشاهدة لاحقاً';
	@override String get saved => 'تم الحفظ';
	@override String get rate_movie => 'قيم الفيلم';
	@override String get added_to_favorites => 'تمت الإضافة إلى المفضلة';
	@override String get removed_from_favorites => 'تمت الإزالة من المفضلة';
	@override String get saved_rating => 'تم حفظ التقييم: ';
	@override late final _Translations$movie_detail$prompts$ar prompts = _Translations$movie_detail$prompts$ar._(_root);
	@override late final _Translations$movie_detail$actions$ar actions = _Translations$movie_detail$actions$ar._(_root);
	@override String get play_trailer => 'تشغيل الإعلان الترويجي';
	@override String get watch_trailer => 'مشاهدة الإعلان الترويجي';
	@override String get on_youtube => 'على يوتيوب';
	@override String get favorite => 'مفضلة';
	@override String get watch => 'شاهد';
	@override String get release_today => 'اليوم';
	@override String get release_1_day => 'يوم واحد';
	@override String get release_days => 'أيام';
	@override String get added_to_watch_later => 'تمت الإضافة إلى المشاهدة لاحقاً';
	@override String get director => 'مخرج';
	@override String get cast => 'الممثلون';
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
	@override String get popular => 'شائع';
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
	@override String get error_title => 'حدث خطأ';
	@override String get see_all => 'عرض الكل';
	@override String get back_to_browse => 'العودة إلى التصفح';
	@override String get collection => 'المجموعة';
	@override String get my_movie => 'My Movie';
}

// Path: genres
class _Translations$genres$ar extends Translations$genres$en {
	_Translations$genres$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get g_28 => 'أكشن';
	@override String get g_12 => 'مغامرة';
	@override String get g_16 => 'رسوم متحركة';
	@override String get g_35 => 'كوميديا';
	@override String get g_80 => 'جريمة';
	@override String get g_99 => 'وثائقي';
	@override String get g_18 => 'دراما';
	@override String get g_10751 => 'عائلي';
	@override String get g_14 => 'فانتازيا';
	@override String get g_36 => 'تاريخي';
	@override String get g_27 => 'رعب';
	@override String get g_10402 => 'موسيقى';
	@override String get g_9648 => 'غموض';
	@override String get g_10749 => 'رومانسي';
	@override String get g_878 => 'خيال علمي';
	@override String get g_10770 => 'فيلم تلفزيوني';
	@override String get g_53 => 'إثارة';
	@override String get g_10752 => 'حرب';
	@override String get g_37 => 'غربي';
}

// Path: connectivity
class _Translations$connectivity$ar extends Translations$connectivity$en {
	_Translations$connectivity$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'لا يوجد اتصال بالإنترنت';
	@override String get description => 'يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى. تطبيق My Movie يتطلب اتصال إنترنت نشط للعمل بشكل صحيح.';
	@override String get troubleshooting_title => 'نصائح لاستكشاف الأخطاء وإصلاحها:';
	@override late final _Translations$connectivity$tips$ar tips = _Translations$connectivity$tips$ar._(_root);
	@override String get check_connection => 'جارٍ التحقق من الاتصال...';
	@override String get retry => 'إعادة المحاولة';
	@override String get offline_banner => 'أنت غير متصل — بعض الخدمات محدودة';
	@override String get browse_watch_later => 'تصفح للمشاهدة لاحقاً';
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

// Path: what_to_watch_dialog
class _Translations$what_to_watch_dialog$ar extends Translations$what_to_watch_dialog$en {
	_Translations$what_to_watch_dialog$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مرحباً بك في ماذا أشاهد';
	@override String get step1_title => 'حدد تفضيلاتك';
	@override String get step1_desc => 'اختر التصنيفات، نطاق التقييم، سنة الإصدار، وترتيب العرض للعثور على ما يناسب مزاجك.';
	@override String get step2_title => 'تصفح الأفلام';
	@override String get step2_desc => 'اسحب لليمين لحفظ الفيلم أو لليسار لتخطيه. اضغط على البطاقة للتفاصيل.';
	@override String get step3_title => 'المشاهدة لاحقاً';
	@override String get step3_desc => 'جميع الأفلام المحفوظة تظهر في ملفك الشخصي تحت المشاهدة لاحقاً.';
	@override String get got_it => 'حسناً!';
}

// Path: swipe
class _Translations$swipe$ar extends Translations$swipe$en {
	_Translations$swipe$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'ماذا أشاهد';
	@override String get save_label => 'حفظ';
	@override String get skip_label => 'تخطي';
	@override String get nope_label => 'لا';
	@override String get watch_later_label => 'المشاهدة لاحقاً';
	@override String get hint => 'اسحب لليمين للحفظ';
	@override String get error_title => 'حدث خطأ';
	@override String get retry => 'إعادة المحاولة';
	@override String get empty_no_movies => 'لا توجد أفلام. جرب مرشحات مختلفة.';
	@override String get change_filters => 'تغيير المرشحات';
	@override String get all_caught_up => 'لقد شاهدت كل الأفلام!';
	@override String get no_movies_added => 'لم تتم إضافة أي فيلم للمشاهدة لاحقاً.';
	@override String get movie_added => 'تمت إضافة الفيلم للمشاهدة لاحقاً!';
	@override String get movies_added => 'تمت إضافة الأفلام للمشاهدة لاحقاً!';
	@override String get view_watch_later => 'عرض المشاهدة لاحقاً';
	@override String get skip => 'تخطي';
	@override String get save => 'حفظ';
	@override String get genres => 'التصنيفات';
	@override String get selected => 'محدد';
	@override String get select_genres => 'اختر التصنيفات';
	@override String get minimum_rating => 'الحد الأدنى للتقييم';
	@override String get release_year => 'سنة الإصدار';
	@override String get sort_by => 'ترتيب حسب';
	@override String get start_swiping => 'ابدأ التصفح';
	@override String get year_from => 'من';
	@override String get year_to => 'إلى';
	@override String get year_any => 'أي';
	@override late final _Translations$swipe$sort_options$ar sort_options = _Translations$swipe$sort_options$ar._(_root);
}

// Path: search.filters
class _Translations$search$filters$ar extends Translations$search$filters$en {
	_Translations$search$filters$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get all => 'الكل';
	@override String get movies => 'أفلام';
	@override String get tv_shows => 'مسلسلات';
	@override String get actors => 'ممثلين';
}

// Path: auth.errors
class _Translations$auth$errors$ar extends Translations$auth$errors$en {
	_Translations$auth$errors$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get email_required => 'البريد الإلكتروني مطلوب';
	@override String get invalid_email => 'أدخل بريداً إلكترونياً صحيحاً';
	@override String get password_required => 'كلمة المرور مطلوبة';
	@override String get password_too_short => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
	@override String get confirm_password_required => 'يرجى تأكيد كلمة المرور';
	@override String get passwords_dont_match => 'كلمتا المرور غير متطابقتين';
}

// Path: auth.guest
class _Translations$auth$guest$ar extends Translations$auth$guest$en {
	_Translations$auth$guest$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get kContinue => 'المتابعة كضيف';
	@override String get get_started => 'ابدأ / تسجيل الدخول';
}

// Path: onboarding.features
class _Translations$onboarding$features$ar extends Translations$onboarding$features$en {
	_Translations$onboarding$features$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$features$browse$ar browse = _Translations$onboarding$features$browse$ar._(_root);
	@override late final _Translations$onboarding$features$recommend$ar recommend = _Translations$onboarding$features$recommend$ar._(_root);
	@override late final _Translations$onboarding$features$favorites$ar favorites = _Translations$onboarding$features$favorites$ar._(_root);
	@override late final _Translations$onboarding$features$watch_later$ar watch_later = _Translations$onboarding$features$watch_later$ar._(_root);
}

// Path: onboarding.tooltips
class _Translations$onboarding$tooltips$ar extends Translations$onboarding$tooltips$en {
	_Translations$onboarding$tooltips$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$onboarding$tooltips$browse$ar browse = _Translations$onboarding$tooltips$browse$ar._(_root);
	@override late final _Translations$onboarding$tooltips$recommend$ar recommend = _Translations$onboarding$tooltips$recommend$ar._(_root);
	@override late final _Translations$onboarding$tooltips$search$ar search = _Translations$onboarding$tooltips$search$ar._(_root);
	@override late final _Translations$onboarding$tooltips$settings$ar settings = _Translations$onboarding$tooltips$settings$ar._(_root);
	@override late final _Translations$onboarding$tooltips$profile$ar profile = _Translations$onboarding$tooltips$profile$ar._(_root);
}

// Path: guest_features.favorites
class _Translations$guest_features$favorites$ar extends Translations$guest_features$favorites$en {
	_Translations$guest_features$favorites$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'نظم مفضلتك';
	@override String get desc => 'احتفظ بالأفلام التي تعجبك.';
}

// Path: guest_features.rate
class _Translations$guest_features$rate$ar extends Translations$guest_features$rate$en {
	_Translations$guest_features$rate$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'قيم وشارك برأيك';
	@override String get desc => 'شارك بآرائك.';
}

// Path: guest_features.watch_later
class _Translations$guest_features$watch_later$ar extends Translations$guest_features$watch_later$en {
	_Translations$guest_features$watch_later$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'المشاهدة لاحقاً';
	@override String get desc => 'لا تفوت أبداً الأفلام التي تريد مشاهدتها.';
}

// Path: guest_features.sync
class _Translations$guest_features$sync$ar extends Translations$guest_features$sync$en {
	_Translations$guest_features$sync$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'المزامنة عبر الأجهزة';
	@override String get desc => 'تبقى بياناتك محفوظة بأمان عبر جميع أجهزتك.';
}

// Path: movie_detail.prompts
class _Translations$movie_detail$prompts$ar extends Translations$movie_detail$prompts$en {
	_Translations$movie_detail$prompts$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get login_required => 'تسجيل الدخول مطلوب';
	@override String get please_sign_in => 'يرجى تسجيل الدخول لـ ';
	@override String get go_to_login => 'اذهب إلى صفحة تسجيل الدخول';
	@override String get rate_title => 'قيم هذا الفيلم';
	@override String get slide_to_rate => 'اسحب لتحديد تقييمك';
}

// Path: movie_detail.actions
class _Translations$movie_detail$actions$ar extends Translations$movie_detail$actions$en {
	_Translations$movie_detail$actions$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get add_watch_later => 'أضف إلى المشاهدة لاحقاً';
	@override String get rate_movies => 'قيم الأفلام';
}

// Path: connectivity.tips
class _Translations$connectivity$tips$ar extends Translations$connectivity$tips$en {
	_Translations$connectivity$tips$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get airplane_mode => '✓ تحقق من وضع الطائرة';
	@override String get check_data => '✓ تحقق من اتصال WiFi أو بيانات الجوال';
	@override String get move_closer => '✓ اقترب من جهاز توجيه WiFi';
	@override String get restart_device => '✓ أعد تشغيل جهازك';
}

// Path: swipe.sort_options
class _Translations$swipe$sort_options$ar extends Translations$swipe$sort_options$en {
	_Translations$swipe$sort_options$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get most_popular => 'الأكثر شعبية';
	@override String get highest_rated => 'الأعلى تقييماً';
	@override String get newest_first => 'الأحدث أولاً';
	@override String get oldest_first => 'الأقدم أولاً';
	@override String get highest_revenue => 'الأعلى إيرادات';
}

// Path: onboarding.features.browse
class _Translations$onboarding$features$browse$ar extends Translations$onboarding$features$browse$en {
	_Translations$onboarding$features$browse$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تصفح واكتشف';
	@override String get desc => 'شاهد الأفلام الرائجة والأعلى تقييماً والقادمة.';
}

// Path: onboarding.features.recommend
class _Translations$onboarding$features$recommend$ar extends Translations$onboarding$features$recommend$en {
	_Translations$onboarding$features$recommend$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اقتراحات ذكية';
	@override String get desc => 'اسحب لاكتشاف توصيات أفلام مخصصة لك.';
}

// Path: onboarding.features.favorites
class _Translations$onboarding$features$favorites$ar extends Translations$onboarding$features$favorites$en {
	_Translations$onboarding$features$favorites$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'المفضلة والتقييمات';
	@override String get desc => 'احفظ أفلامك المفضلة وسجل تقييماتك.';
}

// Path: onboarding.features.watch_later
class _Translations$onboarding$features$watch_later$ar extends Translations$onboarding$features$watch_later$en {
	_Translations$onboarding$features$watch_later$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'المشاهدة لاحقاً';
	@override String get desc => 'أنشئ قائمة مخصصة من الأفلام لمشاهدتها لاحقاً.';
}

// Path: onboarding.tooltips.browse
class _Translations$onboarding$tooltips$browse$ar extends Translations$onboarding$tooltips$browse$en {
	_Translations$onboarding$tooltips$browse$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'السينما';
	@override String get desc => 'تصفح الأفلام الجديدة واكتشف ما يُعرض الآن';
}

// Path: onboarding.tooltips.recommend
class _Translations$onboarding$tooltips$recommend$ar extends Translations$onboarding$tooltips$recommend$en {
	_Translations$onboarding$tooltips$recommend$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'ماذا أشاهد';
	@override String get desc => 'اسحب لاكتشاف توصيات أفلام مخصصة لك';
}

// Path: onboarding.tooltips.search
class _Translations$onboarding$tooltips$search$ar extends Translations$onboarding$tooltips$search$en {
	_Translations$onboarding$tooltips$search$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'استكشاف';
	@override String get desc => 'ابحث عن الأفلام والمسلسلات والممثلين';
}

// Path: onboarding.tooltips.settings
class _Translations$onboarding$tooltips$settings$ar extends Translations$onboarding$tooltips$settings$en {
	_Translations$onboarding$tooltips$settings$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الإعدادات';
	@override String get desc => 'تخصيص اللغة والسمات وتفضيلات التطبيق';
}

// Path: onboarding.tooltips.profile
class _Translations$onboarding$tooltips$profile$ar extends Translations$onboarding$tooltips$profile$en {
	_Translations$onboarding$tooltips$profile$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الملف الشخصي';
	@override String get desc => 'إدارة قائمة المشاهدة لاحقاً والمفضلة والإعدادات';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'home.trending' => 'رائج الآن',
			'home.top_rated' => 'الأعلى تقييماً',
			'home.now_playing' => 'يُعرض الآن',
			'home.popular' => 'شائع',
			'home.upcoming' => 'قريباً',
			'home.action' => 'أكشن وإثارة',
			'home.sci_fi' => 'خيال علمي',
			'home.horror' => 'رعب وتشويق',
			'home.drama' => 'دراما',
			'home.comedy' => 'كوميديا',
			'home.romance' => 'رومانسي',
			'home.thriller' => 'إثارة',
			'home.animation' => 'رسوم متحركة',
			'home.mystery' => 'غموض',
			'search.explore' => 'استكشاف',
			'search.explore_caps' => 'استكشاف',
			'search.hint' => 'ابحث عن الأفلام...',
			'search.no_results' => 'لا توجد نتائج.',
			'search.filters.all' => 'الكل',
			'search.filters.movies' => 'أفلام',
			'search.filters.tv_shows' => 'مسلسلات',
			'search.filters.actors' => 'ممثلين',
			'search.no_results_subtitle' => 'حاول البحث عن شيء آخر',
			'search.discover_title' => 'اكتشف الأفلام',
			'search.discover_subtitle' => 'ابدأ بالكتابة للبحث في ملايين الأفلام والمسلسلات',
			'search.recent_searches' => 'عمليات البحث الأخيرة',
			'search.clear' => 'مسح',
			'search.browse_categories' => 'تصفح حسب الفئات',
			'search.browse_all' => 'تصفح الكل',
			'search.top_rated_badge' => 'الأعلى تقييماً',
			'search.browse' => 'تصفح',
			'profile.title' => 'الملف الشخصي',
			'profile.my_activity' => 'نشاطي',
			'profile.watch_later' => 'المشاهدة لاحقاً',
			'profile.favorites' => 'مفضلتي',
			'profile.my_favorites' => 'مفضلتي',
			'profile.ratings' => 'تقييماتي',
			'profile.my_ratings' => 'تقييماتي',
			'profile.account' => 'الحساب',
			'profile.logout' => 'تسجيل الخروج',
			'profile.logout_confirm' => 'هل أنت متأكد من تسجيل الخروج؟',
			'profile.default_name' => 'مشاهد CineVault',
			'settings.title' => 'الإعدادات',
			'settings.language' => 'اللغة',
			'settings.dark_mode' => 'الوضع المظلم',
			'settings.lang_en' => 'English',
			'settings.lang_ku' => 'Kurdî',
			'settings.lang_ar' => 'العربية',
			'settings.privacy_policy' => 'سياسة الخصوصية',
			'settings.legal' => 'قانوني',
			'settings.support' => 'الدعم',
			'settings.contact_us' => 'اتصل بنا',
			'settings.email' => 'mahamadbarznji712@gmail.com',
			'privacy.title' => 'سياسة الخصوصية',
			'privacy.last_updated' => 'آخر تحديث: 26 يونيو 2026',
			'privacy.introduction' => 'My Movies يحترم خصوصيتك. توضح هذه السياسة كيفية جمع معلوماتك واستخدامها وحمايتها.',
			'privacy.info_collect_title' => 'المعلومات التي نجمعها',
			'privacy.info_collect' => 'نجمع فقط الحد الأدنى من المعلومات اللازمة لتقديم خدماتنا. قد يشمل ذلك بريدك الإلكتروني إذا قمت بإنشاء حساب، ومعلومات الاستخدام الأساسية مثل الأفلام التي تحفظها لمشاهدتها لاحقاً أو المفضلة لديك. لا نجمع معلومات شخصية حساسة.',
			'privacy.how_use_title' => 'كيف نستخدم معلوماتك',
			'privacy.how_use' => 'يتم استخدام معلوماتك فقط لتخصيص تجربتك، والحفاظ على تفضيلاتك، وتوفير الوظائف الأساسية للتطبيق. نحن لا نبيع معلوماتك لأطراف ثالثة.',
			'privacy.data_security_title' => 'أمن البيانات',
			'privacy.data_security' => 'نحن نطبق معايير أمان صناعية لحماية معلوماتك. ومع ذلك، لا توجد طريقة تخزين إلكترونية آمنة بنسبة 100%.',
			'privacy.contact_title' => 'اتصل بنا',
			'privacy.contact' => 'إذا كانت لديك أي أسئلة حول هذه السياسة، يرجى الاتصال بنا على support@mymovies.app',
			'auth.login' => 'تسجيل الدخول',
			'auth.signup' => 'إنشاء حساب',
			'auth.create_account' => 'إنشاء حساب',
			'auth.welcome_back' => 'مرحباً بعودتك',
			'auth.login_subtitle' => 'سجل الدخول إلى حسابك',
			'auth.join_community' => 'انضم إلى المجتمع',
			'auth.join_subtitle' => 'سجل الدخول للوصول إلى جميع ميزات CineStream.',
			'auth.email' => 'البريد الإلكتروني',
			'auth.email_hint' => 'أدخل بريدك الإلكتروني',
			'auth.password' => 'كلمة المرور',
			'auth.password_hint' => 'أدخل كلمة المرور',
			'auth.confirm_password' => 'تأكيد كلمة المرور',
			'auth.confirm_password_hint' => 'أعد إدخال كلمة المرور',
			'auth.no_account' => 'ليس لديك حساب؟ ',
			'auth.already_account' => 'لديك حساب بالفعل؟ ',
			'auth.join_us_subtitle' => 'انضم لتقييم وحفظ الأفلام',
			'auth.onboarding_subtitle' => 'تصفح ملايين الأفلام، أنشئ قوائمك الخاصة، وقيم أفلامك المفضلة بسهولة.',
			'auth.get_started' => 'ابدأ',
			'auth.continue_guest' => 'المتابعة كضيف',
			'auth.login_required_desc' => 'يرجى تسجيل الدخول لعرض قوائمك',
			'auth.welcome_title' => 'مرحباً بك في CineStream',
			'auth.onboarding_settings' => 'خصص تجربتك',
			'auth.errors.email_required' => 'البريد الإلكتروني مطلوب',
			'auth.errors.invalid_email' => 'أدخل بريداً إلكترونياً صحيحاً',
			'auth.errors.password_required' => 'كلمة المرور مطلوبة',
			'auth.errors.password_too_short' => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
			'auth.errors.confirm_password_required' => 'يرجى تأكيد كلمة المرور',
			'auth.errors.passwords_dont_match' => 'كلمتا المرور غير متطابقتين',
			'auth.guest.kContinue' => 'المتابعة كضيف',
			'auth.guest.get_started' => 'ابدأ / تسجيل الدخول',
			'auth.reset_password' => 'إعادة تعيين كلمة المرور',
			'auth.reset_subtitle' => 'أدخل بريدك الإلكتروني لإرسال رابط إعادة تعيين كلمة المرور.',
			'auth.send_reset_link' => 'إرسال رابط إعادة التعيين',
			'auth.reset_sent' => 'تم إرسال رابط إعادة التعيين! تحقق من بريدك الإلكتروني.',
			'auth.back_to_login' => 'العودة إلى تسجيل الدخول',
			'onboarding.subtitle' => 'تصفح ملايين الأفلام، أنشئ قوائمك الخاصة، وقيم أفلامك المفضلة بسهولة.',
			'onboarding.features.browse.title' => 'تصفح واكتشف',
			'onboarding.features.browse.desc' => 'شاهد الأفلام الرائجة والأعلى تقييماً والقادمة.',
			'onboarding.features.recommend.title' => 'اقتراحات ذكية',
			'onboarding.features.recommend.desc' => 'اسحب لاكتشاف توصيات أفلام مخصصة لك.',
			'onboarding.features.favorites.title' => 'المفضلة والتقييمات',
			'onboarding.features.favorites.desc' => 'احفظ أفلامك المفضلة وسجل تقييماتك.',
			'onboarding.features.watch_later.title' => 'المشاهدة لاحقاً',
			'onboarding.features.watch_later.desc' => 'أنشئ قائمة مخصصة من الأفلام لمشاهدتها لاحقاً.',
			'onboarding.tooltips.browse.title' => 'السينما',
			'onboarding.tooltips.browse.desc' => 'تصفح الأفلام الجديدة واكتشف ما يُعرض الآن',
			'onboarding.tooltips.recommend.title' => 'ماذا أشاهد',
			'onboarding.tooltips.recommend.desc' => 'اسحب لاكتشاف توصيات أفلام مخصصة لك',
			'onboarding.tooltips.search.title' => 'استكشاف',
			'onboarding.tooltips.search.desc' => 'ابحث عن الأفلام والمسلسلات والممثلين',
			'onboarding.tooltips.settings.title' => 'الإعدادات',
			'onboarding.tooltips.settings.desc' => 'تخصيص اللغة والسمات وتفضيلات التطبيق',
			'onboarding.tooltips.profile.title' => 'الملف الشخصي',
			'onboarding.tooltips.profile.desc' => 'إدارة قائمة المشاهدة لاحقاً والمفضلة والإعدادات',
			'guest_features.favorites.title' => 'نظم مفضلتك',
			'guest_features.favorites.desc' => 'احتفظ بالأفلام التي تعجبك.',
			'guest_features.rate.title' => 'قيم وشارك برأيك',
			'guest_features.rate.desc' => 'شارك بآرائك.',
			'guest_features.watch_later.title' => 'المشاهدة لاحقاً',
			'guest_features.watch_later.desc' => 'لا تفوت أبداً الأفلام التي تريد مشاهدتها.',
			'guest_features.sync.title' => 'المزامنة عبر الأجهزة',
			'guest_features.sync.desc' => 'تبقى بياناتك محفوظة بأمان عبر جميع أجهزتك.',
			'movie_detail.overview' => 'نظرة عامة',
			'movie_detail.watch_later' => 'المشاهدة لاحقاً',
			'movie_detail.saved' => 'تم الحفظ',
			'movie_detail.rate_movie' => 'قيم الفيلم',
			'movie_detail.added_to_favorites' => 'تمت الإضافة إلى المفضلة',
			'movie_detail.removed_from_favorites' => 'تمت الإزالة من المفضلة',
			'movie_detail.saved_rating' => 'تم حفظ التقييم: ',
			'movie_detail.prompts.login_required' => 'تسجيل الدخول مطلوب',
			'movie_detail.prompts.please_sign_in' => 'يرجى تسجيل الدخول لـ ',
			'movie_detail.prompts.go_to_login' => 'اذهب إلى صفحة تسجيل الدخول',
			'movie_detail.prompts.rate_title' => 'قيم هذا الفيلم',
			'movie_detail.prompts.slide_to_rate' => 'اسحب لتحديد تقييمك',
			'movie_detail.actions.add_watch_later' => 'أضف إلى المشاهدة لاحقاً',
			'movie_detail.actions.rate_movies' => 'قيم الأفلام',
			'movie_detail.play_trailer' => 'تشغيل الإعلان الترويجي',
			'movie_detail.watch_trailer' => 'مشاهدة الإعلان الترويجي',
			'movie_detail.on_youtube' => 'على يوتيوب',
			'movie_detail.favorite' => 'مفضلة',
			'movie_detail.watch' => 'شاهد',
			'movie_detail.release_today' => 'اليوم',
			'movie_detail.release_1_day' => 'يوم واحد',
			'movie_detail.release_days' => 'أيام',
			'movie_detail.added_to_watch_later' => 'تمت الإضافة إلى المشاهدة لاحقاً',
			'movie_detail.director' => 'مخرج',
			'movie_detail.cast' => 'الممثلون',
			'movie_detail.you_might_also_like' => 'قد يعجبك أيضاً',
			'actor.born' => 'تاريخ الميلاد:',
			'actor.biography' => 'السيرة الذاتية',
			'actor.filmography' => 'قائمة الأفلام',
			'tv.popular' => 'شائع',
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
			'common.error_title' => 'حدث خطأ',
			'common.see_all' => 'عرض الكل',
			'common.back_to_browse' => 'العودة إلى التصفح',
			'common.collection' => 'المجموعة',
			'common.my_movie' => 'My Movie',
			'genres.g_28' => 'أكشن',
			'genres.g_12' => 'مغامرة',
			'genres.g_16' => 'رسوم متحركة',
			'genres.g_35' => 'كوميديا',
			'genres.g_80' => 'جريمة',
			'genres.g_99' => 'وثائقي',
			'genres.g_18' => 'دراما',
			'genres.g_10751' => 'عائلي',
			'genres.g_14' => 'فانتازيا',
			'genres.g_36' => 'تاريخي',
			'genres.g_27' => 'رعب',
			'genres.g_10402' => 'موسيقى',
			'genres.g_9648' => 'غموض',
			'genres.g_10749' => 'رومانسي',
			'genres.g_878' => 'خيال علمي',
			'genres.g_10770' => 'فيلم تلفزيوني',
			'genres.g_53' => 'إثارة',
			'genres.g_10752' => 'حرب',
			'genres.g_37' => 'غربي',
			'connectivity.title' => 'لا يوجد اتصال بالإنترنت',
			'connectivity.description' => 'يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى. تطبيق My Movie يتطلب اتصال إنترنت نشط للعمل بشكل صحيح.',
			'connectivity.troubleshooting_title' => 'نصائح لاستكشاف الأخطاء وإصلاحها:',
			'connectivity.tips.airplane_mode' => '✓ تحقق من وضع الطائرة',
			'connectivity.tips.check_data' => '✓ تحقق من اتصال WiFi أو بيانات الجوال',
			'connectivity.tips.move_closer' => '✓ اقترب من جهاز توجيه WiFi',
			'connectivity.tips.restart_device' => '✓ أعد تشغيل جهازك',
			'connectivity.check_connection' => 'جارٍ التحقق من الاتصال...',
			'connectivity.retry' => 'إعادة المحاولة',
			'connectivity.offline_banner' => 'أنت غير متصل — بعض الخدمات محدودة',
			'connectivity.browse_watch_later' => 'تصفح للمشاهدة لاحقاً',
			'not_found.title' => 'الصفحة غير موجودة',
			'not_found.title_404' => '404 - الصفحة غير موجودة',
			'not_found.subtitle' => 'الصفحة التي تبحث عنها غير موجودة أو تم نقلها.',
			'not_found.return_home' => 'العودة إلى الرئيسية',
			'what_to_watch_dialog.title' => 'مرحباً بك في ماذا أشاهد',
			'what_to_watch_dialog.step1_title' => 'حدد تفضيلاتك',
			'what_to_watch_dialog.step1_desc' => 'اختر التصنيفات، نطاق التقييم، سنة الإصدار، وترتيب العرض للعثور على ما يناسب مزاجك.',
			'what_to_watch_dialog.step2_title' => 'تصفح الأفلام',
			'what_to_watch_dialog.step2_desc' => 'اسحب لليمين لحفظ الفيلم أو لليسار لتخطيه. اضغط على البطاقة للتفاصيل.',
			'what_to_watch_dialog.step3_title' => 'المشاهدة لاحقاً',
			'what_to_watch_dialog.step3_desc' => 'جميع الأفلام المحفوظة تظهر في ملفك الشخصي تحت المشاهدة لاحقاً.',
			'what_to_watch_dialog.got_it' => 'حسناً!',
			'swipe.title' => 'ماذا أشاهد',
			'swipe.save_label' => 'حفظ',
			'swipe.skip_label' => 'تخطي',
			'swipe.nope_label' => 'لا',
			'swipe.watch_later_label' => 'المشاهدة لاحقاً',
			'swipe.hint' => 'اسحب لليمين للحفظ',
			'swipe.error_title' => 'حدث خطأ',
			'swipe.retry' => 'إعادة المحاولة',
			'swipe.empty_no_movies' => 'لا توجد أفلام. جرب مرشحات مختلفة.',
			'swipe.change_filters' => 'تغيير المرشحات',
			'swipe.all_caught_up' => 'لقد شاهدت كل الأفلام!',
			'swipe.no_movies_added' => 'لم تتم إضافة أي فيلم للمشاهدة لاحقاً.',
			'swipe.movie_added' => 'تمت إضافة الفيلم للمشاهدة لاحقاً!',
			'swipe.movies_added' => 'تمت إضافة الأفلام للمشاهدة لاحقاً!',
			'swipe.view_watch_later' => 'عرض المشاهدة لاحقاً',
			'swipe.skip' => 'تخطي',
			'swipe.save' => 'حفظ',
			'swipe.genres' => 'التصنيفات',
			'swipe.selected' => 'محدد',
			'swipe.select_genres' => 'اختر التصنيفات',
			'swipe.minimum_rating' => 'الحد الأدنى للتقييم',
			'swipe.release_year' => 'سنة الإصدار',
			'swipe.sort_by' => 'ترتيب حسب',
			'swipe.start_swiping' => 'ابدأ التصفح',
			'swipe.year_from' => 'من',
			'swipe.year_to' => 'إلى',
			'swipe.year_any' => 'أي',
			'swipe.sort_options.most_popular' => 'الأكثر شعبية',
			'swipe.sort_options.highest_rated' => 'الأعلى تقييماً',
			'swipe.sort_options.newest_first' => 'الأحدث أولاً',
			'swipe.sort_options.oldest_first' => 'الأقدم أولاً',
			'swipe.sort_options.highest_revenue' => 'الأعلى إيرادات',
			_ => null,
		};
	}
}
