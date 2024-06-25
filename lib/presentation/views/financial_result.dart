import 'package:financial_wellness_score/utils/enum.dart';
import 'package:flutter/material.dart';

import '../../theme/app_text_theme.dart';
import '../widgets/encrypted_description.dart';
import '../widgets/financial_result_headline.dart';
import '../widgets/main_app_bar.dart';

class FinancialResult extends StatelessWidget {
  const FinancialResult({super.key, required this.result});
  final FinancialStatus result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      backgroundColor: const Color(0xFFF4F8FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Here\'s your',
                  style: AppTextTheme.primary.titleMedium,
                  children: [
                    TextSpan(
                      text: ' financial wellness score.',
                      style: AppTextTheme.primary.titleLarge,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/image_1.png',
                      height: 50,
                    ),
                    const SizedBox(height: 10),
                    FinancialResultHeadline(
                      status: result,
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      child: const Text(
                        'Return',
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const EncryptedDescription(),
            ],
          ),
        ),
      ),
    );
  }
}
