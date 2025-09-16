import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_authflow/presentation/feature/auth/view/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supabase Auth Flow',
      home: LoginScreen(),
    );
  }
}

