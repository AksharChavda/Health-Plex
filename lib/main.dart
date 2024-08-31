import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xwdvfnalftpuvfkxxsat.supabase.co/',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh3ZHZmbmFsZnRwdXZma3h4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUwODQ0OTcsImV4cCI6MjA0MDY2MDQ5N30.bA6TnFZd2fHZDnK6lnBuDfsgtRD3OEd4CAAeyIgs3fw',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slot Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
