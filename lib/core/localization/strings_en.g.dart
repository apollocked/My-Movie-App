///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$home$en home = Translations$home$en.internal(_root);
	late final Translations$search$en search = Translations$search$en.internal(_root);
	late final Translations$profile$en profile = Translations$profile$en.internal(_root);
	late final Translations$settings$en settings = Translations$settings$en.internal(_root);
	late final Translations$privacy$en privacy = Translations$privacy$en.internal(_root);
	late final Translations$auth$en auth = Translations$auth$en.internal(_root);
	late final Translations$onboarding$en onboarding = Translations$onboarding$en.internal(_root);
	late final Translations$guest_features$en guest_features = Translations$guest_features$en.internal(_root);
	late final Translations$movie_detail$en movie_detail = Translations$movie_detail$en.internal(_root);
	late final Translations$actor$en actor = Translations$actor$en.internal(_root);
	late final Translations$tv$en tv = Translations$tv$en.internal(_root);
	late final Translations$common$en common = Translations$common$en.internal(_root);
	late final Translations$genres$en genres = Translations$genres$en.internal(_root);
	late final Translations$connectivity$en connectivity = Translations$connectivity$en.internal(_root);
	late final Translations$not_found$en not_found = Translations$not_found$en.internal(_root);
	late final Translations$what_to_watch_dialog$en what_to_watch_dialog = Translations$what_to_watch_dialog$en.internal(_root);
	late final Translations$swipe$en swipe = Translations$swipe$en.internal(_root);
}

// Path: home
class Translations$home$en {
	Translations$home$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Trending Now'
	String get trending => 'Trending Now';

	/// en: 'Top Rated Movies'
	String get top_rated => 'Top Rated Movies';

	/// en: 'Now Playing'
	String get now_playing => 'Now Playing';

	/// en: 'Popular'
	String get popular => 'Popular';

	/// en: 'Upcoming'
	String get upcoming => 'Upcoming';

	/// en: 'Action Thrillers'
	String get action => 'Action Thrillers';

	/// en: 'Sci-Fi Explorations'
	String get sci_fi => 'Sci-Fi Explorations';

	/// en: 'Horror & Suspense'
	String get horror => 'Horror & Suspense';

	/// en: 'Dramatic Masterpieces'
	String get drama => 'Dramatic Masterpieces';

	/// en: 'Laughter & Comedy'
	String get comedy => 'Laughter & Comedy';

	/// en: 'Romantic Stories'
	String get romance => 'Romantic Stories';

	/// en: 'Edge-of-Seat Thrillers'
	String get thriller => 'Edge-of-Seat Thrillers';

	/// en: 'Animated Worlds'
	String get animation => 'Animated Worlds';

	/// en: 'Mystery & Detective'
	String get mystery => 'Mystery & Detective';
}

// Path: search
class Translations$search$en {
	Translations$search$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Explore'
	String get explore => 'Explore';

	/// en: 'EXPLORE'
	String get explore_caps => 'EXPLORE';

	/// en: 'Search movies...'
	String get hint => 'Search movies...';

	/// en: 'No results found.'
	String get no_results => 'No results found.';

	late final Translations$search$filters$en filters = Translations$search$filters$en.internal(_root);

	/// en: 'Try searching for something else'
	String get no_results_subtitle => 'Try searching for something else';

	/// en: 'Discover Movies'
	String get discover_title => 'Discover Movies';

	/// en: 'Start typing to explore millions of movies and TV shows'
	String get discover_subtitle => 'Start typing to explore millions of movies and TV shows';

	/// en: 'Recent Searches'
	String get recent_searches => 'Recent Searches';

	/// en: 'Clear'
	String get clear => 'Clear';

	/// en: 'Browse Categories'
	String get browse_categories => 'Browse Categories';

	/// en: 'Browse All'
	String get browse_all => 'Browse All';

	/// en: 'TOP RATED'
	String get top_rated_badge => 'TOP RATED';

	/// en: 'Browse'
	String get browse => 'Browse';
}

// Path: profile
class Translations$profile$en {
	Translations$profile$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile'
	String get title => 'Profile';

	/// en: 'My Activity'
	String get my_activity => 'My Activity';

	/// en: 'Watch Later'
	String get watch_later => 'Watch Later';

	/// en: 'My Favorites'
	String get favorites => 'My Favorites';

	/// en: 'My Favorites'
	String get my_favorites => 'My Favorites';

	/// en: 'My Ratings'
	String get ratings => 'My Ratings';

	/// en: 'My Ratings'
	String get my_ratings => 'My Ratings';

	/// en: 'Account'
	String get account => 'Account';

	/// en: 'Log Out'
	String get logout => 'Log Out';

	/// en: 'Are you sure you want to log out?'
	String get logout_confirm => 'Are you sure you want to log out?';

	/// en: 'Movie Lover'
	String get default_name => 'Movie Lover';
}

// Path: settings
class Translations$settings$en {
	Translations$settings$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Setup'
	String get title => 'Setup';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Dark Mode'
	String get dark_mode => 'Dark Mode';

	/// en: 'English'
	String get lang_en => 'English';

	/// en: 'Kurdish'
	String get lang_ku => 'Kurdish';

	/// en: 'Arabic'
	String get lang_ar => 'Arabic';

	/// en: 'Privacy Policy'
	String get privacy_policy => 'Privacy Policy';

	/// en: 'Legal'
	String get legal => 'Legal';

	/// en: 'Support'
	String get support => 'Support';

	/// en: 'Contact Us'
	String get contact_us => 'Contact Us';

	/// en: 'mahamadbarznji712@gmail.com'
	String get email => 'mahamadbarznji712@gmail.com';
}

// Path: privacy
class Translations$privacy$en {
	Translations$privacy$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Privacy Policy'
	String get title => 'Privacy Policy';

	/// en: 'Last updated: June 26, 2026'
	String get last_updated => 'Last updated: June 26, 2026';

	/// en: 'My Movies respects your privacy. This Privacy Policy explains how we collect, use, and protect your information when you use our app.'
	String get introduction => 'My Movies respects your privacy. This Privacy Policy explains how we collect, use, and protect your information when you use our app.';

	/// en: 'Information We Collect'
	String get info_collect_title => 'Information We Collect';

	/// en: 'We collect minimal information necessary to provide our services. This may include your email address if you create an account, and basic usage data such as movies you save to your watch list or favorites. We do not collect sensitive personal information.'
	String get info_collect => 'We collect minimal information necessary to provide our services. This may include your email address if you create an account, and basic usage data such as movies you save to your watch list or favorites. We do not collect sensitive personal information.';

	/// en: 'How We Use Your Information'
	String get how_use_title => 'How We Use Your Information';

	/// en: 'Your information is used solely to personalize your experience, save your preferences, and provide the core functionality of the app. We do not sell your data to third parties.'
	String get how_use => 'Your information is used solely to personalize your experience, save your preferences, and provide the core functionality of the app. We do not sell your data to third parties.';

	/// en: 'Data Security'
	String get data_security_title => 'Data Security';

	/// en: 'We implement industry-standard security measures to protect your information. However, no method of electronic storage is 100%% secure.'
	String get data_security => 'We implement industry-standard security measures to protect your information. However, no method of electronic storage is 100%% secure.';

	/// en: 'Contact Us'
	String get contact_title => 'Contact Us';

	/// en: 'If you have questions about this Privacy Policy, please contact us at mahamadbarznji712@gmail.com'
	String get contact => 'If you have questions about this Privacy Policy, please contact us at mahamadbarznji712@gmail.com';
}

// Path: auth
class Translations$auth$en {
	Translations$auth$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Sign up'
	String get signup => 'Sign up';

	/// en: 'Create Account'
	String get create_account => 'Create Account';

	/// en: 'Welcome Back'
	String get welcome_back => 'Welcome Back';

	/// en: 'Log in to your account'
	String get login_subtitle => 'Log in to your account';

	/// en: 'Join the Community'
	String get join_community => 'Join the Community';

	/// en: 'Sign in to unlock the full potential of My Movies and personalize your movie experience.'
	String get join_subtitle => 'Sign in to unlock the full potential of My Movies and personalize your movie experience.';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Enter your email'
	String get email_hint => 'Enter your email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Enter your password'
	String get password_hint => 'Enter your password';

	/// en: 'Confirm Password'
	String get confirm_password => 'Confirm Password';

	/// en: 'Re-enter your password'
	String get confirm_password_hint => 'Re-enter your password';

	/// en: 'Don't have an account? '
	String get no_account => 'Don\'t have an account? ';

	/// en: 'Already have an account? '
	String get already_account => 'Already have an account? ';

	/// en: 'Join us to rate and save movies'
	String get join_us_subtitle => 'Join us to rate and save movies';

	/// en: 'Discover millions of movies, build personalized tracklists, and rate your favorite titles easily.'
	String get onboarding_subtitle => 'Discover millions of movies, build personalized tracklists, and rate your favorite titles easily.';

	/// en: 'Get Started'
	String get get_started => 'Get Started';

	/// en: 'Continue as Guest'
	String get continue_guest => 'Continue as Guest';

	/// en: 'Please log in to view your collection'
	String get login_required_desc => 'Please log in to view your collection';

	/// en: 'Welcome to My Movies'
	String get welcome_title => 'Welcome to My Movies';

	/// en: 'Customize your experience'
	String get onboarding_settings => 'Customize your experience';

	late final Translations$auth$errors$en errors = Translations$auth$errors$en.internal(_root);
	late final Translations$auth$guest$en guest = Translations$auth$guest$en.internal(_root);

	/// en: 'Reset Password'
	String get reset_password => 'Reset Password';

	/// en: 'Enter your email address and we'll send you a link to reset your password.'
	String get reset_subtitle => 'Enter your email address and we\'ll send you a link to reset your password.';

	/// en: 'Send Reset Link'
	String get send_reset_link => 'Send Reset Link';

	/// en: 'Reset link sent! Check your email inbox.'
	String get reset_sent => 'Reset link sent! Check your email inbox.';

	/// en: 'Back to Login'
	String get back_to_login => 'Back to Login';
}

// Path: onboarding
class Translations$onboarding$en {
	Translations$onboarding$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Discover millions of movies, build personalized tracklists, and rate your favorite titles easily.'
	String get subtitle => 'Discover millions of movies, build personalized tracklists, and rate your favorite titles easily.';

	late final Translations$onboarding$features$en features = Translations$onboarding$features$en.internal(_root);
	late final Translations$onboarding$tooltips$en tooltips = Translations$onboarding$tooltips$en.internal(_root);
}

// Path: guest_features
class Translations$guest_features$en {
	Translations$guest_features$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$guest_features$favorites$en favorites = Translations$guest_features$favorites$en.internal(_root);
	late final Translations$guest_features$rate$en rate = Translations$guest_features$rate$en.internal(_root);
	late final Translations$guest_features$watch_later$en watch_later = Translations$guest_features$watch_later$en.internal(_root);
	late final Translations$guest_features$sync$en sync = Translations$guest_features$sync$en.internal(_root);
}

// Path: movie_detail
class Translations$movie_detail$en {
	Translations$movie_detail$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Overview'
	String get overview => 'Overview';

	/// en: 'Watch Later'
	String get watch_later => 'Watch Later';

	/// en: 'Saved'
	String get saved => 'Saved';

	/// en: 'Rate Movie'
	String get rate_movie => 'Rate Movie';

	/// en: 'Added to favorites'
	String get added_to_favorites => 'Added to favorites';

	/// en: 'Removed from favorites'
	String get removed_from_favorites => 'Removed from favorites';

	/// en: 'Saved rating: '
	String get saved_rating => 'Saved rating: ';

	late final Translations$movie_detail$prompts$en prompts = Translations$movie_detail$prompts$en.internal(_root);
	late final Translations$movie_detail$actions$en actions = Translations$movie_detail$actions$en.internal(_root);

	/// en: 'Play Trailer'
	String get play_trailer => 'Play Trailer';

	/// en: 'Watch Trailer'
	String get watch_trailer => 'Watch Trailer';

	/// en: 'on YouTube'
	String get on_youtube => 'on YouTube';

	/// en: 'Favorite'
	String get favorite => 'Favorite';

	/// en: 'Watch'
	String get watch => 'Watch';

	/// en: 'Today'
	String get release_today => 'Today';

	/// en: '1 day'
	String get release_1_day => '1 day';

	/// en: 'days'
	String get release_days => 'days';

	/// en: 'Added to Watch Later'
	String get added_to_watch_later => 'Added to Watch Later';

	/// en: 'Director'
	String get director => 'Director';

	/// en: 'Cast'
	String get cast => 'Cast';

	/// en: 'You Might Also Like'
	String get you_might_also_like => 'You Might Also Like';
}

// Path: actor
class Translations$actor$en {
	Translations$actor$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Born:'
	String get born => 'Born:';

	/// en: 'Biography'
	String get biography => 'Biography';

	/// en: 'Filmography'
	String get filmography => 'Filmography';
}

// Path: tv
class Translations$tv$en {
	Translations$tv$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Popular'
	String get popular => 'Popular';

	/// en: 'Top Rated'
	String get top_rated => 'Top Rated';

	/// en: 'Airing Today'
	String get airing_today => 'Airing Today';

	/// en: 'On The Air'
	String get on_the_air => 'On The Air';

	/// en: 'Action'
	String get action => 'Action';

	/// en: 'Comedy'
	String get comedy => 'Comedy';

	/// en: 'Drama'
	String get drama => 'Drama';

	/// en: 'Sci-Fi & Fantasy'
	String get sci_fi_fantasy => 'Sci-Fi & Fantasy';
}

// Path: common
class Translations$common$en {
	Translations$common$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Submit Rating'
	String get submit => 'Submit Rating';

	/// en: 'Cinema'
	String get cinema => 'Cinema';

	/// en: 'My Movies'
	String get app_name => 'My Movies';

	/// en: 'Your list is currently empty'
	String get empty_list => 'Your list is currently empty';

	/// en: 'My Movies'
	String get cine_stream => 'My Movies';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Something went wrong'
	String get error_title => 'Something went wrong';

	/// en: 'See All'
	String get see_all => 'See All';

	/// en: 'Back to Browse'
	String get back_to_browse => 'Back to Browse';

	/// en: 'Collection'
	String get collection => 'Collection';

	/// en: 'My Movies'
	String get my_movie => 'My Movies';
}

// Path: genres
class Translations$genres$en {
	Translations$genres$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Action'
	String get g_28 => 'Action';

	/// en: 'Adventure'
	String get g_12 => 'Adventure';

	/// en: 'Animation'
	String get g_16 => 'Animation';

	/// en: 'Comedy'
	String get g_35 => 'Comedy';

	/// en: 'Crime'
	String get g_80 => 'Crime';

	/// en: 'Documentary'
	String get g_99 => 'Documentary';

	/// en: 'Drama'
	String get g_18 => 'Drama';

	/// en: 'Family'
	String get g_10751 => 'Family';

	/// en: 'Fantasy'
	String get g_14 => 'Fantasy';

	/// en: 'History'
	String get g_36 => 'History';

	/// en: 'Horror'
	String get g_27 => 'Horror';

	/// en: 'Music'
	String get g_10402 => 'Music';

	/// en: 'Mystery'
	String get g_9648 => 'Mystery';

	/// en: 'Romance'
	String get g_10749 => 'Romance';

	/// en: 'Sci-Fi'
	String get g_878 => 'Sci-Fi';

	/// en: 'TV Movie'
	String get g_10770 => 'TV Movie';

	/// en: 'Thriller'
	String get g_53 => 'Thriller';

	/// en: 'War'
	String get g_10752 => 'War';

	/// en: 'Western'
	String get g_37 => 'Western';
}

// Path: connectivity
class Translations$connectivity$en {
	Translations$connectivity$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No Internet Connection'
	String get title => 'No Internet Connection';

	/// en: 'Please check your internet connection and try again. My Movie app requires an active internet connection to function properly.'
	String get description => 'Please check your internet connection and try again. My Movie app requires an active internet connection to function properly.';

	/// en: 'Troubleshooting Tips:'
	String get troubleshooting_title => 'Troubleshooting Tips:';

	late final Translations$connectivity$tips$en tips = Translations$connectivity$tips$en.internal(_root);

	/// en: 'Checking connection...'
	String get check_connection => 'Checking connection...';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'You're offline — some features may be limited'
	String get offline_banner => 'You\'re offline — some features may be limited';

	/// en: 'Browse Watch Later'
	String get browse_watch_later => 'Browse Watch Later';
}

// Path: not_found
class Translations$not_found$en {
	Translations$not_found$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Page Not Found'
	String get title => 'Page Not Found';

	/// en: '404 - Page Not Found'
	String get title_404 => '404 - Page Not Found';

	/// en: 'The page you are looking for does not exist or has been moved.'
	String get subtitle => 'The page you are looking for does not exist or has been moved.';

	/// en: 'Return to Home'
	String get return_home => 'Return to Home';
}

// Path: what_to_watch_dialog
class Translations$what_to_watch_dialog$en {
	Translations$what_to_watch_dialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome to What to Watch'
	String get title => 'Welcome to What to Watch';

	/// en: 'Set Your Preferences'
	String get step1_title => 'Set Your Preferences';

	/// en: 'Choose genres, rating range, release year, and sort order to find exactly what you're in the mood for.'
	String get step1_desc => 'Choose genres, rating range, release year, and sort order to find exactly what you\'re in the mood for.';

	/// en: 'Swipe Through Movies'
	String get step2_title => 'Swipe Through Movies';

	/// en: 'Swipe right to save a movie or swipe left to skip it. Tap a card for details.'
	String get step2_desc => 'Swipe right to save a movie or swipe left to skip it. Tap a card for details.';

	/// en: 'Watch Later'
	String get step3_title => 'Watch Later';

	/// en: 'All saved movies appear in your profile under Watch Later.'
	String get step3_desc => 'All saved movies appear in your profile under Watch Later.';

	/// en: 'Got it!'
	String get got_it => 'Got it!';
}

// Path: swipe
class Translations$swipe$en {
	Translations$swipe$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What to Watch'
	String get title => 'What to Watch';

	/// en: 'SAVE'
	String get save_label => 'SAVE';

	/// en: 'SKIP'
	String get skip_label => 'SKIP';

	/// en: 'NOPE'
	String get nope_label => 'NOPE';

	/// en: 'WATCH LATER'
	String get watch_later_label => 'WATCH LATER';

	/// en: 'Swipe right to save'
	String get hint => 'Swipe right to save';

	/// en: 'Something went wrong'
	String get error_title => 'Something went wrong';

	/// en: 'Try Again'
	String get retry => 'Try Again';

	/// en: 'No movies found. Try different filters.'
	String get empty_no_movies => 'No movies found. Try different filters.';

	/// en: 'Change Filters'
	String get change_filters => 'Change Filters';

	/// en: 'You're all caught up!'
	String get all_caught_up => 'You\'re all caught up!';

	/// en: 'No movies were added to watch later.'
	String get no_movies_added => 'No movies were added to watch later.';

	/// en: 'movie added to watch later!'
	String get movie_added => 'movie added to watch later!';

	/// en: 'movies added to watch later!'
	String get movies_added => 'movies added to watch later!';

	/// en: 'View Watch Later'
	String get view_watch_later => 'View Watch Later';

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Genres'
	String get genres => 'Genres';

	/// en: 'selected'
	String get selected => 'selected';

	/// en: 'Select Genres'
	String get select_genres => 'Select Genres';

	/// en: 'Minimum Rating'
	String get minimum_rating => 'Minimum Rating';

	/// en: 'Release Year'
	String get release_year => 'Release Year';

	/// en: 'Sort By'
	String get sort_by => 'Sort By';

	/// en: 'Shuffle'
	String get shuffle => 'Shuffle';

	/// en: 'Start Swiping'
	String get start_swiping => 'Start Swiping';

	/// en: 'From'
	String get year_from => 'From';

	/// en: 'To'
	String get year_to => 'To';

	/// en: 'Any'
	String get year_any => 'Any';

	late final Translations$swipe$sort_options$en sort_options = Translations$swipe$sort_options$en.internal(_root);
}

// Path: search.filters
class Translations$search$filters$en {
	Translations$search$filters$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'All'
	String get all => 'All';

	/// en: 'Movies'
	String get movies => 'Movies';

	/// en: 'TV Shows'
	String get tv_shows => 'TV Shows';

	/// en: 'Actors'
	String get actors => 'Actors';
}

// Path: auth.errors
class Translations$auth$errors$en {
	Translations$auth$errors$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Email is required'
	String get email_required => 'Email is required';

	/// en: 'Enter a valid email'
	String get invalid_email => 'Enter a valid email';

	/// en: 'Password is required'
	String get password_required => 'Password is required';

	/// en: 'Password must be at least 6 characters'
	String get password_too_short => 'Password must be at least 6 characters';

	/// en: 'Confirm your password'
	String get confirm_password_required => 'Confirm your password';

	/// en: 'Passwords do not match'
	String get passwords_dont_match => 'Passwords do not match';
}

// Path: auth.guest
class Translations$auth$guest$en {
	Translations$auth$guest$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Continue as Guest'
	String get kContinue => 'Continue as Guest';

	/// en: 'Get Started / Log In'
	String get get_started => 'Get Started / Log In';
}

// Path: onboarding.features
class Translations$onboarding$features$en {
	Translations$onboarding$features$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$onboarding$features$browse$en browse = Translations$onboarding$features$browse$en.internal(_root);
	late final Translations$onboarding$features$recommend$en recommend = Translations$onboarding$features$recommend$en.internal(_root);
	late final Translations$onboarding$features$favorites$en favorites = Translations$onboarding$features$favorites$en.internal(_root);
	late final Translations$onboarding$features$watch_later$en watch_later = Translations$onboarding$features$watch_later$en.internal(_root);
}

// Path: onboarding.tooltips
class Translations$onboarding$tooltips$en {
	Translations$onboarding$tooltips$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$onboarding$tooltips$browse$en browse = Translations$onboarding$tooltips$browse$en.internal(_root);
	late final Translations$onboarding$tooltips$recommend$en recommend = Translations$onboarding$tooltips$recommend$en.internal(_root);
	late final Translations$onboarding$tooltips$search$en search = Translations$onboarding$tooltips$search$en.internal(_root);
	late final Translations$onboarding$tooltips$settings$en settings = Translations$onboarding$tooltips$settings$en.internal(_root);
	late final Translations$onboarding$tooltips$profile$en profile = Translations$onboarding$tooltips$profile$en.internal(_root);
}

// Path: guest_features.favorites
class Translations$guest_features$favorites$en {
	Translations$guest_features$favorites$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Curate Favorites'
	String get title => 'Curate Favorites';

	/// en: 'Keep track of the movies you love most.'
	String get desc => 'Keep track of the movies you love most.';
}

// Path: guest_features.rate
class Translations$guest_features$rate$en {
	Translations$guest_features$rate$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Rate & Review'
	String get title => 'Rate & Review';

	/// en: 'Share your thoughts and influence others.'
	String get desc => 'Share your thoughts and influence others.';
}

// Path: guest_features.watch_later
class Translations$guest_features$watch_later$en {
	Translations$guest_features$watch_later$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Watch Later'
	String get title => 'Watch Later';

	/// en: 'Never lose track of movies you want to see.'
	String get desc => 'Never lose track of movies you want to see.';
}

// Path: guest_features.sync
class Translations$guest_features$sync$en {
	Translations$guest_features$sync$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sync Everywhere'
	String get title => 'Sync Everywhere';

	/// en: 'Your data is saved securely and synced across all your devices.'
	String get desc => 'Your data is saved securely and synced across all your devices.';
}

// Path: movie_detail.prompts
class Translations$movie_detail$prompts$en {
	Translations$movie_detail$prompts$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Login Required'
	String get login_required => 'Login Required';

	/// en: 'Please sign in to'
	String get please_sign_in => 'Please sign in to';

	/// en: 'Go to Login'
	String get go_to_login => 'Go to Login';

	/// en: 'Rate this Movie'
	String get rate_title => 'Rate this Movie';

	/// en: 'Slide to set your rating'
	String get slide_to_rate => 'Slide to set your rating';
}

// Path: movie_detail.actions
class Translations$movie_detail$actions$en {
	Translations$movie_detail$actions$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'add to Watch Later'
	String get add_watch_later => 'add to Watch Later';

	/// en: 'rate movies'
	String get rate_movies => 'rate movies';
}

// Path: connectivity.tips
class Translations$connectivity$tips$en {
	Translations$connectivity$tips$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '✓ Turn off airplane mode'
	String get airplane_mode => '✓ Turn off airplane mode';

	/// en: '✓ Check WiFi or mobile data'
	String get check_data => '✓ Check WiFi or mobile data';

	/// en: '✓ Move closer to WiFi router'
	String get move_closer => '✓ Move closer to WiFi router';

	/// en: '✓ Restart your device'
	String get restart_device => '✓ Restart your device';
}

// Path: swipe.sort_options
class Translations$swipe$sort_options$en {
	Translations$swipe$sort_options$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Most Popular'
	String get most_popular => 'Most Popular';

	/// en: 'Highest Rated'
	String get highest_rated => 'Highest Rated';

	/// en: 'Newest First'
	String get newest_first => 'Newest First';

	/// en: 'Oldest First'
	String get oldest_first => 'Oldest First';

	/// en: 'Highest Revenue'
	String get highest_revenue => 'Highest Revenue';
}

// Path: onboarding.features.browse
class Translations$onboarding$features$browse$en {
	Translations$onboarding$features$browse$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Browse & Discover'
	String get title => 'Browse & Discover';

	/// en: 'Explore trending, top-rated, and upcoming movies.'
	String get desc => 'Explore trending, top-rated, and upcoming movies.';
}

// Path: onboarding.features.recommend
class Translations$onboarding$features$recommend$en {
	Translations$onboarding$features$recommend$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Smart Recommendations'
	String get title => 'Smart Recommendations';

	/// en: 'Swipe through personalized movie suggestions.'
	String get desc => 'Swipe through personalized movie suggestions.';
}

// Path: onboarding.features.favorites
class Translations$onboarding$features$favorites$en {
	Translations$onboarding$features$favorites$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Favorites & Ratings'
	String get title => 'Favorites & Ratings';

	/// en: 'Save movies you love and share your ratings.'
	String get desc => 'Save movies you love and share your ratings.';
}

// Path: onboarding.features.watch_later
class Translations$onboarding$features$watch_later$en {
	Translations$onboarding$features$watch_later$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Watch Later'
	String get title => 'Watch Later';

	/// en: 'Build your personal watchlist for later.'
	String get desc => 'Build your personal watchlist for later.';
}

// Path: onboarding.tooltips.browse
class Translations$onboarding$tooltips$browse$en {
	Translations$onboarding$tooltips$browse$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cinema'
	String get title => 'Cinema';

	/// en: 'Browse new movies and discover what's playing'
	String get desc => 'Browse new movies and discover what\'s playing';
}

// Path: onboarding.tooltips.recommend
class Translations$onboarding$tooltips$recommend$en {
	Translations$onboarding$tooltips$recommend$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What to Watch'
	String get title => 'What to Watch';

	/// en: 'Swipe through personalized movie recommendations'
	String get desc => 'Swipe through personalized movie recommendations';
}

// Path: onboarding.tooltips.search
class Translations$onboarding$tooltips$search$en {
	Translations$onboarding$tooltips$search$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Explore'
	String get title => 'Explore';

	/// en: 'Search for movies, TV shows and actors'
	String get desc => 'Search for movies, TV shows and actors';
}

// Path: onboarding.tooltips.settings
class Translations$onboarding$tooltips$settings$en {
	Translations$onboarding$tooltips$settings$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	/// en: 'Customize language, theme and app preferences'
	String get desc => 'Customize language, theme and app preferences';
}

// Path: onboarding.tooltips.profile
class Translations$onboarding$tooltips$profile$en {
	Translations$onboarding$tooltips$profile$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile'
	String get title => 'Profile';

	/// en: 'Manage your watchlist, favorites and settings'
	String get desc => 'Manage your watchlist, favorites and settings';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'home.trending' => 'Trending Now',
			'home.top_rated' => 'Top Rated Movies',
			'home.now_playing' => 'Now Playing',
			'home.popular' => 'Popular',
			'home.upcoming' => 'Upcoming',
			'home.action' => 'Action Thrillers',
			'home.sci_fi' => 'Sci-Fi Explorations',
			'home.horror' => 'Horror & Suspense',
			'home.drama' => 'Dramatic Masterpieces',
			'home.comedy' => 'Laughter & Comedy',
			'home.romance' => 'Romantic Stories',
			'home.thriller' => 'Edge-of-Seat Thrillers',
			'home.animation' => 'Animated Worlds',
			'home.mystery' => 'Mystery & Detective',
			'search.explore' => 'Explore',
			'search.explore_caps' => 'EXPLORE',
			'search.hint' => 'Search movies...',
			'search.no_results' => 'No results found.',
			'search.filters.all' => 'All',
			'search.filters.movies' => 'Movies',
			'search.filters.tv_shows' => 'TV Shows',
			'search.filters.actors' => 'Actors',
			'search.no_results_subtitle' => 'Try searching for something else',
			'search.discover_title' => 'Discover Movies',
			'search.discover_subtitle' => 'Start typing to explore millions of movies and TV shows',
			'search.recent_searches' => 'Recent Searches',
			'search.clear' => 'Clear',
			'search.browse_categories' => 'Browse Categories',
			'search.browse_all' => 'Browse All',
			'search.top_rated_badge' => 'TOP RATED',
			'search.browse' => 'Browse',
			'profile.title' => 'Profile',
			'profile.my_activity' => 'My Activity',
			'profile.watch_later' => 'Watch Later',
			'profile.favorites' => 'My Favorites',
			'profile.my_favorites' => 'My Favorites',
			'profile.ratings' => 'My Ratings',
			'profile.my_ratings' => 'My Ratings',
			'profile.account' => 'Account',
			'profile.logout' => 'Log Out',
			'profile.logout_confirm' => 'Are you sure you want to log out?',
			'profile.default_name' => 'Movie Lover',
			'settings.title' => 'Setup',
			'settings.language' => 'Language',
			'settings.dark_mode' => 'Dark Mode',
			'settings.lang_en' => 'English',
			'settings.lang_ku' => 'Kurdish',
			'settings.lang_ar' => 'Arabic',
			'settings.privacy_policy' => 'Privacy Policy',
			'settings.legal' => 'Legal',
			'settings.support' => 'Support',
			'settings.contact_us' => 'Contact Us',
			'settings.email' => 'mahamadbarznji712@gmail.com',
			'privacy.title' => 'Privacy Policy',
			'privacy.last_updated' => 'Last updated: June 26, 2026',
			'privacy.introduction' => 'My Movies respects your privacy. This Privacy Policy explains how we collect, use, and protect your information when you use our app.',
			'privacy.info_collect_title' => 'Information We Collect',
			'privacy.info_collect' => 'We collect minimal information necessary to provide our services. This may include your email address if you create an account, and basic usage data such as movies you save to your watch list or favorites. We do not collect sensitive personal information.',
			'privacy.how_use_title' => 'How We Use Your Information',
			'privacy.how_use' => 'Your information is used solely to personalize your experience, save your preferences, and provide the core functionality of the app. We do not sell your data to third parties.',
			'privacy.data_security_title' => 'Data Security',
			'privacy.data_security' => 'We implement industry-standard security measures to protect your information. However, no method of electronic storage is 100%% secure.',
			'privacy.contact_title' => 'Contact Us',
			'privacy.contact' => 'If you have questions about this Privacy Policy, please contact us at mahamadbarznji712@gmail.com',
			'auth.login' => 'Login',
			'auth.signup' => 'Sign up',
			'auth.create_account' => 'Create Account',
			'auth.welcome_back' => 'Welcome Back',
			'auth.login_subtitle' => 'Log in to your account',
			'auth.join_community' => 'Join the Community',
			'auth.join_subtitle' => 'Sign in to unlock the full potential of My Movies and personalize your movie experience.',
			'auth.email' => 'Email',
			'auth.email_hint' => 'Enter your email',
			'auth.password' => 'Password',
			'auth.password_hint' => 'Enter your password',
			'auth.confirm_password' => 'Confirm Password',
			'auth.confirm_password_hint' => 'Re-enter your password',
			'auth.no_account' => 'Don\'t have an account? ',
			'auth.already_account' => 'Already have an account? ',
			'auth.join_us_subtitle' => 'Join us to rate and save movies',
			'auth.onboarding_subtitle' => 'Discover millions of movies, build personalized tracklists, and rate your favorite titles easily.',
			'auth.get_started' => 'Get Started',
			'auth.continue_guest' => 'Continue as Guest',
			'auth.login_required_desc' => 'Please log in to view your collection',
			'auth.welcome_title' => 'Welcome to My Movies',
			'auth.onboarding_settings' => 'Customize your experience',
			'auth.errors.email_required' => 'Email is required',
			'auth.errors.invalid_email' => 'Enter a valid email',
			'auth.errors.password_required' => 'Password is required',
			'auth.errors.password_too_short' => 'Password must be at least 6 characters',
			'auth.errors.confirm_password_required' => 'Confirm your password',
			'auth.errors.passwords_dont_match' => 'Passwords do not match',
			'auth.guest.kContinue' => 'Continue as Guest',
			'auth.guest.get_started' => 'Get Started / Log In',
			'auth.reset_password' => 'Reset Password',
			'auth.reset_subtitle' => 'Enter your email address and we\'ll send you a link to reset your password.',
			'auth.send_reset_link' => 'Send Reset Link',
			'auth.reset_sent' => 'Reset link sent! Check your email inbox.',
			'auth.back_to_login' => 'Back to Login',
			'onboarding.subtitle' => 'Discover millions of movies, build personalized tracklists, and rate your favorite titles easily.',
			'onboarding.features.browse.title' => 'Browse & Discover',
			'onboarding.features.browse.desc' => 'Explore trending, top-rated, and upcoming movies.',
			'onboarding.features.recommend.title' => 'Smart Recommendations',
			'onboarding.features.recommend.desc' => 'Swipe through personalized movie suggestions.',
			'onboarding.features.favorites.title' => 'Favorites & Ratings',
			'onboarding.features.favorites.desc' => 'Save movies you love and share your ratings.',
			'onboarding.features.watch_later.title' => 'Watch Later',
			'onboarding.features.watch_later.desc' => 'Build your personal watchlist for later.',
			'onboarding.tooltips.browse.title' => 'Cinema',
			'onboarding.tooltips.browse.desc' => 'Browse new movies and discover what\'s playing',
			'onboarding.tooltips.recommend.title' => 'What to Watch',
			'onboarding.tooltips.recommend.desc' => 'Swipe through personalized movie recommendations',
			'onboarding.tooltips.search.title' => 'Explore',
			'onboarding.tooltips.search.desc' => 'Search for movies, TV shows and actors',
			'onboarding.tooltips.settings.title' => 'Settings',
			'onboarding.tooltips.settings.desc' => 'Customize language, theme and app preferences',
			'onboarding.tooltips.profile.title' => 'Profile',
			'onboarding.tooltips.profile.desc' => 'Manage your watchlist, favorites and settings',
			'guest_features.favorites.title' => 'Curate Favorites',
			'guest_features.favorites.desc' => 'Keep track of the movies you love most.',
			'guest_features.rate.title' => 'Rate & Review',
			'guest_features.rate.desc' => 'Share your thoughts and influence others.',
			'guest_features.watch_later.title' => 'Watch Later',
			'guest_features.watch_later.desc' => 'Never lose track of movies you want to see.',
			'guest_features.sync.title' => 'Sync Everywhere',
			'guest_features.sync.desc' => 'Your data is saved securely and synced across all your devices.',
			'movie_detail.overview' => 'Overview',
			'movie_detail.watch_later' => 'Watch Later',
			'movie_detail.saved' => 'Saved',
			'movie_detail.rate_movie' => 'Rate Movie',
			'movie_detail.added_to_favorites' => 'Added to favorites',
			'movie_detail.removed_from_favorites' => 'Removed from favorites',
			'movie_detail.saved_rating' => 'Saved rating: ',
			'movie_detail.prompts.login_required' => 'Login Required',
			'movie_detail.prompts.please_sign_in' => 'Please sign in to',
			'movie_detail.prompts.go_to_login' => 'Go to Login',
			'movie_detail.prompts.rate_title' => 'Rate this Movie',
			'movie_detail.prompts.slide_to_rate' => 'Slide to set your rating',
			'movie_detail.actions.add_watch_later' => 'add to Watch Later',
			'movie_detail.actions.rate_movies' => 'rate movies',
			'movie_detail.play_trailer' => 'Play Trailer',
			'movie_detail.watch_trailer' => 'Watch Trailer',
			'movie_detail.on_youtube' => 'on YouTube',
			'movie_detail.favorite' => 'Favorite',
			'movie_detail.watch' => 'Watch',
			'movie_detail.release_today' => 'Today',
			'movie_detail.release_1_day' => '1 day',
			'movie_detail.release_days' => 'days',
			'movie_detail.added_to_watch_later' => 'Added to Watch Later',
			'movie_detail.director' => 'Director',
			'movie_detail.cast' => 'Cast',
			'movie_detail.you_might_also_like' => 'You Might Also Like',
			'actor.born' => 'Born:',
			'actor.biography' => 'Biography',
			'actor.filmography' => 'Filmography',
			'tv.popular' => 'Popular',
			'tv.top_rated' => 'Top Rated',
			'tv.airing_today' => 'Airing Today',
			'tv.on_the_air' => 'On The Air',
			'tv.action' => 'Action',
			'tv.comedy' => 'Comedy',
			'tv.drama' => 'Drama',
			'tv.sci_fi_fantasy' => 'Sci-Fi & Fantasy',
			'common.cancel' => 'Cancel',
			'common.submit' => 'Submit Rating',
			'common.cinema' => 'Cinema',
			'common.app_name' => 'My Movies',
			'common.empty_list' => 'Your list is currently empty',
			'common.cine_stream' => 'My Movies',
			'common.retry' => 'Retry',
			'common.error_title' => 'Something went wrong',
			'common.see_all' => 'See All',
			'common.back_to_browse' => 'Back to Browse',
			'common.collection' => 'Collection',
			'common.my_movie' => 'My Movies',
			'genres.g_28' => 'Action',
			'genres.g_12' => 'Adventure',
			'genres.g_16' => 'Animation',
			'genres.g_35' => 'Comedy',
			'genres.g_80' => 'Crime',
			'genres.g_99' => 'Documentary',
			'genres.g_18' => 'Drama',
			'genres.g_10751' => 'Family',
			'genres.g_14' => 'Fantasy',
			'genres.g_36' => 'History',
			'genres.g_27' => 'Horror',
			'genres.g_10402' => 'Music',
			'genres.g_9648' => 'Mystery',
			'genres.g_10749' => 'Romance',
			'genres.g_878' => 'Sci-Fi',
			'genres.g_10770' => 'TV Movie',
			'genres.g_53' => 'Thriller',
			'genres.g_10752' => 'War',
			'genres.g_37' => 'Western',
			'connectivity.title' => 'No Internet Connection',
			'connectivity.description' => 'Please check your internet connection and try again. My Movie app requires an active internet connection to function properly.',
			'connectivity.troubleshooting_title' => 'Troubleshooting Tips:',
			'connectivity.tips.airplane_mode' => '✓ Turn off airplane mode',
			'connectivity.tips.check_data' => '✓ Check WiFi or mobile data',
			'connectivity.tips.move_closer' => '✓ Move closer to WiFi router',
			'connectivity.tips.restart_device' => '✓ Restart your device',
			'connectivity.check_connection' => 'Checking connection...',
			'connectivity.retry' => 'Retry',
			'connectivity.offline_banner' => 'You\'re offline — some features may be limited',
			'connectivity.browse_watch_later' => 'Browse Watch Later',
			'not_found.title' => 'Page Not Found',
			'not_found.title_404' => '404 - Page Not Found',
			'not_found.subtitle' => 'The page you are looking for does not exist or has been moved.',
			'not_found.return_home' => 'Return to Home',
			'what_to_watch_dialog.title' => 'Welcome to What to Watch',
			'what_to_watch_dialog.step1_title' => 'Set Your Preferences',
			'what_to_watch_dialog.step1_desc' => 'Choose genres, rating range, release year, and sort order to find exactly what you\'re in the mood for.',
			'what_to_watch_dialog.step2_title' => 'Swipe Through Movies',
			'what_to_watch_dialog.step2_desc' => 'Swipe right to save a movie or swipe left to skip it. Tap a card for details.',
			'what_to_watch_dialog.step3_title' => 'Watch Later',
			'what_to_watch_dialog.step3_desc' => 'All saved movies appear in your profile under Watch Later.',
			'what_to_watch_dialog.got_it' => 'Got it!',
			'swipe.title' => 'What to Watch',
			'swipe.save_label' => 'SAVE',
			'swipe.skip_label' => 'SKIP',
			'swipe.nope_label' => 'NOPE',
			'swipe.watch_later_label' => 'WATCH LATER',
			'swipe.hint' => 'Swipe right to save',
			'swipe.error_title' => 'Something went wrong',
			'swipe.retry' => 'Try Again',
			'swipe.empty_no_movies' => 'No movies found. Try different filters.',
			'swipe.change_filters' => 'Change Filters',
			'swipe.all_caught_up' => 'You\'re all caught up!',
			'swipe.no_movies_added' => 'No movies were added to watch later.',
			'swipe.movie_added' => 'movie added to watch later!',
			'swipe.movies_added' => 'movies added to watch later!',
			'swipe.view_watch_later' => 'View Watch Later',
			'swipe.skip' => 'Skip',
			'swipe.save' => 'Save',
			'swipe.genres' => 'Genres',
			'swipe.selected' => 'selected',
			'swipe.select_genres' => 'Select Genres',
			'swipe.minimum_rating' => 'Minimum Rating',
			'swipe.release_year' => 'Release Year',
			'swipe.sort_by' => 'Sort By',
			'swipe.shuffle' => 'Shuffle',
			'swipe.start_swiping' => 'Start Swiping',
			'swipe.year_from' => 'From',
			'swipe.year_to' => 'To',
			'swipe.year_any' => 'Any',
			'swipe.sort_options.most_popular' => 'Most Popular',
			'swipe.sort_options.highest_rated' => 'Highest Rated',
			'swipe.sort_options.newest_first' => 'Newest First',
			'swipe.sort_options.oldest_first' => 'Oldest First',
			'swipe.sort_options.highest_revenue' => 'Highest Revenue',
			_ => null,
		};
	}
}
