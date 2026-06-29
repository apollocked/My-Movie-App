import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_card.dart';

class FilterShuffleCard extends StatelessWidget {
  final bool isShuffled;
  final ValueChanged<bool> onChanged;

  const FilterShuffleCard({
    super.key,
    required this.isShuffled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FilterCard(
      children: [
        Row(
          children: [
            Icon(Icons.shuffle_rounded, size: 20, color: Theme.of(context).colorScheme.onSurfaceVariant),
            const SizedBox(width: 12),
            Text(t.swipe.shuffle, style: Theme.of(context).textTheme.bodyLarge),
            const Spacer(),
            Switch(value: isShuffled, onChanged: onChanged),
          ],
        ),
      ],
    );
  }
}
