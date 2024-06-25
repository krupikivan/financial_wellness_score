import 'package:financial_wellness_score/presentation/widgets/encrypted_description.dart';
import 'package:financial_wellness_score/presentation/widgets/input_form.dart';
import 'package:financial_wellness_score/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/financial_info.dart';
import '../../providers.dart';
import '../../theme/app_text_theme.dart';
import '../../utils/routes.dart';
import '../widgets/main_app_bar.dart';

final _formKey = GlobalKey<FormState>();

class FinancialForm extends HookConsumerWidget {
  const FinancialForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incomeController = useTextEditingController();
    final costsController = useTextEditingController();
    final state = ref.watch(financialControllerProvider);
    final isLoading = state is AsyncLoading<void>;
    ref.listen(
      financialControllerProvider,
      (_, state) => state.whenOrNull(
        data: (data) {
          Navigator.pushNamed(
            context,
            Routes.financialResult,
            arguments: data,
          );
        },
      ),
    );
    return Scaffold(
      appBar: const MainAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RichText(
                  text: TextSpan(
                    text: 'Let\'s find out your',
                    style: AppTextTheme.primary.titleMedium,
                    children: [
                      TextSpan(
                        text: ' financial wellness score.',
                        style: AppTextTheme.primary.titleLarge,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/image_1.png',
                      height: 48,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Financial wellness test',
                      style: AppTextTheme.black.headlineSmall,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Enter your financial information below',
                      style: AppTextTheme.light.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputForm(
                            labelText: 'Annual income',
                            controller: incomeController,
                            validator: incomeValidator,
                          ),
                          InputForm(
                            labelText: 'Monthly Costs',
                            controller: costsController,
                            validator: costValidator,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (!isLoading &&
                                  _formKey.currentState!.validate()) {
                                final annualIncome =
                                    double.parse(incomeController.text);
                                final monthlyCosts =
                                    double.parse(costsController.text);
                                ref
                                    .read(financialControllerProvider.notifier)
                                    .calculateFinancialHealth(
                                      FinancialInfo(
                                        annualIncome: annualIncome,
                                        monthlyCosts: monthlyCosts,
                                      ),
                                    );
                              }
                            },
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Continue',
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const EncryptedDescription(),
            ],
          ),
        ),
      ),
    );
  }
}
