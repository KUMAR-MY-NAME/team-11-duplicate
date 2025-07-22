import 'package:flutter/material.dart';
import 'home_page.dart';
import '../services/phone_auth_service.dart';

class OtpPage extends StatefulWidget {
  final String verificationId;

  const OtpPage({super.key, required this.verificationId});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController otpController = TextEditingController();
  final PhoneAuthService phoneAuthService = PhoneAuthService();

  void verifyOtp() {
    final code = otpController.text.trim();

    phoneAuthService.signInWithSmsCode(
      widget.verificationId,
      code,
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      },
      (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $error")));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: otpController,
              decoration: const InputDecoration(labelText: "OTP"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: verifyOtp, child: const Text("Verify"))
          ],
        ),
      ),
    );
  }
}
