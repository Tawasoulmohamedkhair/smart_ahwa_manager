import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/domin/controllers/ahwa_manager_app.dart';
import 'package:smart_ahwa_manager/presentation/widget/order_list_card.dart';
import 'package:smart_ahwa_manager/presentation/widget/top_drinks_card.dart';

class DashboardScreen extends StatefulWidget {
  final AhwaManagerApp appController;

  const DashboardScreen({super.key, required this.appController});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              OrderCardList(
                title: 'Total Orders',
                count: widget.appController.getTotalOrders(),
                color: Colors.blue[50],
                icon: Icons.receipt_long,
              ),
              const SizedBox(height: 10),

              OrderCardList(
                title: 'Pending Orders',
                orders: widget.appController.getPendingOrders(),
                color: Colors.orange[50],
                showCompleteButton: true,
                onComplete: (order) {
                  setState(() {
                    widget.appController.completeOrder(order);
                  });
                },
              ),
              const SizedBox(height: 10),

              OrderCardList(
                title: 'Completed Orders',
                orders: widget.appController.getCompletedOrders(),
                color: Colors.green[50],
              ),

              const SizedBox(height: 10),

              TopDrinksCard(
                topDrinks: widget.appController.getTopSellingDrinks(),
                totalOrders: widget.appController.getTotalOrders(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
