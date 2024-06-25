import 'package:financial_wellness_score/providers.dart';
import 'package:financial_wellness_score/utils/enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../setup/test_helpers.dart';
import '../setup/test_helpers.mocks.dart';

void main() {
  late MockFinancialService mockFinancialService;
  late MockFinancialInfo mockFinancialInfo;
  late final ProviderContainer container;
  setUpAll(
    () {
      mockFinancialService = registerFinancialServiceMock();
      mockFinancialInfo = registerFinancialInfoMock();
      container = ProviderContainer(
        overrides: [
          financialServiceProvider.overrideWithValue(mockFinancialService),
        ],
      );
    },
  );
  tearDownAll(() {
    container.dispose();
  });
  group('Financial Controller', () {
    setUp(() {
      when(mockFinancialInfo.annualIncome).thenReturn(52000);
    });
    test(
        'should return a correct low value when calculateFinancialHealth is called with high monthly costs',
        () async {
      when(mockFinancialInfo.monthlyCosts).thenReturn(3150);
      when(mockFinancialService.calculateFinancialHealth(mockFinancialInfo))
          .thenAnswer((_) async => FinancialStatus.low);
      const expected = FinancialStatus.low;
      await container
          .read(financialControllerProvider.notifier)
          .calculateFinancialHealth(mockFinancialInfo);
      final state = container.read(financialControllerProvider);
      expect(state.value, expected);
    });

    test(
        'should return a correct medium value when calculateFinancialHealth is called with medium monthly costs',
        () async {
      when(mockFinancialInfo.monthlyCosts).thenReturn(1500);
      when(mockFinancialService.calculateFinancialHealth(mockFinancialInfo))
          .thenAnswer((_) async => FinancialStatus.medium);
      const expected = FinancialStatus.medium;
      await container
          .read(financialControllerProvider.notifier)
          .calculateFinancialHealth(mockFinancialInfo);
      final state = container.read(financialControllerProvider);
      expect(state.value, expected);
    });

    test(
        'should return a correct healthy value when calculateFinancialHealth is called with low monthly costs',
        () async {
      when(mockFinancialInfo.monthlyCosts).thenReturn(500);
      when(mockFinancialService.calculateFinancialHealth(mockFinancialInfo))
          .thenAnswer((_) async => FinancialStatus.healthy);
      const expected = FinancialStatus.healthy;
      await container
          .read(financialControllerProvider.notifier)
          .calculateFinancialHealth(mockFinancialInfo);
      final state = container.read(financialControllerProvider);
      expect(state.value, expected);
    });
  });
}
