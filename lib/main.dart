import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_authflow/presentation/feature/auth/view/login_screen.dart';
import 'package:supabase_authflow/presentation/feature/auth/view_model/auth_vm.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ukzeozfpfmhklmithzzq.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVremVvemZwZm1oa2xtaXRoenpxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgwMjI3NzUsImV4cCI6MjA3MzU5ODc3NX0.NErrlzSN3yyiF5x2m-GpAPo30A93igCvc_9C7BVehN4',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthVm()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Supabase Auth Flow',
        home: LoginScreen(),
      ),
    );
  }
}

