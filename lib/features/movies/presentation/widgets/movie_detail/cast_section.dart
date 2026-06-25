import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CastSection extends StatelessWidget {
  final List<dynamic> cast;
  final List<dynamic> crew;

  const CastSection({super.key, required this.cast, required this.crew});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (cast.isEmpty && crew.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (crew.isNotEmpty) ...[
          Text('Director',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...crew
              .where((c) => c['job'] == 'Director')
              .map((d) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(d['name'] ?? '',
                        style: theme.textTheme.bodyMedium),
                  )),
          const SizedBox(height: 16),
        ],
        if (cast.isNotEmpty) ...[
          Text('Cast',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cast.length > 10 ? 10 : cast.length,
              itemBuilder: (context, index) {
                final person = cast[index];
                final profilePath = person['profile_path'] as String? ?? '';
                final name = person['name'] as String? ?? '';
                final character = person['character'] as String? ?? '';
                final personId = person['id'] as int;

                return GestureDetector(
                  onTap: () => context.push('/person/$personId',
                      extra: {'name': name, 'profilePath': profilePath}),
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: profilePath.isNotEmpty
                              ? NetworkImage(
                                  'https://image.tmdb.org/t/p/w185$profilePath')
                              : null,
                          child: profilePath.isEmpty
                              ? const Icon(Icons.person, size: 28)
                              : null,
                        ),
                        const SizedBox(height: 4),
                        Text(name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 11)),
                        if (character.isNotEmpty)
                          Text(character,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: theme.hintColor)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
