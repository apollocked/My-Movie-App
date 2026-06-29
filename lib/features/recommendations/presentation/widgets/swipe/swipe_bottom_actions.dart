import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'swipe_action_button.dart';

class SwipeBottomActions extends StatelessWidget {
  final bool isTv;
  final int? currentMovieId;
  final dynamic currentMovie;
  final VoidCallback onSkip;
  final VoidCallback onSave;

  const SwipeBottomActions({
    super.key,
    required this.isTv,
    this.currentMovieId,
    this.currentMovie,
    required this.onSkip,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          Expanded(
            child: AnimatedButton(
              text: t.swipe.skip,
              onPressed: onSkip,
              icon: Icons.close_rounded,
              height: 52,
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            height: 52,
            child: SwipeActionButton(
              icon: Icons.info_outline_rounded,
              color: AppColors.infoCyan,
              size: 52,
              onTap: () {
                if (currentMovie != null) {
                  if (isTv) {
                    context.push('/show/$currentMovieId',
                        extra: currentMovie);
                  } else {
                    context.push('/movie/$currentMovieId',
                        extra: currentMovie);
                  }
                }
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: AnimatedButton(
              text: t.swipe.save,
              onPressed: onSave,
              icon: Icons.bookmark_rounded,
              height: 52,
              backgroundColor: AppColors.successGreen,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
