import 'package:financial_wellness_score/data/models/financial_info_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../setup/test_helpers.dart';
import '../setup/test_helpers.mocks.dart';

void main() {
  late MockLocalDataSource mockLocalDataSource;
  setUp(() {
    mockLocalDataSource = registerLocalDataSourceMock();
  });
  group('Local Data Source', () {
    const responseModel = FinancialInfoModel(
      annualIncome: 0,
      monthlyCosts: 0,
    );
    setUp(() {
      when(mockLocalDataSource.getFinancialInfo()).thenAnswer(
        (_) async => responseModel,
      );
    });
    test('should return a FinancialInfoModel when getFinancialInfo is called',
        () async {
      final result = await mockLocalDataSource.getFinancialInfo();
      expect(result, responseModel);
    });
  });
}
