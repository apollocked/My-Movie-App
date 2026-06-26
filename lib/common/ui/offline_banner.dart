import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/network/connectivity_cubit/connectivity_cubit.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/localization/strings.g.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityOffline) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.errorRed.withValues(alpha: 0.9),
            child: Row(
              children: [
                const Icon(Icons.wifi_off_rounded, color: Colors.white, size: 16),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    t.connectivity.offline_banner,
                    style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
