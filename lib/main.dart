import 'package:flutter/material.dart';
import 'package:kerwel/auth/presentation/RegisterScreen.dart';

import 'auth/presentation/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen()
      },
      initialRoute: '/login',
    );
  }
}




