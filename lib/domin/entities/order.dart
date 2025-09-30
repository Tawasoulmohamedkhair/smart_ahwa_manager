import 'dart:developer';

class Order {
  String _customerName;
  String _drinkType;
  String _specialInstructions;
  bool _isCompleted;

  Order({
    required String customerName,
    required String drinkType,
    String specialInstructions = '',
    bool isCompleted = false,
  }) : _customerName = customerName,
       _drinkType = drinkType,
       _specialInstructions = specialInstructions,
       _isCompleted = isCompleted;

  String get customerName => _customerName;
  String get drinkType => _drinkType;
  String get specialInstructions => _specialInstructions;
  bool get isCompleted => _isCompleted;

  set customerName(String value) => _customerName = value;
  set drinkType(String value) => _drinkType = value;
  set specialInstructions(String value) => _specialInstructions = value;

  void markCompleted() {
    _isCompleted = true;
    log('Order marked completed: $_customerName - $_drinkType');
  }
}
