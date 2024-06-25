import 'package:financial_wellness_score/application/services/financial_service.dart';
import 'package:financial_wellness_score/data/data_source/local_data_source.dart';
import 'package:financial_wellness_score/data/repositories/financial_repository.dart';
import 'package:financial_wellness_score/domain/entities/financial_info.dart';
import 'package:financial_wellness_score/presentation/controllers/financial_controller.dart';
import 'package:mockito/annotations.dart';

import 'test_helpers.mocks.dart';

@GenerateMocks(
  [
    LocalDataSource,
    FinancialRepository,
    FinancialService,
    FinancialInfo,
  ],
)
MockLocalDataSource registerLocalDataSourceMock() {
  final mockService = MockLocalDataSource();
  return mockService;
}

MockFinancialRepository registerFinancialRepositoryMock() {
  final mockService = MockFinancialRepository();
  return mockService;
}

MockFinancialService registerFinancialServiceMock() {
  final mockService = MockFinancialService();
  return mockService;
}

MockFinancialInfo registerFinancialInfoMock() {
  final mockService = MockFinancialInfo();
  return mockService;
}
