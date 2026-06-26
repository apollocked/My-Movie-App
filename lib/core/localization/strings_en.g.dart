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
	late final Translations$auth$en auth = Translations$auth$en.internal(_root);
	late final Translations$onboarding$en onboarding = Translations$onboarding$en.internal(_root);
	late final Translations$guest_features$en guest_features = Translations$guest_features$en.internal(_root);
	late final Translations$movie_detail$en movie_detail = Translations$movie_detail$en.internal(_root);
	late final Translations$actor$en actor = Translations$actor$en.internal(_root);
	late final Translations$tv$en tv = Translations$tv$en.internal(_root);
	late final Translations$common$en common = Translations$common$en.internal(_root);
	late final Translations$connectivity$en connectivity = Translations$connectivity$en.internal(_root);
	late final Translations$not_found$en not_found = Translations$not_found$en.internal(_root);
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

	/// en: 'CineVault Moviegoer'
	String get default_name => 'CineVault Moviegoer';
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

	/// en: 'Sign in to unlock the full potential of CineStream and personalize your movie experience.'
	String get join_subtitle => 'Sign in to unlock the full potential of CineStream and personalize your movie experience.';

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

	/// en: 'Welcome to CineStream'
	String get welcome_title => 'Welcome to CineStream';

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

	/// en: 'CineStream'
	String get app_name => 'CineStream';

	/// en: 'Your list is currently empty'
	String get empty_list => 'Your list is currently empty';

	/// en: 'CineStream'
	String get cine_stream => 'CineStream';

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

	/// en: 'My Movie'
	String get my_movie => 'My Movie';
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
			'profile.default_name' => 'CineVault Moviegoer',
			'settings.title' => 'Setup',
			'settings.language' => 'Language',
			'settings.dark_mode' => 'Dark Mode',
			'settings.lang_en' => 'English',
			'settings.lang_ku' => 'Kurdish',
			'settings.lang_ar' => 'Arabic',
			'auth.login' => 'Login',
			'auth.signup' => 'Sign up',
			'auth.create_account' => 'Create Account',
			'auth.welcome_back' => 'Welcome Back',
			'auth.login_subtitle' => 'Log in to your account',
			'auth.join_community' => 'Join the Community',
			'auth.join_subtitle' => 'Sign in to unlock the full potential of CineStream and personalize your movie experience.',
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
			'auth.welcome_title' => 'Welcome to CineStream',
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
			'common.app_name' => 'CineStream',
			'common.empty_list' => 'Your list is currently empty',
			'common.cine_stream' => 'CineStream',
			'common.retry' => 'Retry',
			'common.error_title' => 'Something went wrong',
			'common.see_all' => 'See All',
			'common.back_to_browse' => 'Back to Browse',
			'common.collection' => 'Collection',
			'common.my_movie' => 'My Movie',
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
			_ => null,
		};
	}
}
