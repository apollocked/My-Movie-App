import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/network/connectivity_cubit/connectivity_cubit.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/localization/strings.g.dart';

/// Screen displayed when user has no internet connection
///
/// This page shows a user-friendly message reminding them that an internet
/// connection is required for the app to function. It continuously checks
/// for connectivity and automatically navigates back when connection is restored.
class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: BlocListener<ConnectivityCubit, ConnectivityState>(
        listener: (context, state) {
          // Automatically pop when connection is restored
          if (state is ConnectivityOnline) {
            Navigator.of(context).pop();
          }
        },
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Offline icon with theme-based background
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.getOfflineBgColor(isDarkMode),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.wifi_off_rounded,
                      size: 60,
                      color: AppColors.errorRed,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Title - uses theme primary text color
                  Text(
                    t.connectivity.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                  ),
                  const SizedBox(height: 16),

                  // Description - uses theme secondary text color
                  Text(
                    t.connectivity.description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: isDarkMode
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                          height: 1.5,
                        ),
                  ),
                  const SizedBox(height: 32),

                  // Helpful hints container with theme colors
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.getInfoBgColor(isDarkMode),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.getInfoBorderColor(isDarkMode),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.connectivity.troubleshooting_title,
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode
                                        ? AppColors.textPrimaryDark
                                        : AppColors.textPrimaryLight,
                                  ),
                        ),
                        const SizedBox(height: 12),
                        _buildTip(context, isDarkMode,
                            t.connectivity.tips.airplane_mode),
                        const SizedBox(height: 8),
                        _buildTip(context, isDarkMode,
                            t.connectivity.tips.check_data),
                        const SizedBox(height: 8),
                        _buildTip(context, isDarkMode,
                            t.connectivity.tips.move_closer),
                        const SizedBox(height: 8),
                        _buildTip(context, isDarkMode,
                            t.connectivity.tips.restart_device),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Retry button - uses theme primary color
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Trigger connectivity check
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              t.connectivity.check_connection,
                              style: TextStyle(
                                color: isDarkMode
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimaryLight,
                              ),
                            ),
                            backgroundColor: isDarkMode
                                ? AppColors.darkSurfaceVariant
                                : AppColors.lightSurfaceVariant,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.refresh_rounded),
                      label: Text(t.connectivity.retry),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryRed,
                        foregroundColor: AppColors.textPrimaryLight,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Loading indicator for connection status
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primaryRed,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Checking connection...',
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: isDarkMode
                                        ? AppColors.textTertiaryDark
                                        : AppColors.textTertiaryLight,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Build individual tip text with theme colors
  Widget _buildTip(BuildContext context, bool isDarkMode, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isDarkMode
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
    );
  }
}
