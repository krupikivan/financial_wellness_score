import 'package:financial_wellness_score/data/repositories/financial_repository.dart';

import '../../domain/entities/financial_info.dart';
import '../../utils/enum.dart';

class FinancialService {
  FinancialService(this.repository);
  final FinancialRepository repository;

  Future<FinancialStatus> calculateFinancialHealth(FinancialInfo info) async {
    try {
      final annualNetCompensation = info.annualIncome * 0.92;
      final annualCosts = info.monthlyCosts * 12;
      await Future.delayed(const Duration(seconds: 2));
      if (annualCosts <= 0.25 * annualNetCompensation) {
        return FinancialStatus.healthy;
      } else if (annualCosts <= 0.75 * annualNetCompensation) {
        return FinancialStatus.medium;
      } else {
        return FinancialStatus.low;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
