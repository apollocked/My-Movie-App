import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class SearchHistorySection extends StatelessWidget {
  final List<String> history;
  final VoidCallback onClear;
  final ValueChanged<String> onRemove;
  final ValueChanged<String> onTap;

  const SearchHistorySection({
    super.key,
    required this.history,
    required this.onClear,
    required this.onRemove,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 4, height: 18,
                    decoration: BoxDecoration(gradient: AppColors.primaryGradient, borderRadius: BorderRadius.circular(2)),
                  ),
                  const SizedBox(width: 10),
                  Text('Recent Searches', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                ],
              ),
              TextButton(
                onPressed: onClear,
                style: TextButton.styleFrom(foregroundColor: AppColors.textTertiaryDark),
                child: const Text('Clear', style: TextStyle(fontSize: 13)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: (history.length * 56.0).clamp(0, 224),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: history.length,
            itemBuilder: (context, index) {
              final query = history[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(Icons.history_rounded, color: AppColors.textTertiaryDark, size: 20),
                title: Text(query, style: theme.textTheme.bodyMedium?.copyWith(color: theme.textTheme.bodyLarge?.color)),
                trailing: IconButton(
                  icon: const Icon(Icons.close, size: 16),
                  color: AppColors.textTertiaryDark,
                  onPressed: () => onRemove(query),
                ),
                onTap: () => onTap(query),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              );
            },
          ),
        ),
      ],
    );
  }
}
