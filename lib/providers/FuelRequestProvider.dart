import 'package:flutter/cupertino.dart';

class FuelRequestProvider extends ChangeNotifier {
  int _tankCount = 0;
  int _deliveryDeadline = 0;
  String _preferredFuelCompany = '';
  String _paymentMethod = ''; // Payment method field
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _deliveryChargesController =
      TextEditingController(); // Delivery charges controller
  final TextEditingController _pricePerTankController =
      TextEditingController(); // Price per tank controller

  // Getters
  int get tankCount => _tankCount;
  int get deliveryDeadline => _deliveryDeadline;
  String get preferredFuelCompany => _preferredFuelCompany;
  String get paymentMethod => _paymentMethod;
  TextEditingController get locationController => _locationController;
  TextEditingController get deliveryChargesController =>
      _deliveryChargesController;
  TextEditingController get pricePerTankController => _pricePerTankController;

  // Methods to handle tank count
  void incrementTank() {
    _tankCount++;
    notifyListeners();
  }

  void decrementTank() {
    if (_tankCount > 0) {
      _tankCount--;
      notifyListeners();
    }
  }

  // Methods to handle delivery deadline
  void incrementDeadline() {
    _deliveryDeadline++;
    notifyListeners();
  }

  void decrementDeadline() {
    if (_deliveryDeadline > 0) {
      _deliveryDeadline--;
      notifyListeners();
    }
  }

  // Update preferred fuel company
  void updatePreferredFuelCompany(String company) {
    _preferredFuelCompany = company;
    notifyListeners();
  }

  // Update payment method
  void updatePaymentMethod(String method) {
    _paymentMethod = method;
    notifyListeners();
  }

  // Fill location text
  void fillLocation(String location) {
    _locationController.text = location;
    notifyListeners();
  }

  // Fill delivery charges
  void fillDeliveryCharges(String charges) {
    _deliveryChargesController.text = charges;
    notifyListeners();
  }

  // Fill price per tank
  void fillPricePerTank(String price) {
    _pricePerTankController.text = price;
    notifyListeners();
  }

  // Form validation
  bool isFormValid() {
    return locationController.text.isNotEmpty &&
        tankCount > 0 &&
        deliveryDeadline > 0 &&
        preferredFuelCompany.isNotEmpty &&
        paymentMethod.isNotEmpty;
  }
}
