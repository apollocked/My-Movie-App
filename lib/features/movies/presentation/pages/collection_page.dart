import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_app/core/localization/app_strings.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_cubit.dart';
import '../widgets/collection_grid.dart';
import '../widgets/collection_empty_state.dart';

class CollectionPage extends StatelessWidget {
  final String title;
  final String collectionPath;

  const CollectionPage({super.key, required this.title, required this.collectionPath});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final locale = context.watch<SettingsCubit>().state.locale;
    final translatedTitle = AppStrings.getTitle(title, locale);

    if (uid == null) {
      return Scaffold(
        appBar: AppBar(title: Text(translatedTitle)),
        body: const Center(child: Text('Please log in to view your collection')),
      );
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(translatedTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(uid).collection(collectionPath)
            .orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (snapshot.hasError) return _fallbackList(uid, locale);
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return CollectionEmptyState(locale: locale);
          return CollectionGrid(docs: snapshot.data!.docs, collectionPath: collectionPath);
        },
      ),
    );
  }

  Widget _fallbackList(String uid, Locale locale) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(uid).collection(collectionPath).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return CollectionEmptyState(locale: locale);
        return CollectionGrid(docs: snapshot.data!.docs, collectionPath: collectionPath);
      },
    );
  }
}
