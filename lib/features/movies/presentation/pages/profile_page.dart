import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle,
                size: 80, color: Color(0xFFD4AF37)),
            const SizedBox(height: 16),
            const Text('Join the Community',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 8),
              child: Text(
                  'Create an account to keep track of your liked videos, specific metrics scores, and personalized watch-laters list.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {}, child: const Text('Sign Up / Login')),
          ],
        ),
      ),
    );
  }
}
