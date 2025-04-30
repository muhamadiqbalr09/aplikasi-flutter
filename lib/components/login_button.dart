import 'package:flutter/material.dart';
import 'package:iqbal/DashboardScreen.dart';

class login_button extends StatelessWidget {
  const login_button({
    super.key,
    required this.text,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) : _emailController = emailController, _passwordController = passwordController;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Map<String, String> data = {
          'email': _emailController.text,
          'password': _passwordController.text,
        };
    
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder:(context, animation, secondaryAnimation) => DashboardScreen(data: data),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(text),
    );
  }
}
