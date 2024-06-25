import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/financial_info_model.dart';

class LocalDataSource {
  Future<FinancialInfoModel> getFinancialInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final json = prefs.getString('financial_info');
      if (json == null) {
        throw Exception('No data found');
      }
      return FinancialInfoModel.fromJson(jsonDecode(json));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> saveFinancialInfo(FinancialInfoModel info) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('financial_info', jsonEncode(info.toJson()));
  }
}
