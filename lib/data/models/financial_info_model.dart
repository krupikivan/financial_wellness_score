import 'package:freezed_annotation/freezed_annotation.dart';

part 'financial_info_model.freezed.dart';
part 'financial_info_model.g.dart';

@freezed
class FinancialInfoModel with _$FinancialInfoModel {
  const factory FinancialInfoModel({
    required double annualIncome,
    required double monthlyCosts,
  }) = _FinancialInfoModel;

  factory FinancialInfoModel.fromJson(Map<String, dynamic> json) =>
      _$FinancialInfoModelFromJson(json);
}
