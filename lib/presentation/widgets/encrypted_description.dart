import 'package:flutter/material.dart';

class EncryptedDescription extends StatelessWidget {
  const EncryptedDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          const Icon(
            Icons.lock_outline_rounded,
            color: Color(0xFF8A9CA9),
            size: 24,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Your financial information is encrypted and secure. We\'ll never share or sell any of your personal data.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
