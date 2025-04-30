import 'package:flutter/material.dart';
import 'package:iqbal/ProfileScreen.dart';

class DashboardScreen extends StatelessWidget {
  final Map<String, String>? data;
  const DashboardScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final String email = data?['email'] ?? 'No email provided';

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100,),
              Text(
                'Welcome to Your Dashboard!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Map<String, String> data = {'email': email};

                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => ProfileChange(data: data),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}