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
	late final TranslationsHomeEn home = TranslationsHomeEn.internal(_root);
	late final TranslationsSearchEn search = TranslationsSearchEn.internal(_root);
	late final TranslationsProfileEn profile = TranslationsProfileEn.internal(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn.internal(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn.internal(_root);
	late final TranslationsOnboardingEn onboarding = TranslationsOnboardingEn.internal(_root);
	late final TranslationsGuestFeaturesEn guest_features = TranslationsGuestFeaturesEn.internal(_root);
	late final TranslationsMovieDetailEn movie_detail = TranslationsMovieDetailEn.internal(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
	late final TranslationsConnectivityEn connectivity = TranslationsConnectivityEn.internal(_root);
	late final TranslationsNotFoundEn not_found = TranslationsNotFoundEn.internal(_root);
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn.internal(this._root);

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
class TranslationsSearchEn {
	TranslationsSearchEn.internal(this._root);

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

	late final TranslationsSearchFiltersEn filters = TranslationsSearchFiltersEn.internal(_root);

	/// en: 'Try searching for something else'
	String get no_results_subtitle => 'Try searching for something else';

	/// en: 'Discover Movies'
	String get discover_title => 'Discover Movies';

	/// en: 'Start typing to explore millions of movies and TV shows'
	String get discover_subtitle => 'Start typing to explore millions of movies and TV shows';
}

// Path: profile
class TranslationsProfileEn {
	TranslationsProfileEn.internal(this._root);

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
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Setup'
	String get title => 'Setup';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Dark Mode'
	String get dark_mode => 'Dark Mode';
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn.internal(this._root);

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

	late final TranslationsAuthErrorsEn errors = TranslationsAuthErrorsEn.internal(_root);
	late final TranslationsAuthGuestEn guest = TranslationsAuthGuestEn.internal(_root);
}

// Path: onboarding
class TranslationsOnboardingEn {
	TranslationsOnboardingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Discover millions of movies, build personalized tracklists, and rate your favorite titles easily.'
	String get subtitle => 'Discover millions of movies, build personalized tracklists, and rate your favorite titles easily.';
}

// Path: guest_features
class TranslationsGuestFeaturesEn {
	TranslationsGuestFeaturesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsGuestFeaturesFavoritesEn favorites = TranslationsGuestFeaturesFavoritesEn.internal(_root);
	late final TranslationsGuestFeaturesRateEn rate = TranslationsGuestFeaturesRateEn.internal(_root);
	late final TranslationsGuestFeaturesWatchLaterEn watch_later = TranslationsGuestFeaturesWatchLaterEn.internal(_root);
	late final TranslationsGuestFeaturesSyncEn sync = TranslationsGuestFeaturesSyncEn.internal(_root);
}

// Path: movie_detail
class TranslationsMovieDetailEn {
	TranslationsMovieDetailEn.internal(this._root);

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

	late final TranslationsMovieDetailPromptsEn prompts = TranslationsMovieDetailPromptsEn.internal(_root);
	late final TranslationsMovieDetailActionsEn actions = TranslationsMovieDetailActionsEn.internal(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn.internal(this._root);

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
}

// Path: connectivity
class TranslationsConnectivityEn {
	TranslationsConnectivityEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No Internet Connection'
	String get title => 'No Internet Connection';

	/// en: 'Please check your internet connection and try again. My Movie app requires an active internet connection to function properly.'
	String get description => 'Please check your internet connection and try again. My Movie app requires an active internet connection to function properly.';

	/// en: 'Troubleshooting Tips:'
	String get troubleshooting_title => 'Troubleshooting Tips:';

	late final TranslationsConnectivityTipsEn tips = TranslationsConnectivityTipsEn.internal(_root);

	/// en: 'Checking connection...'
	String get check_connection => 'Checking connection...';

	/// en: 'Retry'
	String get retry => 'Retry';
}

// Path: not_found
class TranslationsNotFoundEn {
	TranslationsNotFoundEn.internal(this._root);

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
class TranslationsSearchFiltersEn {
	TranslationsSearchFiltersEn.internal(this._root);

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
class TranslationsAuthErrorsEn {
	TranslationsAuthErrorsEn.internal(this._root);

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
class TranslationsAuthGuestEn {
	TranslationsAuthGuestEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Continue as Guest'
	String get kContinue => 'Continue as Guest';

	/// en: 'Get Started / Log In'
	String get get_started => 'Get Started / Log In';
}

// Path: guest_features.favorites
class TranslationsGuestFeaturesFavoritesEn {
	TranslationsGuestFeaturesFavoritesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Curate Favorites'
	String get title => 'Curate Favorites';

	/// en: 'Keep track of the movies you love most.'
	String get desc => 'Keep track of the movies you love most.';
}

// Path: guest_features.rate
class TranslationsGuestFeaturesRateEn {
	TranslationsGuestFeaturesRateEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Rate & Review'
	String get title => 'Rate & Review';

	/// en: 'Share your thoughts and influence others.'
	String get desc => 'Share your thoughts and influence others.';
}

// Path: guest_features.watch_later
class TranslationsGuestFeaturesWatchLaterEn {
	TranslationsGuestFeaturesWatchLaterEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Watch Later'
	String get title => 'Watch Later';

	/// en: 'Never lose track of movies you want to see.'
	String get desc => 'Never lose track of movies you want to see.';
}

// Path: guest_features.sync
class TranslationsGuestFeaturesSyncEn {
	TranslationsGuestFeaturesSyncEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sync Everywhere'
	String get title => 'Sync Everywhere';

	/// en: 'Your data is saved securely and synced across all your devices.'
	String get desc => 'Your data is saved securely and synced across all your devices.';
}

// Path: movie_detail.prompts
class TranslationsMovieDetailPromptsEn {
	TranslationsMovieDetailPromptsEn.internal(this._root);

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
class TranslationsMovieDetailActionsEn {
	TranslationsMovieDetailActionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'add to Watch Later'
	String get add_watch_later => 'add to Watch Later';

	/// en: 'rate movies'
	String get rate_movies => 'rate movies';
}

// Path: connectivity.tips
class TranslationsConnectivityTipsEn {
	TranslationsConnectivityTipsEn.internal(this._root);

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
			'profile.title' => 'Profile',
			'profile.my_activity' => 'My Activity',
			'profile.watch_later' => 'Watch Later',
			'profile.favorites' => 'My Favorites',
			'profile.my_favorites' => 'My Favorites',
			'profile.ratings' => 'My Ratings',
			'profile.my_ratings' => 'My Ratings',
			'profile.account' => 'Account',
			'profile.logout' => 'Log Out',
			'settings.title' => 'Setup',
			'settings.language' => 'Language',
			'settings.dark_mode' => 'Dark Mode',
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
			'common.cancel' => 'Cancel',
			'common.submit' => 'Submit Rating',
			'common.cinema' => 'Cinema',
			'common.app_name' => 'CineStream',
			'common.empty_list' => 'Your list is currently empty',
			'common.cine_stream' => 'CineStream',
			'common.retry' => 'Retry',
			'common.error_title' => 'Something went wrong',
			'connectivity.title' => 'No Internet Connection',
			'connectivity.description' => 'Please check your internet connection and try again. My Movie app requires an active internet connection to function properly.',
			'connectivity.troubleshooting_title' => 'Troubleshooting Tips:',
			'connectivity.tips.airplane_mode' => '✓ Turn off airplane mode',
			'connectivity.tips.check_data' => '✓ Check WiFi or mobile data',
			'connectivity.tips.move_closer' => '✓ Move closer to WiFi router',
			'connectivity.tips.restart_device' => '✓ Restart your device',
			'connectivity.check_connection' => 'Checking connection...',
			'connectivity.retry' => 'Retry',
			'not_found.title' => 'Page Not Found',
			'not_found.title_404' => '404 - Page Not Found',
			'not_found.subtitle' => 'The page you are looking for does not exist or has been moved.',
			'not_found.return_home' => 'Return to Home',
			_ => null,
		};
	}
}
