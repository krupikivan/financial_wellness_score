String? incomeValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your annual income';
  }
  if (double.tryParse(value) == null || double.parse(value) <= 0) {
    return 'Please enter a valid number greater than zero';
  }
  return null;
}

String? costValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your monthly costs';
  }
  if (double.tryParse(value) == null || double.parse(value) <= 0) {
    return 'Please enter a valid number greater than zero';
  }
  return null;
}
