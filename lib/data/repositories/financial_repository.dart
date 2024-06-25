import '../data_source/local_data_source.dart';
import '../models/financial_info_model.dart';

class FinancialRepository {
  FinancialRepository(this.localDataSource);
  final LocalDataSource localDataSource;

  Future<FinancialInfoModel> getFinancialInfo() async {
    return await localDataSource.getFinancialInfo();
  }

  Future<void> saveFinancialInfo(FinancialInfoModel info) async {
    await localDataSource.saveFinancialInfo(info);
  }
}
