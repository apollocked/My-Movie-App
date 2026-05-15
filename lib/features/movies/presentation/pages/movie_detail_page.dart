import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(movie.fullBackdropUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox()),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title,
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 10),
                Text(movie.overview,
                    style:
                        const TextStyle(fontSize: 14, color: Colors.white70)),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: CircleAvatar(
                backgroundColor: Colors.black45,
                child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context))),
          )
        ],
      ),
    );
  }
}
