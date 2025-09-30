
import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/domin/entities/order.dart';

class PendingOrdersListHome extends StatelessWidget {
  final List<Order> pendingOrders;
  final void Function(Order) onComplete;

  const PendingOrdersListHome({
    super.key,
    required this.pendingOrders,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: pendingOrders.isEmpty
          ? const Center(child: Text('No pending orders'))
          : ListView.builder(
              itemCount: pendingOrders.length,
              itemBuilder: (context, index) {
                final order = pendingOrders[index];
                return Card(
                  child: ListTile(
                    title: Text('${order.customerName} - ${order.drinkType}'),
                    subtitle: Text(order.specialInstructions),
                    trailing: IconButton(
                      icon: const Icon(Icons.check, color: Colors.green),
                      onPressed: () => onComplete(order),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
