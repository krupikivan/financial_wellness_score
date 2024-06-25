import 'package:financial_wellness_score/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
  });
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: AppTextTheme.black.bodySmall,
          ),
          const SizedBox(height: 7),
          TextFormField(
            controller: controller,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
            style: AppTextTheme.dark.headlineMedium,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.attach_money,
                color: Color(0xFFCBD5DC),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFCBD5DC),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFCBD5DC),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
