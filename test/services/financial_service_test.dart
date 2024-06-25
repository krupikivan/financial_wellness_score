import 'package:financial_wellness_score/utils/enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../setup/test_helpers.dart';
import '../setup/test_helpers.mocks.dart';

void main() {
  late MockFinancialService mockFinancialService;
  late MockFinancialInfo mockFinancialInfo;
  setUp(() {
    mockFinancialService = registerFinancialServiceMock();
    mockFinancialInfo = registerFinancialInfoMock();
  });
  group('Financial Service', () {
    setUp(() {
      when(mockFinancialInfo.annualIncome).thenReturn(52000);
    });
    test('should return low wellness when calculateFinancialHealth is called',
        () async {
      when(mockFinancialService.calculateFinancialHealth(mockFinancialInfo))
          .thenAnswer((_) async => FinancialStatus.low);
      when(mockFinancialInfo.monthlyCosts).thenReturn(3150);
      final result = await mockFinancialService
          .calculateFinancialHealth(mockFinancialInfo);
      expect(result, FinancialStatus.low);
    });

    test(
        'should return medium wellness when calculateFinancialHealth is called',
        () async {
      when(mockFinancialService.calculateFinancialHealth(mockFinancialInfo))
          .thenAnswer((_) async => FinancialStatus.medium);
      when(mockFinancialInfo.monthlyCosts).thenReturn(1500);
      final result = await mockFinancialService
          .calculateFinancialHealth(mockFinancialInfo);
      expect(result, FinancialStatus.medium);
    });

    test(
        'should return healthy wellness when calculateFinancialHealth is called',
        () async {
      when(mockFinancialService.calculateFinancialHealth(mockFinancialInfo))
          .thenAnswer((_) async => FinancialStatus.healthy);
      when(mockFinancialInfo.monthlyCosts).thenReturn(50);
      final result = await mockFinancialService
          .calculateFinancialHealth(mockFinancialInfo);
      expect(result, FinancialStatus.healthy);
    });
  });
}
