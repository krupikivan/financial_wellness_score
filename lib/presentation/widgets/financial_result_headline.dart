import 'package:flutter/material.dart';

import '../../theme/app_text_theme.dart';
import '../../utils/enum.dart';
import 'custom_progress_bar.dart';

class FinancialResultHeadline extends StatelessWidget {
  const FinancialResultHeadline({
    super.key,
    required this.status,
  });
  final FinancialStatus status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProgressBar(
          status: status,
          color: _getColor(),
        ),
        const SizedBox(height: 10),
        Text(
          _getStatusResult(),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Your financial wellness score is',
          style: AppTextTheme.dark.bodyMedium,
        ),
        Text(
          _getStatusLabel(),
          style: AppTextTheme.dark.bodyLarge,
        ),
      ],
    );
  }

  String _getStatusResult() {
    switch (status) {
      case FinancialStatus.healthy:
        return 'Congratulations!';
      case FinancialStatus.medium:
        return 'There is room for improvement.';
      case FinancialStatus.low:
        return 'Caution!';
      default:
        return 'Unknown';
    }
  }

  String _getStatusLabel() {
    switch (status) {
      case FinancialStatus.healthy:
        return 'Healthy';
      case FinancialStatus.medium:
        return 'Average';
      case FinancialStatus.low:
        return 'Unhealthy';
      default:
        return 'Unknown';
    }
  }

  Color _getColor() {
    switch (status) {
      case FinancialStatus.healthy:
        return Colors.green;
      case FinancialStatus.medium:
        return Colors.yellow;
      case FinancialStatus.low:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
