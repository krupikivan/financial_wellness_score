import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/services/financial_service.dart';
import '../../domain/entities/financial_info.dart';
import '../../utils/enum.dart';

class FinancialController extends StateNotifier<AsyncValue<FinancialStatus?>> {
  FinancialController(this.service) : super(const AsyncValue.data(null));
  final FinancialService service;

  Future<void> calculateFinancialHealth(FinancialInfo info) async {
    state = const AsyncValue.loading();
    try {
      final result = await service.calculateFinancialHealth(info);
      state = AsyncValue.data(result);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
