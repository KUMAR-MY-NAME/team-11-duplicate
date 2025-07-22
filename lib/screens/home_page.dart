import 'package:flutter/material.dart';
import '../services/phone_auth_service.dart' as auth_service;
import 'phone_login_page.dart'; // ✅ Don't use 'show' unless you're sure the class exists

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = auth_service.PhoneAuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("You're Logged In"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              auth.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const PhoneLoginPage()),
              );
            },
          )
        ],
      ),
      body: const Center(child: Text("Welcome!")),
    );
  }
}
