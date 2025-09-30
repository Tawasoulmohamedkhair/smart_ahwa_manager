import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/domin/controllers/ahwa_manager_app.dart';
import 'package:smart_ahwa_manager/domin/entities/order.dart';
import 'package:smart_ahwa_manager/presentation/screens/dashboard_screen.dart';

class HomeScreenController {
  final AhwaManagerApp appController;
  final VoidCallback refreshUI;
  final BuildContext context;

  HomeScreenController({
    required this.appController,
    required this.refreshUI,
    required this.context,
  });

  void addOrder(
    TextEditingController nameController,
    TextEditingController drinkController,
    TextEditingController specialcontroller,
  ) {
    if (nameController.text.isEmpty || drinkController.text.isEmpty) return;

    final order = Order(
      customerName: nameController.text,
      drinkType: drinkController.text,
      specialInstructions: specialcontroller.text,
    );

    appController.addOrder(order);
    log('Order added via UI: ${order.customerName} - ${order.drinkType}');

    refreshUI();

    nameController.clear();
    drinkController.clear();
    specialcontroller.clear();
  }

  void completeOrder(Order order) {
    appController.completeOrder(order);
    log('Order completed via UI: ${order.customerName} - ${order.drinkType}');
    refreshUI();
  }

  void goToDashboard() {
    log('Navigating to Dashboard');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(appController: appController),
      ),
    );
  }
}
