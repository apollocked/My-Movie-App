import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/network/connectivity_cubit/connectivity_cubit.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/common/ui/offline_banner.dart';

class OfflineWrapper extends StatelessWidget {
  final Widget? child;

  const OfflineWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listenWhen: (prev, cur) =>
          prev is ConnectivityOnline && cur is ConnectivityOffline,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(t.connectivity.offline_banner),
          backgroundColor: AppColors.errorRed.withValues(alpha: 0.9),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ));
      },
      child: Column(
        children: [
          const OfflineBanner(),
          Expanded(child: child ?? const SizedBox.shrink()),
        ],
      ),
    );
  }
}