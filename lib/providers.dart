import 'package:financial_wellness_score/utils/enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'application/services/financial_service.dart';
import 'data/data_source/local_data_source.dart';
import 'data/repositories/financial_repository.dart';
import 'presentation/controllers/financial_controller.dart';

// Provider for LocalDataSource
final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  return LocalDataSource();
});

// Provider for FinancialRepository
final financialRepositoryProvider = Provider<FinancialRepository>((ref) {
  final localDataSource = ref.watch(localDataSourceProvider);
  return FinancialRepository(localDataSource);
});

// Provider for FinancialService
final financialServiceProvider = Provider<FinancialService>((ref) {
  final financialRepository = ref.watch(financialRepositoryProvider);
  return FinancialService(financialRepository);
});

// FinancialController Provider
final financialControllerProvider =
    StateNotifierProvider<FinancialController, AsyncValue<FinancialStatus?>>(
  (ref) => FinancialController(ref.watch(financialServiceProvider)),
);
