import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ku.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('ku')
  ];

  /// No description provided for @home_trending.
  ///
  /// In en, this message translates to:
  /// **'Trending Now'**
  String get home_trending;

  /// No description provided for @home_top_rated.
  ///
  /// In en, this message translates to:
  /// **'Top Rated Movies'**
  String get home_top_rated;

  /// No description provided for @home_now_playing.
  ///
  /// In en, this message translates to:
  /// **'Now Playing'**
  String get home_now_playing;

  /// No description provided for @home_popular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get home_popular;

  /// No description provided for @home_upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get home_upcoming;

  /// No description provided for @home_action.
  ///
  /// In en, this message translates to:
  /// **'Action Thrillers'**
  String get home_action;

  /// No description provided for @home_sci_fi.
  ///
  /// In en, this message translates to:
  /// **'Sci-Fi Explorations'**
  String get home_sci_fi;

  /// No description provided for @home_horror.
  ///
  /// In en, this message translates to:
  /// **'Horror & Suspense'**
  String get home_horror;

  /// No description provided for @home_drama.
  ///
  /// In en, this message translates to:
  /// **'Dramatic Masterpieces'**
  String get home_drama;

  /// No description provided for @home_comedy.
  ///
  /// In en, this message translates to:
  /// **'Laughter & Comedy'**
  String get home_comedy;

  /// No description provided for @home_romance.
  ///
  /// In en, this message translates to:
  /// **'Romantic Stories'**
  String get home_romance;

  /// No description provided for @home_thriller.
  ///
  /// In en, this message translates to:
  /// **'Edge-of-Seat Thrillers'**
  String get home_thriller;

  /// No description provided for @home_animation.
  ///
  /// In en, this message translates to:
  /// **'Animated Worlds'**
  String get home_animation;

  /// No description provided for @home_mystery.
  ///
  /// In en, this message translates to:
  /// **'Mystery & Detective'**
  String get home_mystery;

  /// No description provided for @search_explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get search_explore;

  /// No description provided for @search_explore_caps.
  ///
  /// In en, this message translates to:
  /// **'EXPLORE'**
  String get search_explore_caps;

  /// No description provided for @search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search ...'**
  String get search_hint;

  /// No description provided for @search_no_results.
  ///
  /// In en, this message translates to:
  /// **'No results found.'**
  String get search_no_results;

  /// No description provided for @search_filters_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get search_filters_all;

  /// No description provided for @search_filters_movies.
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get search_filters_movies;

  /// No description provided for @search_filters_tv_shows.
  ///
  /// In en, this message translates to:
  /// **'TV Shows'**
  String get search_filters_tv_shows;

  /// No description provided for @search_filters_actors.
  ///
  /// In en, this message translates to:
  /// **'Actors'**
  String get search_filters_actors;

  /// No description provided for @search_filters_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get search_filters_language;

  /// No description provided for @search_no_results_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Try searching for something else'**
  String get search_no_results_subtitle;

  /// No description provided for @search_discover_title.
  ///
  /// In en, this message translates to:
  /// **'Discover Movies'**
  String get search_discover_title;

  /// No description provided for @search_discover_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Start typing to explore millions of movies and TV shows'**
  String get search_discover_subtitle;

  /// No description provided for @search_recent_searches.
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get search_recent_searches;

  /// No description provided for @search_clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get search_clear;

  /// No description provided for @search_browse_categories.
  ///
  /// In en, this message translates to:
  /// **'Browse Categories'**
  String get search_browse_categories;

  /// No description provided for @search_browse_all.
  ///
  /// In en, this message translates to:
  /// **'Browse All'**
  String get search_browse_all;

  /// No description provided for @search_top_rated_badge.
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get search_top_rated_badge;

  /// No description provided for @search_browse.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get search_browse;

  /// No description provided for @profile_title.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile_title;

  /// No description provided for @profile_my_activity.
  ///
  /// In en, this message translates to:
  /// **'My Activity'**
  String get profile_my_activity;

  /// No description provided for @profile_watch_later.
  ///
  /// In en, this message translates to:
  /// **'Watch Later'**
  String get profile_watch_later;

  /// No description provided for @profile_favorites.
  ///
  /// In en, this message translates to:
  /// **'My Favorites'**
  String get profile_favorites;

  /// No description provided for @profile_my_favorites.
  ///
  /// In en, this message translates to:
  /// **'My Favorites'**
  String get profile_my_favorites;

  /// No description provided for @profile_ratings.
  ///
  /// In en, this message translates to:
  /// **'My Ratings'**
  String get profile_ratings;

  /// No description provided for @profile_my_ratings.
  ///
  /// In en, this message translates to:
  /// **'My Ratings'**
  String get profile_my_ratings;

  /// No description provided for @profile_account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get profile_account;

  /// No description provided for @profile_logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get profile_logout;

  /// No description provided for @profile_logout_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get profile_logout_confirm;

  /// No description provided for @profile_default_name.
  ///
  /// In en, this message translates to:
  /// **'Movie Lover'**
  String get profile_default_name;

  /// No description provided for @settings_title.
  ///
  /// In en, this message translates to:
  /// **'Setup'**
  String get settings_title;

  /// No description provided for @settings_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_language;

  /// No description provided for @settings_dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settings_dark_mode;

  /// No description provided for @settings_lang_en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settings_lang_en;

  /// No description provided for @settings_lang_ku.
  ///
  /// In en, this message translates to:
  /// **'Kurdish'**
  String get settings_lang_ku;

  /// No description provided for @settings_lang_ar.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get settings_lang_ar;

  /// No description provided for @settings_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settings_privacy_policy;

  /// No description provided for @settings_legal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get settings_legal;

  /// No description provided for @settings_support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get settings_support;

  /// No description provided for @settings_contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get settings_contact_us;

  /// No description provided for @settings_email.
  ///
  /// In en, this message translates to:
  /// **'mahamadbarznji712@gmail.com'**
  String get settings_email;

  /// No description provided for @privacy_title.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_title;

  /// No description provided for @privacy_last_updated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: June 26, 2026'**
  String get privacy_last_updated;

  /// No description provided for @privacy_introduction.
  ///
  /// In en, this message translates to:
  /// **'My Movies respects your privacy. This Privacy Policy explains how we collect, use, and protect your information when you use our app.'**
  String get privacy_introduction;

  /// No description provided for @privacy_info_collect_title.
  ///
  /// In en, this message translates to:
  /// **'Information We Collect'**
  String get privacy_info_collect_title;

  /// No description provided for @privacy_info_collect.
  ///
  /// In en, this message translates to:
  /// **'We collect minimal information necessary to provide our services. This may include your email address if you create an account, and basic usage data such as movies you save to your watch list or favorites. We do not collect sensitive personal information.'**
  String get privacy_info_collect;

  /// No description provided for @privacy_how_use_title.
  ///
  /// In en, this message translates to:
  /// **'How We Use Your Information'**
  String get privacy_how_use_title;

  /// No description provided for @privacy_how_use.
  ///
  /// In en, this message translates to:
  /// **'Your information is used solely to personalize your experience, save your preferences, and provide the core functionality of the app. We do not sell your data to third parties.'**
  String get privacy_how_use;

  /// No description provided for @privacy_data_security_title.
  ///
  /// In en, this message translates to:
  /// **'Data Security'**
  String get privacy_data_security_title;

  /// No description provided for @privacy_data_security.
  ///
  /// In en, this message translates to:
  /// **'We implement industry-standard security measures to protect your information. However, no method of electronic storage is 100% secure.'**
  String get privacy_data_security;

  /// No description provided for @privacy_contact_title.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get privacy_contact_title;

  /// No description provided for @privacy_contact.
  ///
  /// In en, this message translates to:
  /// **'If you have questions about this Privacy Policy, please contact us at mahamadbarznji712@gmail.com'**
  String get privacy_contact;

  /// No description provided for @auth_login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get auth_login;

  /// No description provided for @auth_signup.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get auth_signup;

  /// No description provided for @auth_create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get auth_create_account;

  /// No description provided for @auth_welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get auth_welcome_back;

  /// No description provided for @auth_login_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Log in to your account'**
  String get auth_login_subtitle;

  /// No description provided for @auth_join_community.
  ///
  /// In en, this message translates to:
  /// **'Join the Community'**
  String get auth_join_community;

  /// No description provided for @auth_join_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to unlock the full potential of My Movies and personalize your movie experience.'**
  String get auth_join_subtitle;

  /// No description provided for @auth_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get auth_email;

  /// No description provided for @auth_email_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get auth_email_hint;

  /// No description provided for @auth_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get auth_password;

  /// No description provided for @auth_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get auth_password_hint;

  /// No description provided for @auth_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get auth_confirm_password;

  /// No description provided for @auth_confirm_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get auth_confirm_password_hint;

  /// No description provided for @auth_no_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get auth_no_account;

  /// No description provided for @auth_already_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get auth_already_account;

  /// No description provided for @auth_join_us_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Join us to rate and save movies'**
  String get auth_join_us_subtitle;

  /// No description provided for @auth_onboarding_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Discover millions of movies, build personalized tracklists, and rate your favorite titles easily.'**
  String get auth_onboarding_subtitle;

  /// No description provided for @auth_get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get auth_get_started;

  /// No description provided for @auth_continue_guest.
  ///
  /// In en, this message translates to:
  /// **'Continue as Guest'**
  String get auth_continue_guest;

  /// No description provided for @auth_login_required_desc.
  ///
  /// In en, this message translates to:
  /// **'Please log in to view your collection'**
  String get auth_login_required_desc;

  /// No description provided for @auth_welcome_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome to My Movies'**
  String get auth_welcome_title;

  /// No description provided for @auth_onboarding_settings.
  ///
  /// In en, this message translates to:
  /// **'Customize your experience'**
  String get auth_onboarding_settings;

  /// No description provided for @auth_errors_email_required.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get auth_errors_email_required;

  /// No description provided for @auth_errors_invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get auth_errors_invalid_email;

  /// No description provided for @auth_errors_password_required.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get auth_errors_password_required;

  /// No description provided for @auth_errors_password_too_short.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get auth_errors_password_too_short;

  /// No description provided for @auth_errors_confirm_password_required.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get auth_errors_confirm_password_required;

  /// No description provided for @auth_errors_passwords_dont_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get auth_errors_passwords_dont_match;

  /// No description provided for @auth_guest_kContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue as Guest'**
  String get auth_guest_kContinue;

  /// No description provided for @auth_guest_get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started / Log In'**
  String get auth_guest_get_started;

  /// No description provided for @auth_reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get auth_reset_password;

  /// No description provided for @auth_reset_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we\'ll send you a link to reset your password.'**
  String get auth_reset_subtitle;

  /// No description provided for @auth_send_reset_link.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get auth_send_reset_link;

  /// No description provided for @auth_reset_sent.
  ///
  /// In en, this message translates to:
  /// **'Reset link sent! Check your email inbox.'**
  String get auth_reset_sent;

  /// No description provided for @auth_back_to_login.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get auth_back_to_login;

  /// No description provided for @onboarding_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Discover millions of movies, build personalized tracklists, and rate your favorite titles easily.'**
  String get onboarding_subtitle;

  /// No description provided for @onboarding_features_browse_title.
  ///
  /// In en, this message translates to:
  /// **'Browse & Discover'**
  String get onboarding_features_browse_title;

  /// No description provided for @onboarding_features_browse_desc.
  ///
  /// In en, this message translates to:
  /// **'Explore trending, top-rated, and upcoming movies.'**
  String get onboarding_features_browse_desc;

  /// No description provided for @onboarding_features_recommend_title.
  ///
  /// In en, this message translates to:
  /// **'Smart Recommendations'**
  String get onboarding_features_recommend_title;

  /// No description provided for @onboarding_features_recommend_desc.
  ///
  /// In en, this message translates to:
  /// **'Swipe through personalized movie suggestions.'**
  String get onboarding_features_recommend_desc;

  /// No description provided for @onboarding_features_favorites_title.
  ///
  /// In en, this message translates to:
  /// **'Favorites & Ratings'**
  String get onboarding_features_favorites_title;

  /// No description provided for @onboarding_features_favorites_desc.
  ///
  /// In en, this message translates to:
  /// **'Save movies you love and share your ratings.'**
  String get onboarding_features_favorites_desc;

  /// No description provided for @onboarding_features_watch_later_title.
  ///
  /// In en, this message translates to:
  /// **'Watch Later'**
  String get onboarding_features_watch_later_title;

  /// No description provided for @onboarding_features_watch_later_desc.
  ///
  /// In en, this message translates to:
  /// **'Build your personal watchlist for later.'**
  String get onboarding_features_watch_later_desc;

  /// No description provided for @onboarding_tooltips_browse_title.
  ///
  /// In en, this message translates to:
  /// **'Cinema'**
  String get onboarding_tooltips_browse_title;

  /// No description provided for @onboarding_tooltips_browse_desc.
  ///
  /// In en, this message translates to:
  /// **'Browse new movies and discover what\'s playing'**
  String get onboarding_tooltips_browse_desc;

  /// No description provided for @onboarding_tooltips_recommend_title.
  ///
  /// In en, this message translates to:
  /// **'What to Watch'**
  String get onboarding_tooltips_recommend_title;

  /// No description provided for @onboarding_tooltips_recommend_desc.
  ///
  /// In en, this message translates to:
  /// **'Swipe through personalized movie recommendations'**
  String get onboarding_tooltips_recommend_desc;

  /// No description provided for @onboarding_tooltips_search_title.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get onboarding_tooltips_search_title;

  /// No description provided for @onboarding_tooltips_search_desc.
  ///
  /// In en, this message translates to:
  /// **'Search for movies, TV shows and actors'**
  String get onboarding_tooltips_search_desc;

  /// No description provided for @onboarding_tooltips_settings_title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get onboarding_tooltips_settings_title;

  /// No description provided for @onboarding_tooltips_settings_desc.
  ///
  /// In en, this message translates to:
  /// **'Customize language, theme and app preferences'**
  String get onboarding_tooltips_settings_desc;

  /// No description provided for @onboarding_tooltips_profile_title.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get onboarding_tooltips_profile_title;

  /// No description provided for @onboarding_tooltips_profile_desc.
  ///
  /// In en, this message translates to:
  /// **'Manage your watchlist, favorites and settings'**
  String get onboarding_tooltips_profile_desc;

  /// No description provided for @guest_features_favorites_title.
  ///
  /// In en, this message translates to:
  /// **'Curate Favorites'**
  String get guest_features_favorites_title;

  /// No description provided for @guest_features_favorites_desc.
  ///
  /// In en, this message translates to:
  /// **'Keep track of the movies you love most.'**
  String get guest_features_favorites_desc;

  /// No description provided for @guest_features_rate_title.
  ///
  /// In en, this message translates to:
  /// **'Rate & Review'**
  String get guest_features_rate_title;

  /// No description provided for @guest_features_rate_desc.
  ///
  /// In en, this message translates to:
  /// **'Share your thoughts and influence others.'**
  String get guest_features_rate_desc;

  /// No description provided for @guest_features_watch_later_title.
  ///
  /// In en, this message translates to:
  /// **'Watch Later'**
  String get guest_features_watch_later_title;

  /// No description provided for @guest_features_watch_later_desc.
  ///
  /// In en, this message translates to:
  /// **'Never lose track of movies you want to see.'**
  String get guest_features_watch_later_desc;

  /// No description provided for @guest_features_sync_title.
  ///
  /// In en, this message translates to:
  /// **'Sync Everywhere'**
  String get guest_features_sync_title;

  /// No description provided for @guest_features_sync_desc.
  ///
  /// In en, this message translates to:
  /// **'Your data is saved securely and synced across all your devices.'**
  String get guest_features_sync_desc;

  /// No description provided for @movie_detail_overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get movie_detail_overview;

  /// No description provided for @movie_detail_watch_later.
  ///
  /// In en, this message translates to:
  /// **'Watch Later'**
  String get movie_detail_watch_later;

  /// No description provided for @movie_detail_saved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get movie_detail_saved;

  /// No description provided for @movie_detail_rate_movie.
  ///
  /// In en, this message translates to:
  /// **'Rate Movie'**
  String get movie_detail_rate_movie;

  /// No description provided for @movie_detail_added_to_favorites.
  ///
  /// In en, this message translates to:
  /// **'Added to favorites'**
  String get movie_detail_added_to_favorites;

  /// No description provided for @movie_detail_removed_from_favorites.
  ///
  /// In en, this message translates to:
  /// **'Removed from favorites'**
  String get movie_detail_removed_from_favorites;

  /// No description provided for @movie_detail_saved_rating.
  ///
  /// In en, this message translates to:
  /// **'Saved rating: '**
  String get movie_detail_saved_rating;

  /// No description provided for @movie_detail_prompts_login_required.
  ///
  /// In en, this message translates to:
  /// **'Login Required'**
  String get movie_detail_prompts_login_required;

  /// No description provided for @movie_detail_prompts_please_sign_in.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to '**
  String get movie_detail_prompts_please_sign_in;

  /// No description provided for @movie_detail_prompts_go_to_login.
  ///
  /// In en, this message translates to:
  /// **'Go to Login'**
  String get movie_detail_prompts_go_to_login;

  /// No description provided for @movie_detail_prompts_rate_title.
  ///
  /// In en, this message translates to:
  /// **'Rate this Movie'**
  String get movie_detail_prompts_rate_title;

  /// No description provided for @movie_detail_prompts_slide_to_rate.
  ///
  /// In en, this message translates to:
  /// **'Slide to set your rating'**
  String get movie_detail_prompts_slide_to_rate;

  /// No description provided for @movie_detail_actions_add_watch_later.
  ///
  /// In en, this message translates to:
  /// **'add to Watch Later'**
  String get movie_detail_actions_add_watch_later;

  /// No description provided for @movie_detail_actions_rate_movies.
  ///
  /// In en, this message translates to:
  /// **'rate movies'**
  String get movie_detail_actions_rate_movies;

  /// No description provided for @movie_detail_play_trailer.
  ///
  /// In en, this message translates to:
  /// **'Play Trailer'**
  String get movie_detail_play_trailer;

  /// No description provided for @movie_detail_watch_trailer.
  ///
  /// In en, this message translates to:
  /// **'Watch Trailer'**
  String get movie_detail_watch_trailer;

  /// No description provided for @movie_detail_on_youtube.
  ///
  /// In en, this message translates to:
  /// **'on YouTube'**
  String get movie_detail_on_youtube;

  /// No description provided for @movie_detail_favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get movie_detail_favorite;

  /// No description provided for @movie_detail_watch.
  ///
  /// In en, this message translates to:
  /// **'Watch'**
  String get movie_detail_watch;

  /// No description provided for @movie_detail_release_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get movie_detail_release_today;

  /// No description provided for @movie_detail_release_1_day.
  ///
  /// In en, this message translates to:
  /// **'1 day'**
  String get movie_detail_release_1_day;

  /// No description provided for @movie_detail_release_days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get movie_detail_release_days;

  /// No description provided for @movie_detail_added_to_watch_later.
  ///
  /// In en, this message translates to:
  /// **'Added to Watch Later'**
  String get movie_detail_added_to_watch_later;

  /// No description provided for @movie_detail_director.
  ///
  /// In en, this message translates to:
  /// **'Director'**
  String get movie_detail_director;

  /// No description provided for @movie_detail_cast.
  ///
  /// In en, this message translates to:
  /// **'Cast'**
  String get movie_detail_cast;

  /// No description provided for @movie_detail_you_might_also_like.
  ///
  /// In en, this message translates to:
  /// **'You Might Also Like'**
  String get movie_detail_you_might_also_like;

  /// No description provided for @movie_detail_show_seasons_and_episodes.
  ///
  /// In en, this message translates to:
  /// **'Seasons & Episodes'**
  String get movie_detail_show_seasons_and_episodes;

  /// No description provided for @movie_detail_show_season.
  ///
  /// In en, this message translates to:
  /// **'Season'**
  String get movie_detail_show_season;

  /// No description provided for @movie_detail_show_episode.
  ///
  /// In en, this message translates to:
  /// **'Episode'**
  String get movie_detail_show_episode;

  /// No description provided for @movie_detail_show_episodes.
  ///
  /// In en, this message translates to:
  /// **'episodes'**
  String get movie_detail_show_episodes;

  /// No description provided for @movie_detail_show_no_episodes.
  ///
  /// In en, this message translates to:
  /// **'No episodes yet'**
  String get movie_detail_show_no_episodes;

  /// No description provided for @movie_detail_original_language.
  ///
  /// In en, this message translates to:
  /// **'Original Language'**
  String get movie_detail_original_language;

  /// No description provided for @actor_born.
  ///
  /// In en, this message translates to:
  /// **'Born:'**
  String get actor_born;

  /// No description provided for @actor_biography.
  ///
  /// In en, this message translates to:
  /// **'Biography'**
  String get actor_biography;

  /// No description provided for @actor_filmography.
  ///
  /// In en, this message translates to:
  /// **'Filmography'**
  String get actor_filmography;

  /// No description provided for @director_born.
  ///
  /// In en, this message translates to:
  /// **'Born:'**
  String get director_born;

  /// No description provided for @director_biography.
  ///
  /// In en, this message translates to:
  /// **'Biography'**
  String get director_biography;

  /// No description provided for @director_filmography.
  ///
  /// In en, this message translates to:
  /// **'Filmography'**
  String get director_filmography;

  /// No description provided for @tv_popular.
  ///
  /// In en, this message translates to:
  /// **'Popular TV Shows'**
  String get tv_popular;

  /// No description provided for @tv_top_rated.
  ///
  /// In en, this message translates to:
  /// **'Top Rated TV Shows'**
  String get tv_top_rated;

  /// No description provided for @tv_airing_today.
  ///
  /// In en, this message translates to:
  /// **'Airing Today'**
  String get tv_airing_today;

  /// No description provided for @tv_on_the_air.
  ///
  /// In en, this message translates to:
  /// **'On The Air'**
  String get tv_on_the_air;

  /// No description provided for @tv_action.
  ///
  /// In en, this message translates to:
  /// **'Action TV'**
  String get tv_action;

  /// No description provided for @tv_comedy.
  ///
  /// In en, this message translates to:
  /// **'Comedy TV'**
  String get tv_comedy;

  /// No description provided for @tv_drama.
  ///
  /// In en, this message translates to:
  /// **'Drama TV'**
  String get tv_drama;

  /// No description provided for @tv_sci_fi_fantasy.
  ///
  /// In en, this message translates to:
  /// **'Sci-Fi & Fantasy'**
  String get tv_sci_fi_fantasy;

  /// No description provided for @tv_mystery.
  ///
  /// In en, this message translates to:
  /// **'Mystery TV'**
  String get tv_mystery;

  /// No description provided for @tv_animation.
  ///
  /// In en, this message translates to:
  /// **'Animation TV'**
  String get tv_animation;

  /// No description provided for @tv_reality.
  ///
  /// In en, this message translates to:
  /// **'Reality TV'**
  String get tv_reality;

  /// No description provided for @tv_horror.
  ///
  /// In en, this message translates to:
  /// **'Horror TV'**
  String get tv_horror;

  /// No description provided for @common_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get common_cancel;

  /// No description provided for @common_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit Rating'**
  String get common_submit;

  /// No description provided for @common_cinema.
  ///
  /// In en, this message translates to:
  /// **'Cinema'**
  String get common_cinema;

  /// No description provided for @common_app_name.
  ///
  /// In en, this message translates to:
  /// **'My Movies'**
  String get common_app_name;

  /// No description provided for @common_empty_list.
  ///
  /// In en, this message translates to:
  /// **'Your list is currently empty'**
  String get common_empty_list;

  /// No description provided for @common_cine_stream.
  ///
  /// In en, this message translates to:
  /// **'My Movies'**
  String get common_cine_stream;

  /// No description provided for @common_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get common_retry;

  /// No description provided for @common_error_title.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get common_error_title;

  /// No description provided for @common_see_all.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get common_see_all;

  /// No description provided for @common_back_to_browse.
  ///
  /// In en, this message translates to:
  /// **'Back to Browse'**
  String get common_back_to_browse;

  /// No description provided for @common_collection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get common_collection;

  /// No description provided for @common_my_movie.
  ///
  /// In en, this message translates to:
  /// **'My Movies'**
  String get common_my_movie;

  /// No description provided for @genres_g_28.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get genres_g_28;

  /// No description provided for @genres_g_12.
  ///
  /// In en, this message translates to:
  /// **'Adventure'**
  String get genres_g_12;

  /// No description provided for @genres_g_16.
  ///
  /// In en, this message translates to:
  /// **'Animation'**
  String get genres_g_16;

  /// No description provided for @genres_g_35.
  ///
  /// In en, this message translates to:
  /// **'Comedy'**
  String get genres_g_35;

  /// No description provided for @genres_g_80.
  ///
  /// In en, this message translates to:
  /// **'Crime'**
  String get genres_g_80;

  /// No description provided for @genres_g_99.
  ///
  /// In en, this message translates to:
  /// **'Documentary'**
  String get genres_g_99;

  /// No description provided for @genres_g_18.
  ///
  /// In en, this message translates to:
  /// **'Drama'**
  String get genres_g_18;

  /// No description provided for @genres_g_10751.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get genres_g_10751;

  /// No description provided for @genres_g_14.
  ///
  /// In en, this message translates to:
  /// **'Fantasy'**
  String get genres_g_14;

  /// No description provided for @genres_g_36.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get genres_g_36;

  /// No description provided for @genres_g_27.
  ///
  /// In en, this message translates to:
  /// **'Horror'**
  String get genres_g_27;

  /// No description provided for @genres_g_10402.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get genres_g_10402;

  /// No description provided for @genres_g_9648.
  ///
  /// In en, this message translates to:
  /// **'Mystery'**
  String get genres_g_9648;

  /// No description provided for @genres_g_10749.
  ///
  /// In en, this message translates to:
  /// **'Romance'**
  String get genres_g_10749;

  /// No description provided for @genres_g_878.
  ///
  /// In en, this message translates to:
  /// **'Sci-Fi'**
  String get genres_g_878;

  /// No description provided for @genres_g_10770.
  ///
  /// In en, this message translates to:
  /// **'TV Movie'**
  String get genres_g_10770;

  /// No description provided for @genres_g_53.
  ///
  /// In en, this message translates to:
  /// **'Thriller'**
  String get genres_g_53;

  /// No description provided for @genres_g_10752.
  ///
  /// In en, this message translates to:
  /// **'War'**
  String get genres_g_10752;

  /// No description provided for @genres_g_37.
  ///
  /// In en, this message translates to:
  /// **'Western'**
  String get genres_g_37;

  /// No description provided for @genres_tv_g_10759.
  ///
  /// In en, this message translates to:
  /// **'Action & Adventure'**
  String get genres_tv_g_10759;

  /// No description provided for @genres_tv_g_10762.
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get genres_tv_g_10762;

  /// No description provided for @genres_tv_g_10763.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get genres_tv_g_10763;

  /// No description provided for @genres_tv_g_10764.
  ///
  /// In en, this message translates to:
  /// **'Reality'**
  String get genres_tv_g_10764;

  /// No description provided for @genres_tv_g_10765.
  ///
  /// In en, this message translates to:
  /// **'Sci-Fi & Fantasy'**
  String get genres_tv_g_10765;

  /// No description provided for @genres_tv_g_10766.
  ///
  /// In en, this message translates to:
  /// **'Soap'**
  String get genres_tv_g_10766;

  /// No description provided for @genres_tv_g_10767.
  ///
  /// In en, this message translates to:
  /// **'Talk'**
  String get genres_tv_g_10767;

  /// No description provided for @genres_tv_g_10768.
  ///
  /// In en, this message translates to:
  /// **'War & Politics'**
  String get genres_tv_g_10768;

  /// No description provided for @errors_search_failed.
  ///
  /// In en, this message translates to:
  /// **'Search failed. Please try again.'**
  String get errors_search_failed;

  /// No description provided for @errors_search_tv_failed.
  ///
  /// In en, this message translates to:
  /// **'TV show search failed. Please try again.'**
  String get errors_search_tv_failed;

  /// No description provided for @errors_load_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load content.'**
  String get errors_load_failed;

  /// No description provided for @errors_network_timeout.
  ///
  /// In en, this message translates to:
  /// **'Network timeout. Please check your connection.'**
  String get errors_network_timeout;

  /// No description provided for @errors_server_error.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again.'**
  String get errors_server_error;

  /// No description provided for @errors_network_error.
  ///
  /// In en, this message translates to:
  /// **'Unexpected network error.'**
  String get errors_network_error;

  /// No description provided for @errors_request_failed.
  ///
  /// In en, this message translates to:
  /// **'Request failed.'**
  String get errors_request_failed;

  /// No description provided for @errors_sign_up_failed.
  ///
  /// In en, this message translates to:
  /// **'Sign up failed.'**
  String get errors_sign_up_failed;

  /// No description provided for @errors_auth_failed.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed.'**
  String get errors_auth_failed;

  /// No description provided for @connectivity_title.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get connectivity_title;

  /// No description provided for @connectivity_description.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again. My Movie app requires an active internet connection to function properly.'**
  String get connectivity_description;

  /// No description provided for @connectivity_troubleshooting_title.
  ///
  /// In en, this message translates to:
  /// **'Troubleshooting Tips:'**
  String get connectivity_troubleshooting_title;

  /// No description provided for @connectivity_tips_airplane_mode.
  ///
  /// In en, this message translates to:
  /// **'✓ Turn off airplane mode'**
  String get connectivity_tips_airplane_mode;

  /// No description provided for @connectivity_tips_check_data.
  ///
  /// In en, this message translates to:
  /// **'✓ Check WiFi or mobile data'**
  String get connectivity_tips_check_data;

  /// No description provided for @connectivity_tips_move_closer.
  ///
  /// In en, this message translates to:
  /// **'✓ Move closer to WiFi router'**
  String get connectivity_tips_move_closer;

  /// No description provided for @connectivity_tips_restart_device.
  ///
  /// In en, this message translates to:
  /// **'✓ Restart your device'**
  String get connectivity_tips_restart_device;

  /// No description provided for @connectivity_check_connection.
  ///
  /// In en, this message translates to:
  /// **'Checking connection...'**
  String get connectivity_check_connection;

  /// No description provided for @connectivity_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get connectivity_retry;

  /// No description provided for @connectivity_offline_banner.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline -- some features may be limited'**
  String get connectivity_offline_banner;

  /// No description provided for @connectivity_browse_watch_later.
  ///
  /// In en, this message translates to:
  /// **'Browse Watch Later'**
  String get connectivity_browse_watch_later;

  /// No description provided for @not_found_title.
  ///
  /// In en, this message translates to:
  /// **'Page Not Found'**
  String get not_found_title;

  /// No description provided for @not_found_title_404.
  ///
  /// In en, this message translates to:
  /// **'404 - Page Not Found'**
  String get not_found_title_404;

  /// No description provided for @not_found_subtitle.
  ///
  /// In en, this message translates to:
  /// **'The page you are looking for does not exist or has been moved.'**
  String get not_found_subtitle;

  /// No description provided for @not_found_return_home.
  ///
  /// In en, this message translates to:
  /// **'Return to Home'**
  String get not_found_return_home;

  /// No description provided for @what_to_watch_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome to What to Watch'**
  String get what_to_watch_dialog_title;

  /// No description provided for @what_to_watch_dialog_step1_title.
  ///
  /// In en, this message translates to:
  /// **'Set Your Preferences'**
  String get what_to_watch_dialog_step1_title;

  /// No description provided for @what_to_watch_dialog_step1_desc.
  ///
  /// In en, this message translates to:
  /// **'Choose genres, rating range, release year, and sort order to find exactly what you\'re in the mood for.'**
  String get what_to_watch_dialog_step1_desc;

  /// No description provided for @what_to_watch_dialog_step2_title.
  ///
  /// In en, this message translates to:
  /// **'Swipe Through Movies'**
  String get what_to_watch_dialog_step2_title;

  /// No description provided for @what_to_watch_dialog_step2_desc.
  ///
  /// In en, this message translates to:
  /// **'Swipe right to save a movie or swipe left to skip it. Tap a card for details.'**
  String get what_to_watch_dialog_step2_desc;

  /// No description provided for @what_to_watch_dialog_step3_title.
  ///
  /// In en, this message translates to:
  /// **'Watch Later'**
  String get what_to_watch_dialog_step3_title;

  /// No description provided for @what_to_watch_dialog_step3_desc.
  ///
  /// In en, this message translates to:
  /// **'All saved movies appear in your profile under Watch Later.'**
  String get what_to_watch_dialog_step3_desc;

  /// No description provided for @what_to_watch_dialog_got_it.
  ///
  /// In en, this message translates to:
  /// **'Got it!'**
  String get what_to_watch_dialog_got_it;

  /// No description provided for @swipe_title.
  ///
  /// In en, this message translates to:
  /// **'What to Watch'**
  String get swipe_title;

  /// No description provided for @swipe_save_label.
  ///
  /// In en, this message translates to:
  /// **'SAVE'**
  String get swipe_save_label;

  /// No description provided for @swipe_skip_label.
  ///
  /// In en, this message translates to:
  /// **'SKIP'**
  String get swipe_skip_label;

  /// No description provided for @swipe_nope_label.
  ///
  /// In en, this message translates to:
  /// **'NOPE'**
  String get swipe_nope_label;

  /// No description provided for @swipe_watch_later_label.
  ///
  /// In en, this message translates to:
  /// **'WATCH LATER'**
  String get swipe_watch_later_label;

  /// No description provided for @swipe_hint.
  ///
  /// In en, this message translates to:
  /// **'Swipe right to save'**
  String get swipe_hint;

  /// No description provided for @swipe_error_title.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get swipe_error_title;

  /// No description provided for @swipe_retry.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get swipe_retry;

  /// No description provided for @swipe_empty_no_movies.
  ///
  /// In en, this message translates to:
  /// **'No movies found. Try different filters.'**
  String get swipe_empty_no_movies;

  /// No description provided for @swipe_change_filters.
  ///
  /// In en, this message translates to:
  /// **'Change Filters'**
  String get swipe_change_filters;

  /// No description provided for @swipe_all_caught_up.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up!'**
  String get swipe_all_caught_up;

  /// No description provided for @swipe_no_movies_added.
  ///
  /// In en, this message translates to:
  /// **'No movies were added to watch later.'**
  String get swipe_no_movies_added;

  /// No description provided for @swipe_movie_added.
  ///
  /// In en, this message translates to:
  /// **'movie added to watch later!'**
  String get swipe_movie_added;

  /// No description provided for @swipe_movies_added.
  ///
  /// In en, this message translates to:
  /// **'movies added to watch later!'**
  String get swipe_movies_added;

  /// No description provided for @swipe_view_watch_later.
  ///
  /// In en, this message translates to:
  /// **'View Watch Later'**
  String get swipe_view_watch_later;

  /// No description provided for @swipe_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get swipe_skip;

  /// No description provided for @swipe_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get swipe_save;

  /// No description provided for @swipe_genres.
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get swipe_genres;

  /// No description provided for @swipe_selected.
  ///
  /// In en, this message translates to:
  /// **'selected'**
  String get swipe_selected;

  /// No description provided for @swipe_select_genres.
  ///
  /// In en, this message translates to:
  /// **'Select Genres'**
  String get swipe_select_genres;

  /// No description provided for @swipe_minimum_rating.
  ///
  /// In en, this message translates to:
  /// **'Minimum Rating'**
  String get swipe_minimum_rating;

  /// No description provided for @swipe_release_year.
  ///
  /// In en, this message translates to:
  /// **'Release Year'**
  String get swipe_release_year;

  /// No description provided for @swipe_sort_by.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get swipe_sort_by;

  /// No description provided for @swipe_shuffle.
  ///
  /// In en, this message translates to:
  /// **'Shuffle'**
  String get swipe_shuffle;

  /// No description provided for @swipe_start_swiping.
  ///
  /// In en, this message translates to:
  /// **'Start Swiping'**
  String get swipe_start_swiping;

  /// No description provided for @swipe_year_from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get swipe_year_from;

  /// No description provided for @swipe_year_to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get swipe_year_to;

  /// No description provided for @swipe_year_any.
  ///
  /// In en, this message translates to:
  /// **'Any'**
  String get swipe_year_any;

  /// No description provided for @swipe_age_rating.
  ///
  /// In en, this message translates to:
  /// **'Age Rating'**
  String get swipe_age_rating;

  /// No description provided for @swipe_age_any.
  ///
  /// In en, this message translates to:
  /// **'Any'**
  String get swipe_age_any;

  /// No description provided for @swipe_age_g.
  ///
  /// In en, this message translates to:
  /// **'G (General)'**
  String get swipe_age_g;

  /// No description provided for @swipe_age_pg.
  ///
  /// In en, this message translates to:
  /// **'PG'**
  String get swipe_age_pg;

  /// No description provided for @swipe_age_pg13.
  ///
  /// In en, this message translates to:
  /// **'PG-13'**
  String get swipe_age_pg13;

  /// No description provided for @swipe_age_r.
  ///
  /// In en, this message translates to:
  /// **'R'**
  String get swipe_age_r;

  /// No description provided for @swipe_age_nc17.
  ///
  /// In en, this message translates to:
  /// **'NC-17'**
  String get swipe_age_nc17;

  /// No description provided for @swipe_sort_options_most_popular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get swipe_sort_options_most_popular;

  /// No description provided for @swipe_sort_options_highest_rated.
  ///
  /// In en, this message translates to:
  /// **'Highest Rated'**
  String get swipe_sort_options_highest_rated;

  /// No description provided for @swipe_sort_options_newest_first.
  ///
  /// In en, this message translates to:
  /// **'Newest First'**
  String get swipe_sort_options_newest_first;

  /// No description provided for @swipe_sort_options_oldest_first.
  ///
  /// In en, this message translates to:
  /// **'Oldest First'**
  String get swipe_sort_options_oldest_first;

  /// No description provided for @swipe_sort_options_highest_revenue.
  ///
  /// In en, this message translates to:
  /// **'Highest Revenue'**
  String get swipe_sort_options_highest_revenue;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'ku'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'ku':
      return AppLocalizationsKu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
