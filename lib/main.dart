import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/phone_login_page.dart';
import 'firebase_options.dart'; // Firebase configuration file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp()); // ✅ Add const
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Auth App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PhoneLoginPage(), // ✅ Add const
      debugShowCheckedModeBanner: false,
    );
  }
}
