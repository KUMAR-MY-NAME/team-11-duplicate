import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/phone_auth_service.dart' as auth_service;
import 'phone_login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = auth_service.PhoneAuthService();

    // Example chat list (replace with real data later)
    final List<Map<String, String>> chats = []; // Simulate empty for now

    return Scaffold(
      backgroundColor: const Color(0xFFE9F5F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "VoxCleanse",
          style: GoogleFonts.montserrat(
            color: const Color(0xFF2E3A59),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Color(0xFF4C9F70)),
            tooltip: "Logout",
            onPressed: () {
              auth.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const PhoneLoginPage()),
              );
            },
          ),
        ],
      ),
      body: chats.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat_bubble_outline,
                      size: 80, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  Text(
                    "No chats available",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFF4C9F70),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    chat['name'] ?? "User",
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(chat['lastMessage'] ?? ""),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // TODO: Navigate to chat screen
                  },
                );
              },
            ),
    );
  }
}
