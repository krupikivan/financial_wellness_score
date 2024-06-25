import 'package:financial_wellness_score/data/models/financial_info_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../setup/test_helpers.dart';
import '../setup/test_helpers.mocks.dart';

void main() {
  late MockFinancialRepository mockFinancialRepository;
  setUp(() {
    mockFinancialRepository = registerFinancialRepositoryMock();
  });
  group('Financial Repository', () {
    const responseModel = FinancialInfoModel(
      annualIncome: 0,
      monthlyCosts: 0,
    );
    setUp(() {
      when(mockFinancialRepository.getFinancialInfo()).thenAnswer(
        (_) async => responseModel,
      );
    });
    test('should return a FinancialInfoModel when getFinancialInfo is called',
        () async {
      final result = await mockFinancialRepository.getFinancialInfo();
      expect(result, responseModel);
    });

    test('should save a FinancialInfoModel when saveFinancialInfo is called',
        () async {
      const info = FinancialInfoModel(
        annualIncome: 0,
        monthlyCosts: 0,
      );
      await mockFinancialRepository.saveFinancialInfo(info);
      verify(mockFinancialRepository.saveFinancialInfo(info));
    });
  });
}
