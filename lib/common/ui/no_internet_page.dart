import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/network/connectivity_cubit/connectivity_cubit.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/common/ui/no_internet_tips_card.dart';
import 'package:my_movie/common/ui/no_internet_retry_section.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: BlocListener<ConnectivityCubit, ConnectivityState>(
        listener: (context, state) {
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
                  NoInternetTipsCard(isDarkMode: isDarkMode),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => context.go('/collection/watch_later'),
                      icon: const Icon(Icons.bookmark_outline_rounded, size: 20),
                      label: Text(t.connectivity.browse_watch_later),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        side: BorderSide(color: AppColors.infoCyan.withValues(alpha: 0.5), width: 1.5),
                        foregroundColor: AppColors.infoCyan,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  NoInternetRetrySection(isDarkMode: isDarkMode),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
