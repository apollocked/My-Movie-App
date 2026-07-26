// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:my_movie/l10n/app_localizations.dart';

Translations get t => TranslationsManager.t;

class TranslationsManager {
  static Translations? _instance;
  static Translations get t => _instance!;
  static void init(AppLocalizations l) => _instance = Translations(l);
}

class Translations {
  final AppLocalizations _l;
  Translations(this._l);

  late final _Home home = _Home(_l);
  late final _Search search = _Search(_l);
  late final _Profile profile = _Profile(_l);
  late final _Settings settings = _Settings(_l);
  late final _Privacy privacy = _Privacy(_l);
  late final _Auth auth = _Auth(_l);
  late final _Onboarding onboarding = _Onboarding(_l);
  late final _GuestFeatures guest_features = _GuestFeatures(_l);
  late final _MovieDetail movie_detail = _MovieDetail(_l);
  late final _Actor actor = _Actor(_l);
  late final _Director director = _Director(_l);
  late final _Tv tv = _Tv(_l);
  late final _Common common = _Common(_l);
  late final _Genres genres = _Genres(_l);
  late final _GenresTv genres_tv = _GenresTv(_l);
  late final _Errors errors = _Errors(_l);
  late final _Connectivity connectivity = _Connectivity(_l);
  late final _NotFound not_found = _NotFound(_l);
  late final _WhatToWatchDialog what_to_watch_dialog = _WhatToWatchDialog(_l);
  late final _Swipe swipe = _Swipe(_l);
}

extension BuildContextTranslations on BuildContext {
  Translations get t => Translations(AppLocalizations.of(this)!);
}

class _Home {
  final AppLocalizations _l;
  _Home(this._l);
  String get trending => _l.home_trending;
  String get top_rated => _l.home_top_rated;
  String get now_playing => _l.home_now_playing;
  String get popular => _l.home_popular;
  String get upcoming => _l.home_upcoming;
  String get action => _l.home_action;
  String get sci_fi => _l.home_sci_fi;
  String get horror => _l.home_horror;
  String get drama => _l.home_drama;
  String get comedy => _l.home_comedy;
  String get romance => _l.home_romance;
  String get thriller => _l.home_thriller;
  String get animation => _l.home_animation;
  String get mystery => _l.home_mystery;
}

class _Search {
  final AppLocalizations _l;
  _Search(this._l);
  String get explore => _l.search_explore;
  String get explore_caps => _l.search_explore_caps;
  String get hint => _l.search_hint;
  String get no_results => _l.search_no_results;
  String get no_results_subtitle => _l.search_no_results_subtitle;
  String get discover_title => _l.search_discover_title;
  String get discover_subtitle => _l.search_discover_subtitle;
  String get recent_searches => _l.search_recent_searches;
  String get clear => _l.search_clear;
  String get browse_categories => _l.search_browse_categories;
  String get browse_all => _l.search_browse_all;
  String get top_rated_badge => _l.search_top_rated_badge;
  String get browse => _l.search_browse;
  late final _SearchFilters filters = _SearchFilters(_l);
}

class _SearchFilters {
  final AppLocalizations _l;
  _SearchFilters(this._l);
  String get all => _l.search_filters_all;
  String get movies => _l.search_filters_movies;
  String get tv_shows => _l.search_filters_tv_shows;
  String get actors => _l.search_filters_actors;
  String get language => _l.search_filters_language;
}

class _Profile {
  final AppLocalizations _l;
  _Profile(this._l);
  String get title => _l.profile_title;
  String get my_activity => _l.profile_my_activity;
  String get watch_later => _l.profile_watch_later;
  String get favorites => _l.profile_favorites;
  String get my_favorites => _l.profile_my_favorites;
  String get ratings => _l.profile_ratings;
  String get my_ratings => _l.profile_my_ratings;
  String get account => _l.profile_account;
  String get logout => _l.profile_logout;
  String get logout_confirm => _l.profile_logout_confirm;
  String get default_name => _l.profile_default_name;
}

class _Settings {
  final AppLocalizations _l;
  _Settings(this._l);
  String get title => _l.settings_title;
  String get language => _l.settings_language;
  String get dark_mode => _l.settings_dark_mode;
  String get lang_en => _l.settings_lang_en;
  String get lang_ku => _l.settings_lang_ku;
  String get lang_ar => _l.settings_lang_ar;
  String get privacy_policy => _l.settings_privacy_policy;
  String get legal => _l.settings_legal;
  String get support => _l.settings_support;
  String get contact_us => _l.settings_contact_us;
  String get email => _l.settings_email;
}

class _Privacy {
  final AppLocalizations _l;
  _Privacy(this._l);
  String get title => _l.privacy_title;
  String get last_updated => _l.privacy_last_updated;
  String get introduction => _l.privacy_introduction;
  String get info_collect_title => _l.privacy_info_collect_title;
  String get info_collect => _l.privacy_info_collect;
  String get how_use_title => _l.privacy_how_use_title;
  String get how_use => _l.privacy_how_use;
  String get data_security_title => _l.privacy_data_security_title;
  String get data_security => _l.privacy_data_security;
  String get contact_title => _l.privacy_contact_title;
  String get contact => _l.privacy_contact;
}

class _Auth {
  final AppLocalizations _l;
  _Auth(this._l);
  String get login => _l.auth_login;
  String get signup => _l.auth_signup;
  String get create_account => _l.auth_create_account;
  String get welcome_back => _l.auth_welcome_back;
  String get login_subtitle => _l.auth_login_subtitle;
  String get join_community => _l.auth_join_community;
  String get join_subtitle => _l.auth_join_subtitle;
  String get email => _l.auth_email;
  String get email_hint => _l.auth_email_hint;
  String get password => _l.auth_password;
  String get password_hint => _l.auth_password_hint;
  String get confirm_password => _l.auth_confirm_password;
  String get confirm_password_hint => _l.auth_confirm_password_hint;
  String get no_account => _l.auth_no_account;
  String get already_account => _l.auth_already_account;
  String get join_us_subtitle => _l.auth_join_us_subtitle;
  String get onboarding_subtitle => _l.auth_onboarding_subtitle;
  String get get_started => _l.auth_get_started;
  String get continue_guest => _l.auth_continue_guest;
  String get login_required_desc => _l.auth_login_required_desc;
  String get welcome_title => _l.auth_welcome_title;
  String get onboarding_settings => _l.auth_onboarding_settings;
  String get reset_password => _l.auth_reset_password;
  String get reset_subtitle => _l.auth_reset_subtitle;
  String get send_reset_link => _l.auth_send_reset_link;
  String get reset_sent => _l.auth_reset_sent;
  String get back_to_login => _l.auth_back_to_login;
  String get login_with_google => _l.auth_login_with_google;
  late final _AuthErrors errors = _AuthErrors(_l);
  late final _AuthGuest guest = _AuthGuest(_l);
}

class _AuthErrors {
  final AppLocalizations _l;
  _AuthErrors(this._l);
  String get email_required => _l.auth_errors_email_required;
  String get invalid_email => _l.auth_errors_invalid_email;
  String get password_required => _l.auth_errors_password_required;
  String get password_too_short => _l.auth_errors_password_too_short;
  String get confirm_password_required =>
      _l.auth_errors_confirm_password_required;
  String get passwords_dont_match => _l.auth_errors_passwords_dont_match;
}

class _AuthGuest {
  final AppLocalizations _l;
  _AuthGuest(this._l);
  String get kContinue => _l.auth_guest_kContinue;
  String get get_started => _l.auth_guest_get_started;
}

class _Onboarding {
  final AppLocalizations _l;
  _Onboarding(this._l);
  String get subtitle => _l.onboarding_subtitle;
  late final _OnboardingFeatures features = _OnboardingFeatures(_l);
  late final _OnboardingTooltips tooltips = _OnboardingTooltips(_l);
}

class _OnboardingFeatures {
  final AppLocalizations _l;
  _OnboardingFeatures(this._l);
  late final _OnboardingFeaturesBrowse browse = _OnboardingFeaturesBrowse(_l);
  late final _OnboardingFeaturesRecommend recommend =
      _OnboardingFeaturesRecommend(_l);
  late final _OnboardingFeaturesFavorites favorites =
      _OnboardingFeaturesFavorites(_l);
  late final _OnboardingFeaturesWatchLater watch_later =
      _OnboardingFeaturesWatchLater(_l);
}

class _OnboardingFeaturesBrowse {
  final AppLocalizations _l;
  _OnboardingFeaturesBrowse(this._l);
  String get title => _l.onboarding_features_browse_title;
  String get desc => _l.onboarding_features_browse_desc;
}

class _OnboardingFeaturesRecommend {
  final AppLocalizations _l;
  _OnboardingFeaturesRecommend(this._l);
  String get title => _l.onboarding_features_recommend_title;
  String get desc => _l.onboarding_features_recommend_desc;
}

class _OnboardingFeaturesFavorites {
  final AppLocalizations _l;
  _OnboardingFeaturesFavorites(this._l);
  String get title => _l.onboarding_features_favorites_title;
  String get desc => _l.onboarding_features_favorites_desc;
}

class _OnboardingFeaturesWatchLater {
  final AppLocalizations _l;
  _OnboardingFeaturesWatchLater(this._l);
  String get title => _l.onboarding_features_watch_later_title;
  String get desc => _l.onboarding_features_watch_later_desc;
}

class _OnboardingTooltips {
  final AppLocalizations _l;
  _OnboardingTooltips(this._l);
  late final _OnboardingTooltipsBrowse browse = _OnboardingTooltipsBrowse(_l);
  late final _OnboardingTooltipsRecommend recommend =
      _OnboardingTooltipsRecommend(_l);
  late final _OnboardingTooltipsSearch search = _OnboardingTooltipsSearch(_l);
  late final _OnboardingTooltipsSettings settings =
      _OnboardingTooltipsSettings(_l);
  late final _OnboardingTooltipsProfile profile =
      _OnboardingTooltipsProfile(_l);
}

class _OnboardingTooltipsBrowse {
  final AppLocalizations _l;
  _OnboardingTooltipsBrowse(this._l);
  String get title => _l.onboarding_tooltips_browse_title;
  String get desc => _l.onboarding_tooltips_browse_desc;
}

class _OnboardingTooltipsRecommend {
  final AppLocalizations _l;
  _OnboardingTooltipsRecommend(this._l);
  String get title => _l.onboarding_tooltips_recommend_title;
  String get desc => _l.onboarding_tooltips_recommend_desc;
}

class _OnboardingTooltipsSearch {
  final AppLocalizations _l;
  _OnboardingTooltipsSearch(this._l);
  String get title => _l.onboarding_tooltips_search_title;
  String get desc => _l.onboarding_tooltips_search_desc;
}

class _OnboardingTooltipsSettings {
  final AppLocalizations _l;
  _OnboardingTooltipsSettings(this._l);
  String get title => _l.onboarding_tooltips_settings_title;
  String get desc => _l.onboarding_tooltips_settings_desc;
}

class _OnboardingTooltipsProfile {
  final AppLocalizations _l;
  _OnboardingTooltipsProfile(this._l);
  String get title => _l.onboarding_tooltips_profile_title;
  String get desc => _l.onboarding_tooltips_profile_desc;
}

class _GuestFeatures {
  final AppLocalizations _l;
  _GuestFeatures(this._l);
  late final _GuestFeaturesFavorites favorites = _GuestFeaturesFavorites(_l);
  late final _GuestFeaturesRate rate = _GuestFeaturesRate(_l);
  late final _GuestFeaturesWatchLater watch_later =
      _GuestFeaturesWatchLater(_l);
  late final _GuestFeaturesSync sync = _GuestFeaturesSync(_l);
}

class _GuestFeaturesFavorites {
  final AppLocalizations _l;
  _GuestFeaturesFavorites(this._l);
  String get title => _l.guest_features_favorites_title;
  String get desc => _l.guest_features_favorites_desc;
}

class _GuestFeaturesRate {
  final AppLocalizations _l;
  _GuestFeaturesRate(this._l);
  String get title => _l.guest_features_rate_title;
  String get desc => _l.guest_features_rate_desc;
}

class _GuestFeaturesWatchLater {
  final AppLocalizations _l;
  _GuestFeaturesWatchLater(this._l);
  String get title => _l.guest_features_watch_later_title;
  String get desc => _l.guest_features_watch_later_desc;
}

class _GuestFeaturesSync {
  final AppLocalizations _l;
  _GuestFeaturesSync(this._l);
  String get title => _l.guest_features_sync_title;
  String get desc => _l.guest_features_sync_desc;
}

class _MovieDetail {
  final AppLocalizations _l;
  _MovieDetail(this._l);
  String get overview => _l.movie_detail_overview;
  String get watch_later => _l.movie_detail_watch_later;
  String get saved => _l.movie_detail_saved;
  String get rate_movie => _l.movie_detail_rate_movie;
  String get added_to_favorites => _l.movie_detail_added_to_favorites;
  String get removed_from_favorites => _l.movie_detail_removed_from_favorites;
  String get saved_rating => _l.movie_detail_saved_rating;
  String get play_trailer => _l.movie_detail_play_trailer;
  String get watch_trailer => _l.movie_detail_watch_trailer;
  String get on_youtube => _l.movie_detail_on_youtube;
  String get favorite => _l.movie_detail_favorite;
  String get watch => _l.movie_detail_watch;
  String get release_today => _l.movie_detail_release_today;
  String get release_1_day => _l.movie_detail_release_1_day;
  String get release_days => _l.movie_detail_release_days;
  String get added_to_watch_later => _l.movie_detail_added_to_watch_later;
  String get director => _l.movie_detail_director;
  String get cast => _l.movie_detail_cast;
  String get original_language => _l.movie_detail_original_language;
  String get you_might_also_like => _l.movie_detail_you_might_also_like;
  late final _MovieDetailPrompts prompts = _MovieDetailPrompts(_l);
  late final _MovieDetailActions actions = _MovieDetailActions(_l);
  late final _MovieDetailShow show = _MovieDetailShow(_l);
}

class _MovieDetailPrompts {
  final AppLocalizations _l;
  _MovieDetailPrompts(this._l);
  String get login_required => _l.movie_detail_prompts_login_required;
  String get please_sign_in => _l.movie_detail_prompts_please_sign_in;
  String get go_to_login => _l.movie_detail_prompts_go_to_login;
  String get rate_title => _l.movie_detail_prompts_rate_title;
  String get slide_to_rate => _l.movie_detail_prompts_slide_to_rate;
}

class _MovieDetailActions {
  final AppLocalizations _l;
  _MovieDetailActions(this._l);
  String get add_watch_later => _l.movie_detail_actions_add_watch_later;
  String get rate_movies => _l.movie_detail_actions_rate_movies;
}

class _MovieDetailShow {
  final AppLocalizations _l;
  _MovieDetailShow(this._l);
  String get seasons_and_episodes => _l.movie_detail_show_seasons_and_episodes;
  String get season => _l.movie_detail_show_season;
  String get episode => _l.movie_detail_show_episode;
  String get episodes => _l.movie_detail_show_episodes;
  String get no_episodes => _l.movie_detail_show_no_episodes;
}

class _Actor {
  final AppLocalizations _l;
  _Actor(this._l);
  String get born => _l.actor_born;
  String get biography => _l.actor_biography;
  String get filmography => _l.actor_filmography;
}

class _Director {
  final AppLocalizations _l;
  _Director(this._l);
  String get born => _l.director_born;
  String get biography => _l.director_biography;
  String get filmography => _l.director_filmography;
}

class _Tv {
  final AppLocalizations _l;
  _Tv(this._l);
  String get popular => _l.tv_popular;
  String get top_rated => _l.tv_top_rated;
  String get airing_today => _l.tv_airing_today;
  String get on_the_air => _l.tv_on_the_air;
  String get action => _l.tv_action;
  String get comedy => _l.tv_comedy;
  String get drama => _l.tv_drama;
  String get sci_fi_fantasy => _l.tv_sci_fi_fantasy;
  String get mystery => _l.tv_mystery;
  String get animation => _l.tv_animation;
  String get reality => _l.tv_reality;
  String get horror => _l.tv_horror;
}

class _Common {
  final AppLocalizations _l;
  _Common(this._l);
  String get cancel => _l.common_cancel;
  String get submit => _l.common_submit;
  String get cinema => _l.common_cinema;
  String get app_name => _l.common_app_name;
  String get empty_list => _l.common_empty_list;
  String get cine_stream => _l.common_cine_stream;
  String get retry => _l.common_retry;
  String get error_title => _l.common_error_title;
  String get see_all => _l.common_see_all;
  String get back_to_browse => _l.common_back_to_browse;
  String get collection => _l.common_collection;
  String get my_movie => _l.common_my_movie;
}

class _Genres {
  final AppLocalizations _l;
  _Genres(this._l);
  String get g_28 => _l.genres_g_28;
  String get g_12 => _l.genres_g_12;
  String get g_16 => _l.genres_g_16;
  String get g_35 => _l.genres_g_35;
  String get g_80 => _l.genres_g_80;
  String get g_99 => _l.genres_g_99;
  String get g_18 => _l.genres_g_18;
  String get g_10751 => _l.genres_g_10751;
  String get g_14 => _l.genres_g_14;
  String get g_36 => _l.genres_g_36;
  String get g_27 => _l.genres_g_27;
  String get g_10402 => _l.genres_g_10402;
  String get g_9648 => _l.genres_g_9648;
  String get g_10749 => _l.genres_g_10749;
  String get g_878 => _l.genres_g_878;
  String get g_10770 => _l.genres_g_10770;
  String get g_53 => _l.genres_g_53;
  String get g_10752 => _l.genres_g_10752;
  String get g_37 => _l.genres_g_37;
}

class _GenresTv {
  final AppLocalizations _l;
  _GenresTv(this._l);
  String get g_10759 => _l.genres_tv_g_10759;
  String get g_10762 => _l.genres_tv_g_10762;
  String get g_10763 => _l.genres_tv_g_10763;
  String get g_10764 => _l.genres_tv_g_10764;
  String get g_10765 => _l.genres_tv_g_10765;
  String get g_10766 => _l.genres_tv_g_10766;
  String get g_10767 => _l.genres_tv_g_10767;
  String get g_10768 => _l.genres_tv_g_10768;
}

class _Errors {
  final AppLocalizations _l;
  _Errors(this._l);
  String get search_failed => _l.errors_search_failed;
  String get search_tv_failed => _l.errors_search_tv_failed;
  String get load_failed => _l.errors_load_failed;
  String get network_timeout => _l.errors_network_timeout;
  String get server_error => _l.errors_server_error;
  String get network_error => _l.errors_network_error;
  String get request_failed => _l.errors_request_failed;
  String get sign_up_failed => _l.errors_sign_up_failed;
  String get auth_failed => _l.errors_auth_failed;
}

class _Connectivity {
  final AppLocalizations _l;
  _Connectivity(this._l);
  String get title => _l.connectivity_title;
  String get description => _l.connectivity_description;
  String get troubleshooting_title => _l.connectivity_troubleshooting_title;
  String get check_connection => _l.connectivity_check_connection;
  String get retry => _l.connectivity_retry;
  String get offline_banner => _l.connectivity_offline_banner;
  String get browse_watch_later => _l.connectivity_browse_watch_later;
  late final _ConnectivityTips tips = _ConnectivityTips(_l);
}

class _ConnectivityTips {
  final AppLocalizations _l;
  _ConnectivityTips(this._l);
  String get airplane_mode => _l.connectivity_tips_airplane_mode;
  String get check_data => _l.connectivity_tips_check_data;
  String get move_closer => _l.connectivity_tips_move_closer;
  String get restart_device => _l.connectivity_tips_restart_device;
}

class _NotFound {
  final AppLocalizations _l;
  _NotFound(this._l);
  String get title => _l.not_found_title;
  String get title_404 => _l.not_found_title_404;
  String get subtitle => _l.not_found_subtitle;
  String get return_home => _l.not_found_return_home;
}

class _WhatToWatchDialog {
  final AppLocalizations _l;
  _WhatToWatchDialog(this._l);
  String get title => _l.what_to_watch_dialog_title;
  String get step1_title => _l.what_to_watch_dialog_step1_title;
  String get step1_desc => _l.what_to_watch_dialog_step1_desc;
  String get step2_title => _l.what_to_watch_dialog_step2_title;
  String get step2_desc => _l.what_to_watch_dialog_step2_desc;
  String get step3_title => _l.what_to_watch_dialog_step3_title;
  String get step3_desc => _l.what_to_watch_dialog_step3_desc;
  String get got_it => _l.what_to_watch_dialog_got_it;
}

class _Swipe {
  final AppLocalizations _l;
  _Swipe(this._l);
  String get title => _l.swipe_title;
  String get save_label => _l.swipe_save_label;
  String get skip_label => _l.swipe_skip_label;
  String get nope_label => _l.swipe_nope_label;
  String get watch_later_label => _l.swipe_watch_later_label;
  String get hint => _l.swipe_hint;
  String get error_title => _l.swipe_error_title;
  String get retry => _l.swipe_retry;
  String get empty_no_movies => _l.swipe_empty_no_movies;
  String get change_filters => _l.swipe_change_filters;
  String get all_caught_up => _l.swipe_all_caught_up;
  String get no_movies_added => _l.swipe_no_movies_added;
  String get movie_added => _l.swipe_movie_added;
  String get movies_added => _l.swipe_movies_added;
  String get view_watch_later => _l.swipe_view_watch_later;
  String get skip => _l.swipe_skip;
  String get save => _l.swipe_save;
  String get genres => _l.swipe_genres;
  String get selected => _l.swipe_selected;
  String get select_genres => _l.swipe_select_genres;
  String get minimum_rating => _l.swipe_minimum_rating;
  String get release_year => _l.swipe_release_year;
  String get sort_by => _l.swipe_sort_by;
  String get shuffle => _l.swipe_shuffle;
  String get start_swiping => _l.swipe_start_swiping;
  String get year_from => _l.swipe_year_from;
  String get year_to => _l.swipe_year_to;
  String get year_any => _l.swipe_year_any;
  String get age_rating => _l.swipe_age_rating;
  String get age_any => _l.swipe_age_any;
  String get age_g => _l.swipe_age_g;
  String get age_pg => _l.swipe_age_pg;
  String get age_pg13 => _l.swipe_age_pg13;
  String get age_r => _l.swipe_age_r;
  String get age_nc17 => _l.swipe_age_nc17;
  late final _SwipeSortOptions sort_options = _SwipeSortOptions(_l);
}

class _SwipeSortOptions {
  final AppLocalizations _l;
  _SwipeSortOptions(this._l);
  String get most_popular => _l.swipe_sort_options_most_popular;
  String get highest_rated => _l.swipe_sort_options_highest_rated;
  String get newest_first => _l.swipe_sort_options_newest_first;
  String get oldest_first => _l.swipe_sort_options_oldest_first;
  String get highest_revenue => _l.swipe_sort_options_highest_revenue;
}
